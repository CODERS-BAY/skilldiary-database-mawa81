# Database Diary 27.05.2020 Mario Wagner

## Theoretical part 

### 2 Phase Commit

Commit needs 2 responding Systems

### Distributed Transactions

nested transactions

### Read-Only Transactions
```
COMMIT; -- last transaction -> starts automatically a new transaction
SET TRANSACTION READ ONLY;
SELECT .....
....
.....
COMMIT; -- End of "read only"
```

### Autonomous Transaction

an independent transaction get started by another transaction

### Main Transaction & Side Transaction

### Nested Transactions

* Commit rule
* Recovery rule
* Visibility rule

### Problems

* ACID needs short transactions
* long batch-processes leads to higher time consumption
* long locks
* 

### Compensation

-> Recovery

* Safepoints enable Rollbacks

### Logfile

Recovery through Logfiles

UNDO & REDO 

* Roll Forward Recovery
* Roll Back Recovery

### Structure of a Log-Entry

* Log Sequence Number (LSN)
* Transaction identification
* Field Previous LSN (connection)
* Type: Describes the type (commit, update, abort...) of database log record
* Information about the actual changes that triggered the log record to be written.

Log query:
```
SELECT * FROM v$log;
```