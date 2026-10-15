IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"event_party_id"},"function":"is_not_null"},"criticality":"warn","name":"event_party_id_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'rexsgqoopin_us.rex_event_party_current',N'Curated',N'[{"check":{"arguments":{"column":"event_party_id"},"function":"is_not_null"},"criticality":"warn","name":"event_party_id_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"card_num"},"function":"is_not_null"},"criticality":"warn","name":"card_num_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'rexsgqoopin_us.rex_card_current',N'Curated',N'[{"check":{"arguments":{"column":"card_num"},"function":"is_not_null"},"criticality":"warn","name":"card_num_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"TDACCOUNTNUMBER"},"function":"is_not_null"},"criticality":"warn","name":"TDACCOUNTNUMBER_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'crl.us_credit_claim_accounts_info_curated',N'Curated',N'[{"check":{"arguments":{"column":"TDACCOUNTNUMBER"},"function":"is_not_null"},"criticality":"warn","name":"TDACCOUNTNUMBER_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO


IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}')), 
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b18_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"},
     {"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b11_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO


IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}')), 
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b04_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"},
     {"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}')), 
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b03_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"},
     {"check":{"arguments":{"column":"card_member_number"},"function":"is_not_null"},"criticality":"warn","name":"card_member_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b02_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"}')), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'cpus2_us.multiple_account_record_full_b01_current',N'Curated',N'[
     {"check":{"arguments":{"column":"related_account_number"},"function":"is_not_null"},"criticality":"warn","name":"related_account_number_is_null"},
     {"check":{"arguments":{"column":"cardholder_account_number"},"function":"is_not_null"},"criticality":"warn","name":"cardholder_account_number_is_null"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'), 
        'append $', JSON_QUERY(N'{"check":{"arguments":{"columns":"PYID"},"function":"is_unique"},"criticality":"warn","name":"PYID_id_is_unique"}')),
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"PYID"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"PYID_is_not_null_and_not_empty"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'crl.us_debit_claim_curated',N'Curated',N'[{"check":{"arguments":{"columns":"PYID"},"function":"is_unique"},"criticality":"warn","name":"PYID_is_unique"},
        {"check":{"arguments":{"column":"PYID"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"PYID_is_not_null_and_not_empty"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'),        
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"JOB_ENTRY_DT"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"JOB_ENTRY_DT_is_not_null_and_not_empty"}')),
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"JOB_ENTRY_DT","date_format":"yyyy-MM-dd"},"function":"is_valid_date"},"criticality":"warn","name":"JOB_ENTRY_DT_is_valid_date"}')), 
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'hrm.fulltimeandcontract_curated',N'Curated',N'[{"check":{"arguments":{"column":"JOB_ENTRY_DT"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"JOB_ENTRY_DT_is_not_null_and_not_empty"},
        {"check":{"arguments":{"column":"JOB_ENTRY_DT","date_format":"yyyy-MM-dd"},"function":"is_valid_date"},"criticality":"warn","name":"JOB_ENTRY_DT_is_valid_date"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'),        
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"rmx001cs_cust_nbr"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"rmx001cs_cust_nbr_is_not_null_and_not_empty"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'rnus8_us.party_cust_pers_current',N'Curated',N'[{"check":{"arguments":{"column":"rmx001cs_cust_nbr"},"function":"is_not_null_and_not_empty"},"criticality":"warn","name":"rmx001cs_cust_nbr_is_not_null_and_not_empty"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO



IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'),
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"event_start_dttm","timestamp_format":"yyyy-MM-dd HH:mm:ss"},"function":"is_valid_timestamp"},"criticality":"warn","name":"event_start_dttm_is_valid_timestamp"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'rexsgqoopin_us.rex_event_current',N'Curated',N'[{"check":{"arguments":{"column":"event_start_dttm","timestamp_format":"yyyy-MM-dd HH:mm:ss"},"function":"is_valid_timestamp"},"criticality":"warn","name":"event_start_dttm_is_valid_timestamp"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO

