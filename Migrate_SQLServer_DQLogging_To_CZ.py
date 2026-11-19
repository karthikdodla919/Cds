# Databricks notebook source
# ============================================================
# Notebook Name : Migrate_SQLServer_DQLogging_To_CZ
# Purpose       : Perform a one-time full load of DQLogging
#                 from SQL Server into the CZ Delta table.
#
# Source        : SQL Server - dq_audit.DQLogging
# Target        : CZ Delta - main.curated.DQLogging
# Load Type     : Full Load (OneTime)
# ============================================================


# COMMAND ----------
# Load existing environment configuration.
# Provides environment-specific settings and variables.

# MAGIC %run "../utils/environment"


# COMMAND ----------
# Load SQL Server connection utility.
# Provides get_jdbcUrl() for JDBC connectivity.

# MAGIC %run "../utils/sql/sql_utility"


# COMMAND ----------
# Load existing ADLS authentication utility.
# Provides connect_storage() for CZ storage authentication.

# MAGIC %run "../utils/io_util"


# COMMAND ----------
# Import required libraries.

from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()


# COMMAND ----------
# ============================================================
# STEP 1: DEFINE SOURCE AND TARGET TABLES
# ============================================================

# SQL Server source table (schema.table).
SOURCE_TABLE = "dq_audit.DQLogging"

# CZ target Delta table (catalog.schema.table).
TARGET_TABLE = "dq_audit.DQLogging"


# COMMAND ----------
# ============================================================
# STEP 2: AUTHENTICATE WITH CZ STORAGE
# ============================================================

# Authenticate using the existing CZ service principal.
# This ensures access to the CZ ADLS storage account.

connect_storage("Curated")

print("CZ storage authentication successful.")


# COMMAND ----------
# ============================================================
# STEP 3: ESTABLISH SQL SERVER CONNECTION
# ============================================================

# Retrieve the SQL Server JDBC connection URL
# from the existing SQL utility.

jdbc_url = get_jdbcUrl()

print("SQL Server JDBC connection configured.")


# COMMAND ----------
# ============================================================
# STEP 4: READ COMPLETE DATA FROM SQL SERVER
# ============================================================

# Read the entire source table using JDBC.
#
# fetchsize:
# Controls the number of rows fetched per JDBC round trip.
# This is a fetch-size setting, not a Spark partition count.
#
# No filters are applied because this is a full load.

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

# Count source records before starting the migration.
# This count will be used to validate the target after loading.

source_count = source_df.count()

print(f"SQL Server source record count: {source_count}")

# Stop the migration if the source table is empty.
# This prevents accidental replacement of the target
# with an empty dataset.

if source_count == 0:
    raise Exception(
        "Source table is empty. Migration stopped."
    )


# COMMAND ----------
# ============================================================
# STEP 6: PERFORM FULL LOAD INTO CZ DELTA TABLE
# ============================================================

# Overwrite:
# Replaces existing target data with the complete source data.
#
# overwriteSchema:
# Allows the target Delta schema to be updated to match
# the source DataFrame schema.
#
# saveAsTable:
# Saves the data as a registered CZ Delta table.

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

# Read the target Delta table and calculate its record count.

target_df = spark.table(TARGET_TABLE)

target_count = target_df.count()

print("----------------------------------------")
print("DQLogging Migration Validation")
print("----------------------------------------")
print(f"Source Table  : {SOURCE_TABLE}")
print(f"Target Table  : {TARGET_TABLE}")
print(f"Source Records: {source_count}")
print(f"Target Records: {target_count}")
print("----------------------------------------")


# COMMAND ----------
# ============================================================
# STEP 8: FINAL MIGRATION STATUS
# ============================================================

# Compare source and target record counts.
# Fail the notebook if the counts do not match.

if source_count != target_count:

    raise Exception(
        f"Migration validation failed. "
        f"Source Count: {source_count}, "
        f"Target Count: {target_count}"
    )

print(
    f"SUCCESS: Full load of {SOURCE_TABLE} "
    f"into {TARGET_TABLE} completed successfully."
)
