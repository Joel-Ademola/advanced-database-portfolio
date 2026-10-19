# Portfolio 3: Transactions and Concurrency

## 1. Transaction Management (COMMIT and ROLLBACK)
In the **Joel Mega Store** e-commerce database, processing a customer order requires multiple distinct steps: inserting the order record, inserting the individual line items, and deducting the purchased quantities from the inventory. 

To maintain data integrity, these steps are grouped into a single logical unit of work using database transactions:
* **COMMIT:** When a customer successfully places an order, the `START TRANSACTION` block executes all `INSERT` and `UPDATE` statements. Once all steps clear without error, the `COMMIT` command permanently saves the new order and the reduced stock quantity to the database.
* **ROLLBACK:** If a customer attempts to purchase an item but their payment fails mid-process, or an inventory constraint is violated, the `ROLLBACK` command is issued. This instantly undoes the partial database changes, ensuring no ghost orders are created and stock levels remain strictly accurate.

## 2. Concurrency Control and Isolation
High-traffic e-commerce platforms frequently encounter concurrency issues, such as the **Lost Update Problem** (a race condition). This occurs when two customers attempt to purchase the last remaining unit of a product at the exact same time. Without control mechanisms, both transactions might read the stock as `1`, both deduct `1`, and both commit, resulting in a stock level of `-1` and a customer failing to receive their item.

**Implementation Strategy:**
To prevent this, the database utilizes two mechanisms:
1. **Isolation Levels:** The transaction isolation level is set to `READ COMMITTED`, ensuring that a transaction only reads data that has been fully committed by other operations, preventing "dirty reads" of unfinished stock deductions.
2. **Pessimistic Locking (`FOR UPDATE`):** When a transaction begins processing a checkout, it executes a `SELECT ... FOR UPDATE` query on the requested product row. This applies an exclusive row-level lock. If a second transaction attempts to buy the same item, the database engine forces it to wait in a queue until the first transaction completes its `UPDATE` and issues a `COMMIT`. This guarantees strict sequential consistency for inventory management.

## 3. Transaction Isolation
In a busy e-commerce environment like Joel Mega Store, multiple users access the database simultaneously. To prevent transactions from interfering with each other, strict isolation levels are enforced.

**Demonstration (Repeatable Read):**
An SQL script was executed setting the transaction isolation level to `REPEATABLE READ`. This was applied to an Admin reporting scenario. 
* **The Problem:** If an Admin runs a multi-step inventory report (reading stock levels) while a customer is concurrently buying items and updating those same stock levels, the Admin might read two different stock values for the same product within a single report (a Non-Repeatable Read anomaly).
* **The Solution:** By applying the `REPEATABLE READ` isolation level, the database takes a snapshot of the data at the start of the Admin's transaction. Even if other customer transactions `COMMIT` stock deductions in the background, the Admin's subsequent reads within their transaction are isolated and guaranteed to remain consistent.