# Joel Mega Store - Advanced Database Architecture Portfolio

## Project Overview
This repository contains a comprehensive, five-part advanced database portfolio designed for **Joel Mega Store**, a B2C e-commerce platform. The project demonstrates a complete database lifecycle, transitioning from a normalized relational architecture to a highly available, distributed NoSQL cloud deployment.

## Repository Structure

*   **`portfolio-1-database-design/`**
    *   Contains the foundational relational schema, Entity-Relationship (ER) diagram, 3NF normalization documentation, and the initial DDL `CREATE TABLE` scripts.
*   **`portfolio-2-query-optimisation/`**
    *   Demonstrates advanced SQL querying and performance tuning. Includes `EXPLAIN` execution plans and B-Tree indexing strategies to eliminate full table scans.
*   **`portfolio-3-transactions-concurrency/`**
    *   Showcases data integrity mechanisms, including `COMMIT` and `ROLLBACK` for safe checkout processing, row-level locking (`FOR UPDATE`), and `REPEATABLE READ` isolation levels to prevent concurrency anomalies.
*   **`portfolio-4-nosql/`**
    *   Adapts the relational catalog into a NoSQL Document model using MongoDB. Demonstrates JSON document embedding to optimize read performance and schema flexibility for polymorphic product attributes.
*   **`portfolio-5-distributed-cloud/`**
    *   Details the migration of the NoSQL architecture to a distributed cloud environment using MongoDB Atlas on AWS. Documents replica sets, high availability, and horizontal scalability strategies.

## Technologies Used
*   **Relational Database:** MySQL (via DB Fiddle)
*   **NoSQL Database:** MongoDB
*   **Cloud Infrastructure:** MongoDB Atlas (AWS Electable Nodes)
*   **Concepts:** ACID Transactions, B-Tree Indexing, Normalization (3NF), Replication, JSON Document Modeling