IF EXISTS (SELECT 1 FROM [operational].[DQConfig]
           WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated')
BEGIN
    UPDATE [operational].[DQConfig]
    SET [Zone] = N'Curated',
        [Rules] = JSON_MODIFY(COALESCE(NULLIF([Rules], N''), N'[]'),
        'append $', JSON_QUERY(N'{"check":{"arguments":{"column":"event_start_dttm","timestamp_format":"yyyy-MM-dd HH:mm:ss"},"function":"is_valid_timestamp"},"criticality":"warn","name":"event_start_dttm_is_valid_timestamp"}')),
        [IsActiveFlag] = 1, [LastUpdatedTimestamp] = GETDATE(), [UpdatedBy] = NULL, [CronSchedule] = NULL, [StreamingTimestampField] = NULL, [Alert_Emails] = NULL, [sourceFile] = NULL
    WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated';
END
ELSE
BEGIN
    INSERT INTO [operational].[DQConfig]
        ([TableName],[Zone],[Rules],[IsActiveFlag],[LastUpdatedTimestamp],
         [UpdatedBy],[CronSchedule],[StreamingTimestampField],[Alert_Emails],[sourceFile])
    VALUES
        (N'rexsgqoopin_us.event_current',N'Curated',N'[{"check":{"arguments":{"column":"event_start_dttm","timestamp_format":"yyyy-MM-dd HH:mm:ss"},"function":"is_valid_timestamp"},"criticality":"warn","name":"event_start_dttm_is_valid_timestamp"}]',
         1,GETDATE(),NULL,NULL,NULL,NULL,NULL);
END
GO



--Rollback script generated from DQ_16_10_2026.sql
--Removes only the DQ rules added by the source script.

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'event_party_id' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'event_party_id_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'rexsgqoopin_us.rex_event_party_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'card_num' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'card_num_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'rexsgqoopin_us.rex_card_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'TDACCOUNTNUMBER' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'TDACCOUNTNUMBER_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'crl.us_credit_claim_accounts_info_curated' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'card_member_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'card_member_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b18_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b11_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null') OR (JSON_VALUE([value], '$.check.arguments.column') = N'card_member_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'card_member_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b04_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'card_member_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'card_member_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b03_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b02_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'related_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'related_account_number_is_null') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'cardholder_account_number' AND JSON_VALUE([value], '$.check.function') = N'is_not_null' AND JSON_VALUE([value], '$.name') = N'cardholder_account_number_is_null'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'cpus2_us.multiple_account_record_full_b01_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.columns') = N'PYID' AND JSON_VALUE([value], '$.check.function') = N'is_unique' AND JSON_VALUE([value], '$.name') IN (N'PYID_id_is_unique', N'PYID_is_unique')) OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'PYID' AND JSON_VALUE([value], '$.check.function') = N'is_not_null_and_not_empty' AND JSON_VALUE([value], '$.name') = N'PYID_is_not_null_and_not_empty'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'crl.us_debit_claim_curated' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'JOB_ENTRY_DT' AND JSON_VALUE([value], '$.check.function') = N'is_not_null_and_not_empty' AND JSON_VALUE([value], '$.name') = N'JOB_ENTRY_DT_is_not_null_and_not_empty') OR 
--    (JSON_VALUE([value], '$.check.arguments.column') = N'JOB_ENTRY_DT' AND JSON_VALUE([value], '$.check.function') = N'is_valid_date' AND JSON_VALUE([value], '$.name') = N'JOB_ENTRY_DT_is_valid_date'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'hrm.fulltimeandcontract_curated' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'rmx001cs_cust_nbr' AND JSON_VALUE([value], '$.check.function') = N'is_not_null_and_not_empty' AND JSON_VALUE([value], '$.name') = N'rmx001cs_cust_nbr_is_not_null_and_not_empty'))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'rnus8_us.party_cust_pers_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'event_start_dttm' AND JSON_VALUE([value], '$.check.function') = N'is_valid_timestamp' AND JSON_VALUE([value], '$.name') 
--    IN (N'event_start_dttm_is_valid_timestamp', N'event_start_dttm_is_valid_timestamp')))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'rexsgqoopin_us.rex_event_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO

--IF EXISTS (SELECT 1 FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated')
--BEGIN
--    DECLARE @Rules NVARCHAR(MAX);

--    SELECT @Rules = ISNULL([Rules], N'[]') FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated';

--    SELECT @Rules = COALESCE(N'[' + (SELECT STRING_AGG(CAST([value] AS NVARCHAR(MAX)), N',') WITHIN GROUP (ORDER BY TRY_CONVERT(INT, [key])) FROM OPENJSON(@Rules) 
--    WHERE NOT ((JSON_VALUE([value], '$.check.arguments.column') = N'event_start_dttm' AND JSON_VALUE([value], '$.check.function') = N'is_valid_timestamp' AND JSON_VALUE([value], '$.name') 
--    IN (N'event_start_dttm_is_valid_timestamp', N'event_start_dttm_is_valid_timestamp')))) + N']', N'[]');

--    IF @Rules = N'[]' BEGIN
--        DELETE FROM [operational].[DQConfig] WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated';
--    END ELSE BEGIN
--        UPDATE [operational].[DQConfig] SET [Rules] = @Rules, [LastUpdatedTimestamp] = GETDATE() WHERE [TableName] = N'rexsgqoopin_us.event_current' AND [Zone] = N'Curated';
--    END;
--END;
--GO




