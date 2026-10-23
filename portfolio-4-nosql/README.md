# Portfolio 4: NoSQL and Advanced Data Models

## 1. NoSQL Model Selection: Document Store

For the **Joel Mega Store** platform, a Document Database (MongoDB) was selected to adapt the previously relational architecture into a flexible NoSQL structure.

## 2. Explanation of Suitability

E-commerce platforms handle highly variable product catalogs and complex, read-heavy transaction histories. A Document store is the most suitable NoSQL model for this use case because:

- **Schema Flexibility (Polymorphism):** In a relational model, storing distinct product specifications (e.g., shoe sizes vs. laptop RAM) requires sparse columns or complex EAV tables. The Document model allows each product to contain a flexible `attributes` sub-document, seamlessly accommodating diverse inventory.
- **Embedded Data for Read Optimization:** Relational architectures require resource-intensive `JOIN` operations across `Orders`, `Users`, `OrderItems`, and `Payments` to display a single checkout receipt. The Document model embeds the customer snapshot, payment status, and line items directly inside a single `orders` document. This allows the application to retrieve comprehensive order details with a single, highly performant read query.

## 3. Implementation Evidence

The included `nosql-implementation.js` script outlines the data structures. The repository also includes `nosql-output.png`, which demonstrates a successful document query executed within the MongoDB Atlas cloud environment.
