# Portfolio 5: Distributed and Cloud Databases

## 1. Cloud Database Deployment
To ensure global accessibility and high availability for the **Joel Mega Store** e-commerce platform, the NoSQL data model was deployed to a cloud environment using MongoDB Atlas. The cluster is hosted on AWS infrastructure, providing a fully managed Database-as-a-Service (DBaaS) solution.

## 2. Distributed Architecture and High Availability
The MongoDB Atlas deployment utilizes a distributed architecture via **Replica Sets**. 
* **Data Replication:** The data is automatically replicated across multiple electable nodes (as seen in the deployment evidence). If the primary node experiences a hardware failure, an automated election promotes a secondary node to primary, ensuring zero downtime for the e-commerce store.
* **Fault Tolerance:** Distributing nodes across different physical AWS availability zones protects the database from localized data center outages.

## 3. Scalability Strategy
As Joel Mega Store grows, the cloud architecture supports seamless scaling:
* **Vertical Scaling:** Computing power and RAM can be upgraded with zero downtime during holiday traffic spikes.
* **Horizontal Scaling (Sharding):** If the data volume exceeds the capacity of a single replica set, the database can be sharded, distributing chunks of the collections across multiple distinct clusters to balance read/write operations globally.