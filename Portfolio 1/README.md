# Portfolio 1: Database Design and Modelling

## 1. Case Study Selection: Joel Mega Store

**Organisation Name:** Joel Mega Store
**Nature of the Business:** A comprehensive online B2C retail platform that manages product catalogs, customer transactions, and order fulfillment.
**Users of the Database:** Customers (shoppers), System Administrators (inventory and store managers), and Logistics/Delivery Personnel.
**Major Data Stored:** Customer profiles, product specifications, inventory levels, order histories, payment records, and delivery statuses.
**Key Operations:** Registering customers, browsing product catalogs, placing orders, automatically updating stock availability, processing payments, and tracking delivery histories.

## 2. Normalisation Explanation

The relational schema for Joel Mega Store was designed to prevent data anomalies and ensure integrity by adhering to standard normalisation rules:

- **First Normal Form (1NF):** The schema achieves 1NF because all attributes contain atomic (indivisible) values. There are no repeating groups or arrays. For example, instead of storing multiple products in a single `Orders` row, the schema uses a separate `OrderItems` table to ensure each row holds a single value for product and quantity.
- **Second Normal Form (2NF):** The schema is in 2NF because it is in 1NF and there are no partial dependencies. Every table uses a single-column surrogate primary key (such as `OrderID` or `ProductID`), meaning all non-key attributes depend on the entire primary key, not just a part of it.
- **Third Normal Form (3NF):** The schema satisfies 3NF because it is in 2NF and has no transitive dependencies. Non-key attributes depend only on the primary key, not on other non-key attributes. For instance, in the `Products` table, the category name is not stored alongside the product; instead, a `CategoryID` foreign key references the `Categories` table, preventing data duplication and update anomalies if a category name changes.
