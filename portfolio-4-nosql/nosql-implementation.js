// 1. Inserting Products Documents with flexible attributes
db.products.insertOne(
  {
    productId: "PROD_001",
    name: "Laptop Pro",
    category: "Electronics",
    price: 1200.0,
    stockQuantity: 49,
    attributes: {
      ram: "16GB",
      storage: "512GB SSD",
      processor: "Intel Core i7",
    },
  },
  {
    productId: "PROD_002",
    name: "Laptop Pro Book",
    category: "Electronics",
    price: NumberInt("5009400"),
    stockQuantity: NumberInt("49"),
    attributes: {
      ram: "32GB",
      storage: "1 TB SSD",
      processor: "Intel Core i9",
    },
  },
  {
    productId: "P01",
    name: "Laptop Pro",
    category: "Electronics",
    price: 1200,
    stock: 49,
    attributes: { ram: "16GB", storage: "512GB" },
  },
  {
    productId: "P02",
    name: "Wireless Mouse",
    category: "Electronics",
    price: 25,
    stock: 200,
    attributes: { dpi: 4000, wireless: true },
  },
  {
    productId: "P03",
    name: "Mechanical Keyboard",
    category: "Electronics",
    price: 85,
    stock: 100,
    attributes: { switches: "Cherry MX Red" },
  },
  {
    productId: "P04",
    name: "4K Monitor",
    category: "Electronics",
    price: 350,
    stock: 30,
    attributes: { resolution: "3840x2160", size: "32-inch" },
  },
  {
    productId: "P05",
    name: "Office Desk",
    category: "Furniture",
    price: 300,
    stock: 20,
    attributes: { material: "Wood", adjustable: true },
  },
  {
    productId: "P06",
    name: "Ergonomic Chair",
    category: "Furniture",
    price: 150,
    stock: 35,
    attributes: { material: "Mesh", lumbarSupport: true },
  },
  {
    productId: "P07",
    name: "Cotton T-Shirt",
    category: "Clothing",
    price: 15,
    stock: 500,
    attributes: { size: "L", color: "Black" },
  },
  {
    productId: "P08",
    name: "Denim Jeans",
    category: "Clothing",
    price: 40,
    stock: 300,
    attributes: { fit: "Slim", waist: 32, length: 34 },
  },
  {
    productId: "P09",
    name: "Running Sneakers",
    category: "Clothing",
    price: 60,
    stock: 150,
    attributes: { size: "42 EU", type: "Athletic" },
  },
  {
    productId: "P10",
    name: "Database Textbook",
    category: "Books",
    price: 120,
    stock: 80,
    attributes: { author: "Elmasri", format: "Hardcover" },
  },
);

// 2. Inserting Orders Document with embedded Order Items
db.orders.insertOne(
  {
    orderId: "ORD_1001",
    customer: {
      name: "Alice Doe",
      email: "alice@example.com",
      shippingAddress: "123 Main St, Lagos",
    },
    orderDate: new Date("2026-10-10T10:00:00Z"),
    status: "Delivered",
    totalAmount: 1225.0,
    payment: {
      method: "Credit Card",
      status: "Success",
      transactionDate: new Date("2026-10-10T10:05:00Z"),
    },
    items: [
      {
        productId: "PROD_001",
        name: "Laptop Pro",
        quantity: 1,
        unitPrice: 1200.0,
      },
      {
        productId: "PROD_002",
        name: "Wireless Mouse",
        quantity: 1,
        unitPrice: 25.0,
      },
    ],
  },
  {
    orderId: "O1",
    customer: { name: "Alice Doe", email: "alice@example.com" },
    status: "Delivered",
    total: 1225,
    items: [
      { productId: "P01", qty: 1 },
      { productId: "P02", qty: 1 },
    ],
  },
  {
    orderId: "O2",
    customer: { name: "Bob Smith", email: "bob@example.com" },
    status: "Shipped",
    total: 450,
    items: [
      { productId: "P05", qty: 1 },
      { productId: "P06", qty: 1 },
    ],
  },
  {
    orderId: "O3",
    customer: { name: "Charlie Davies", email: "charlie@example.com" },
    status: "Delivered",
    total: 120,
    items: [{ productId: "P10", qty: 1 }],
  },
  {
    orderId: "O4",
    customer: { name: "Alice Doe", email: "alice@example.com" },
    status: "Pending",
    total: 435,
    items: [
      { productId: "P04", qty: 1 },
      { productId: "P03", qty: 1 },
    ],
  },
  {
    orderId: "O5",
    customer: { name: "Diana Prince", email: "diana@example.com" },
    status: "Delivered",
    total: 70,
    items: [
      { productId: "P08", qty: 1 },
      { productId: "P07", qty: 2 },
    ],
  },
  {
    orderId: "O6",
    customer: { name: "Bob Smith", email: "bob@example.com" },
    status: "Cancelled",
    total: 150,
    items: [{ productId: "P06", qty: 1 }],
  },
  {
    orderId: "O7",
    customer: { name: "Charlie Davies", email: "charlie@example.com" },
    status: "Pending",
    total: 350,
    items: [{ productId: "P04", qty: 1 }],
  },
  {
    orderId: "O8",
    customer: { name: "Alice Doe", email: "alice@example.com" },
    status: "Shipped",
    total: 105,
    items: [
      { productId: "P07", qty: 3 },
      { productId: "P09", qty: 1 },
    ],
  },
  {
    orderId: "O9",
    customer: { name: "Diana Prince", email: "diana@example.com" },
    status: "Pending",
    total: 60,
    items: [{ productId: "P09", qty: 1 }],
  },
  {
    orderId: "O10",
    customer: { name: "Eve Adams", email: "eve@example.com" },
    status: "Delivered",
    total: 85,
    items: [{ productId: "P03", qty: 1 }],
  },
);
// Bulk Insert Users
db.users.insertMany([
  {
    userId: "U01",
    name: "Alice Doe",
    email: "alice@example.com",
    passwordHash: "hash1",
    role: "Customer",
    address: "123 Main St, Lagos",
  },
  {
    userId: "U02",
    name: "Bob Smith",
    email: "bob@example.com",
    passwordHash: "hash2",
    role: "Customer",
    address: "456 Oak Ave, Abuja",
  },
  {
    userId: "U03",
    name: "Charlie Davies",
    email: "charlie@example.com",
    passwordHash: "hash4",
    role: "Customer",
    address: "789 Pine Rd, Port Harcourt",
  },
  {
    userId: "U04",
    name: "Diana Prince",
    email: "diana@example.com",
    passwordHash: "hash5",
    role: "Customer",
    address: "321 Elm St, Kano",
  },
  {
    userId: "U05",
    name: "Eve Adams",
    email: "eve@example.com",
    passwordHash: "hash7",
    role: "Customer",
    address: "101 River Rd, Calabar",
  },
]);
// 3. Querying the NoSQL structure
// Retrieve all orders for Alice Doe where the status is Delivered
// Query A: Find all products in the 'Electronics' category that cost more than $100
db.products.find({
  category: "Electronics",
  price: { $gt: 100 },
});

// Query B: Find all orders belonging to Alice Doe
db.orders.find({
  "customer.email": "alice@example.com",
});

// Query C: Find all orders that are currently 'Pending' and sort them by highest total amount first
db.orders
  .find({
    status: "Pending",
  })
  .sort({ total: -1 });

// Query D: Find all products that have an attribute 'size' (demonstrating flexible schema querying)
db.products.find({
  "attributes.size": { $exists: true },
});
