import re
from pyspark.sql import Row

results = []

mapping_table = "hive_metastore.dq_audit.dqazmapping"

for row in mapping_df.collect():

    cz_table = row["CZ_TableName"]
    az_table = row["AZ_TableNameFull"]
    cz_column = row["CZ_ColumnName"]
    az_column = row["AZ_ColumnName"]

    try:

        # 1. Retrieve AZ view definition
        ddl = spark.sql(
            f"SHOW CREATE TABLE {az_table}"
        ).first()[0]

        # 2. Extract SELECT list
        match = re.search(
            r"\bSELECT\b(.*?)\bFROM\b",
            ddl,
            flags=re.IGNORECASE | re.DOTALL
        )

        if not match:
            status = "SELECT NOT FOUND"
            actual_az_column = None

        else:

            select_list = match.group(1)

            # 3. Split SELECT expressions
            expressions = re.split(
                r",\s*(?![^()]*\))",
                select_list
            )

            actual_az_column = None

            for expr in expressions:

                expr = expr.strip()

                # Case 1: SELECT *
                if expr == "*":
                    actual_az_column = cz_column
                    break

                # Case 2: Explicit alias
                alias_match = re.match(
                    r"^(.*?)\s+AS\s+[`\"]?([\w]+)[`\"]?$",
                    expr,
                    flags=re.IGNORECASE | re.DOTALL
                )

                if alias_match:

                    source_expression = alias_match.group(1).strip()
                    alias_name = alias_match.group(2).strip()

                    source_column = (
                        source_expression.split(".")[-1]
                        .strip("`\" ")
                    )

                    # Match using CZ_ColumnName
                    if source_column.lower() == cz_column.lower():
                        actual_az_column = alias_name
                        break

                # Case 3: No alias
                else:

                    source_column = (
                        expr.split(".")[-1].strip("`\" ")
                    )

                    if source_column.lower() == cz_column.lower():
                        actual_az_column = source_column
                        break

            # 4. Compare configured alias with actual alias
            if actual_az_column is None:
                status = "CZ COLUMN NOT FOUND"

            elif (
                not az_column or
                az_column.lower() != actual_az_column.lower()
            ):

                # 5. Update mapping table
                spark.sql(f"""
                    UPDATE {mapping_table}
                    SET AZ_ColumnName = '{actual_az_column}'
                    WHERE CZ_TableName = '{cz_table}'
                      AND AZ_TableNameFull = '{az_table}'
                      AND CZ_ColumnName = '{cz_column}'
                """)

                status = "UPDATED"

            else:
                status = "MATCHED"

        # 6. Store results
        results.append(Row(
            CZ_TableName=cz_table,
            AZ_TableNameFull=az_table,
            CZ_ColumnName=cz_column,
            Old_AZ_ColumnName=az_column,
            Actual_AZ_ColumnName=actual_az_column,
            Status=status
        ))

    except Exception as e:

        status = f"ERROR: {str(e)}"

        results.append(Row(
            CZ_TableName=cz_table,
            AZ_TableNameFull=az_table,
            CZ_ColumnName=cz_column,
            Old_AZ_ColumnName=az_column,
            Actual_AZ_ColumnName=None,
            Status=status
        ))

# 7. Display validation results
if results:

    az_mapping_df = spark.createDataFrame(results)

    display(az_mapping_df)