
# Databricks notebook source
# ============================================================
# Notebook Name : Migrate_SQLServer_DQLogging_To_CZ
# Purpose       : One-time full load of DQLogging
#                 from SQL Server into CZ Delta.
#
# Source        : SQL Server - dq_audit.DQLogging
# Target        : CZ Delta - dq_audit.DQLogging
# Load Type     : Full Load (OneTime)
# ============================================================


# COMMAND ----------
# Load existing utility notebooks.

# MAGIC %run "../utils/environment"


# COMMAND ----------
# MAGIC %run "../utils/sql/sql_utility"


# COMMAND ----------
# MAGIC %run "../utils/io_util"


# COMMAND ----------
# Import required libraries.

import os
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()


# COMMAND ----------
# ============================================================
# STEP 1: DEFINE ENVIRONMENT AND TABLES
# ============================================================

dbutils.widgets.text("ENVIRONMENT_NAME", "")

ENVIRONMENT_NAME = (
    dbutils.widgets.get("ENVIRONMENT_NAME").strip().upper()
)

if not ENVIRONMENT_NAME:
    raise Exception("ENVIRONMENT_NAME parameter is required.")

os.environ["ENVIRONMENT_NAME"] = ENVIRONMENT_NAME

SOURCE_TABLE = "dq_audit.DQLogging"
TARGET_TABLE = "dq_audit.DQLogging"

print(f"Environment  : {ENVIRONMENT_NAME}")
print(f"Source Table : {SOURCE_TABLE}")
print(f"Target Table : {TARGET_TABLE}")


# COMMAND ----------
# ============================================================
# STEP 2: AUTHENTICATE WITH CURATED STORAGE
# ============================================================

def connect_curated_storage():
    """
    Authenticate with Curated ADLS storage.
    """

    sp_name = f"SP_ADB_DAFCZ_{ENVIRONMENT_NAME}"
    storage_account_name = (
        f"dsapdafcz{ENVIRONMENT_NAME.lower()}adls1"
    )

    authenticate_storage(storage_account_name, sp_name)


connect_curated_storage()

print("CZ storage authentication successful.")


# COMMAND ----------
# ============================================================
# STEP 3: ESTABLISH SQL SERVER CONNECTION
# ============================================================

jdbc_url = get_jdbcUrl()

print("SQL Server JDBC connection configured.")


# COMMAND ----------
# ============================================================
# STEP 4: READ COMPLETE DATA FROM SQL SERVER
# ============================================================

source_df = (
    spark.read
    .format("jdbc")
    .option("url", jdbc_url)
    .option("dbtable", SOURCE_TABLE)
    .option("fetchsize", "10000")
    .load()
)


# COMMAND ----------
# ============================================================
# STEP 5: VALIDATE SOURCE DATA
# ============================================================

source_count = source_df.count()

print(f"SQL Server source record count: {source_count}")

if source_count == 0:
    raise Exception(
        "Source table is empty. Migration stopped."
    )


# COMMAND ----------
# ============================================================
# STEP 6: PERFORM FULL LOAD INTO CZ DELTA TABLE
# ============================================================

(
    source_df.write
    .format("delta")
    .mode("overwrite")
    .option("overwriteSchema", "true")
    .saveAsTable(TARGET_TABLE)
)

print(f"Full load completed for {TARGET_TABLE}.")


# COMMAND ----------
# ============================================================
# STEP 7: VALIDATE TARGET DATA
# ============================================================

target_count = spark.table(TARGET_TABLE).count()

print("----------------------------------------")
print("DQLogging Migration Validation")
print("----------------------------------------")
print(f"Environment   : {ENVIRONMENT_NAME}")
print(f"Source Table  : {SOURCE_TABLE}")
print(f"Target Table  : {TARGET_TABLE}")
print(f"Source Records: {source_count}")
print(f"Target Records: {target_count}")
print("----------------------------------------")


# COMMAND ----------
# ============================================================
# STEP 8: FINAL MIGRATION STATUS
# ============================================================

if source_count != target_count:
    raise Exception(
        f"Migration validation failed. "
        f"Source Count: {source_count}, "
        f"Target Count: {target_count}"
    )

print(
    f"SUCCESS: Full load of {SOURCE_TABLE} "
    f"into {TARGET_TABLE} completed successfully "
    f"for environment {ENVIRONMENT_NAME}."
)
