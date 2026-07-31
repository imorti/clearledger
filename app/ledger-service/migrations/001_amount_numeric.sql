-- Required only when upgrading a database created before the ledger switched
-- from floating-point amounts to exact NUMERIC(18,2) values.
BEGIN;

ALTER TABLE transactions
    ALTER COLUMN amount TYPE NUMERIC(18,2)
    USING round(amount::numeric, 2);

COMMIT;
