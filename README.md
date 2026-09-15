# SQL-Server-Views


This repository contains my **hands-on practice with Views in SQL Server**.

Views are virtual tables based on SQL queries. They help simplify complex queries, reuse logic, and control the data exposed to users.

## Concepts Covered

* **CTE (Common Table Expression)**

  * Create monthly sales summaries
  * Calculate running totals using window functions

* **Creating Views**

  * Create reusable views from SQL queries
  * Retrieve data from views

* **Monthly Summary View**

  * Calculate monthly sales
  * Count total orders
  * Calculate total quantities

* **Views for Hiding Complexity**

  * Combine Orders, Products, Customers, and Employees
  * Create a simplified view for reporting and analysis

* **Views for Data Security**

  * Create a view for a specific team
  * Exclude USA customer data
  * Control which information is exposed to users

* **Updating View Logic**

  * Understand how views can be recreated when business logic changes

## Real-World Applications

* Simplifying complex SQL queries
* Creating reusable reporting datasets
* Building monthly sales summaries
* Combining data from multiple tables
* Supporting dashboards and business reports
* Hiding complex joins from end users
* Restricting sensitive or unnecessary data
* Providing department-specific data access
* Preparing data for analytics and reporting

## Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)

## Repository Structure

```text
sql-server-views/
│
├── README.md
└── views.sql
```

## Purpose

The purpose of this practice is to understand how SQL Server Views can be used to **simplify complex queries, create reusable datasets, support reporting, and control the data exposed to different users**.
