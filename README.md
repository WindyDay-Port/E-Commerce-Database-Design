# E-commerce database design
## **I. Introduction**
### **Project Overview:**
The goal of this project is to design and implement a database schema for an e-commerce website, inspired by the structure and functionality of Nike's online store. This schema will be used to manage product information, customer data, order processing and inventory management. The goal of the project is to demonstrate a comprehensive understanding of database design principles and normalization techniques.

### **Discussion:** Nike's online store was chosen as schema inspiration for several reasons: 
- **Scalability and Size**
- **Comprehensive Product Categorization**
- **Common Industry Standard**
- **Adaptability and Innovation** 

## **II. Initial Planning**
**Requirements Analysis:**
- **Objective:** To create a robust and scalable database schema for an e-commerce website.
- **Scope:** The schema will include tables for managing products, categories, customers, orders, inventory, reviews and shipping details.

## **III. Defining Entities and Attributes**
### **Key Entities:**

**1. Main_Categories**
- **Key(s):**  'Main_category_ID' **(PK)**
- **Other attribute(s):** 'Name'
- **Purpose:** To categorize products into broad high-level categories (e.g., Men, Woman, Kids)

**2. Subcategories**
- **Key(s):** 'Subcategory_ID' **(PK)**, 'Main_Category_ID' **(FK)**
- **Other attribute(s):** 'Name'
- **Purpose:** To further divide main categories into more specific subcategories (e.g., Shoes, Clothing, Apparel)

**3. Product_Types**
- **Key(s):** 'Type_ID' **(PK)**,  'Subcategory_ID' **(FK)**
- **Other attribute(s):** 'Type_Name'
- **Purpose:** To classify products into specific subjects or types within a subcategory (e.g., Running Shoes, Casual Wear)

**4. Products**
- **Key(s):** 'Product_ID' **(PK)**,  'Type_ID' **(FK)**
- **Other attribute(s):** 'Product_Name', 'Size', 'Price', 'Product_Description', 'Image_Url'
- **Purpose:** To store detailed information about each product available in the store

**5. Product_Variations** 
- **Key(s):** 'Variation_ID' **(PK)**, 'Produuct_ID' **(FK)**
- **Other attribute(s):** 'Style_Code', 'Color_Description'
- **Purpose:** To manage different variation of a product, such as different color pattern or style

**6. Product_Material**
- **Key(s):** 'Product_ID' **(PK)**
- **Other attribute(s):** 'Material_Type'
- **Purpose:** To specify the materials used for each product

**7. How_Product_Made**
- **Key(s):** 'Product_ID' **(PK)**
- **Other attribute(s):** 'Description'
- **Purpose:** To provide a detailed information on how each product is made

**8. Inventory**
- **Key(s):** 'Inventory_ID' **(PK)**, 'Product_ID' **(FK)**
- **Other attribute(s):** 'Quantity', 'Last_Updated'
- **Purpose:** To track the quantity of each product available in stock and the last updated date

**9. Customers**
- **Key(s):** 'Customer_ID' **(PK)**
- **Other attribute(s):** 'Cust_First_Name', 'Cust_Last_Name', 'Cust_Email', 'Cust_Address', 'Cust_User_Name', 'Cust_Birth_Day', 'Cust_Phone_Number'
- **Purpose:** To store information about customers who register or make purchases on the website

**10. Orders**
- **Key(s):** 'Order_ID' **(PK)**, 'Customer_ID' **(FK)**
- **Other attribute(s):** 'Order_Date', 'Total_Amount'
- **Purpose:** Record about customer orders, including the customer ID, order date and total amount of order

**11. Order_Details**
- **Key(s):** 'Order_Detail_ID' **(PK)**, 'Order_ID' **(FK)**, 'Product_ID' **(FK)**
- **Other attribute(s):** 'Quantity', 'Price'
- **Purpose:** To store details of each product in an order, including quantity and price per item

**12. Shipping**
- **Key(s):** 'Shipping_ID' **(PK)**, 'Order_ID' **(FK)**
- **Other attribute(s):** 'Shipping_Date', 'Delivery_Date'
- **Purpose:** To track the shipping status of each order,  including shipping and delivery dates

**13. Reviews**
- **Key(s):** 'Review_ID' **(PK)**, 'Customer_ID' **(FK)**, 'Product_ID' **(FK)**
- **Other attributes:** , 'Comment', 'Review_Date', 'Rating'
- **Purpose:** To store customer reviews for products, including the comment, date and rating

## **IV. Establishing Relationships**
### **Entity Relationships:**

**1. Main_Categories to Subcategories:**
- One-to-Many Relationship
- Each main category can have multiple subcategories

**2. Subcategories to Product_Types:**
- One-to-Many Relationship
- Each subcategory can contain multiple types of product

**3. Product_Types to Products:**
- One-to-Many Relationship
- Each type can have multiple products

**4. Products to How_Product_Made:**
- One-to-One Relationship
- Each product has only one detailed description of how it was made

**5. Products to Product_Variations:**
- One-to-Many Relationship
- Each product can have multiple variations of color pattern

**6. Products to Inventory:**
- One-to-One Relationship
- Each product is tracked in the inventory with quantity and last updated date

**7. Products to Product_Material_Tag:**
- Zero-to-One Relationship
- Each product can only have one material tag or none at all

**8. Products to Order_Details:**
- One-to-Many Relationship
- Each product can appears in many order details

**9. Products to Reviews:**
- One-to-Many Relationship
- Each product can have many reviews

**10. Customers to Reviews:**
- One-to-Many Relationship
- Each customer can give multiple reviews

**11. Customers to Orders:**
- One-to-Many Relationship
- Each customer can place multiple orders

**12. Orders to Order_Details:**
- One-to-Many Relationship
- Each order can have multiple order details

**13. Orders to Shipping:**
- One-to-One Relationship
- Each order has one shipping record

## **V. Normalization Process**
**First Normal Form (1NF):**
- All tables have atomic values and no repeating groups

**Second Normal Form (2NF):**
- All non-key attributes are fully functional dependent on the primary key

**Third Normal Form (3NF):**
- No transitive dependencies
- All none-key attributes are dependent only on the primary key

## **VI. Tool Used**
- **Diagraming Tool:** Used **draw.io** for creating ER diagram.
- **Database Management System (DBMS):** PostgreSQL for implementing the schema.

## **VII. Conclusion**
This project demonstrates a thorough understanding of database design and normalization principles. The schema is designed to be scalable, ensuring data integrity and efficient data retrieval. This document, along with the ER diagram, showcases the structured approach taken to develop a comprehensive database schema for an e-commerce website.
