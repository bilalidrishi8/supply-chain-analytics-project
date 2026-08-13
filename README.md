# 📦 Supply Chain Forecasting & Inventory Analytics

![SQL](https://img.shields.io/badge/SQL-Analysis-4169E1?style=for-the-badge&logo=databricks&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Analytics-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=for-the-badge&logo=github)

---

## 📌 Project Overview

The **Supply Chain Forecasting & Inventory Analytics Project** is an end-to-end data analytics project focused on analyzing supply chain operations, product demand, inventory levels, suppliers, warehouses, transportation, sales, and forecasting performance.

The project uses **SQL and PostgreSQL** to explore and analyze supply chain data and is designed to support the development of an interactive **Power BI dashboard**.

The primary objective is to transform raw supply chain data into actionable insights for better **inventory management, demand planning, supplier evaluation, warehouse performance, and business decision-making**.

---

## 🎯 Project Objectives

- Analyze product demand and sales performance.
- Compare forecasted demand with actual demand.
- Identify inventory shortages and potential overstocking.
- Analyze supplier performance.
- Evaluate warehouse inventory levels.
- Analyze transportation modes and lead times.
- Identify high-performing products and categories.
- Analyze sales by region and warehouse.
- Calculate category contribution to total sales.
- Develop supply chain KPIs.
- Build an interactive Power BI dashboard.

---

## 📊 Dataset

The project dataset contains **2,050 records and 20 columns** related to supply chain forecasting and inventory operations.

### Main Data Fields

| Column | Description |
|---|---|
| `transaction_id` | Unique transaction identifier |
| `order_date` | Order date |
| `delivery_date` | Delivery date |
| `product_id` | Unique product identifier |
| `product_name` | Product name |
| `category` | Product category |
| `warehouse` | Warehouse location |
| `region` | Geographic region |
| `supplier_id` | Supplier identifier |
| `supplier_name` | Supplier name |
| `forecast_qty` | Forecasted quantity |
| `actual_demand_qty` | Actual demand quantity |
| `inventory_on_hand` | Current inventory |
| `reorder_point` | Inventory reorder threshold |
| `unit_cost` | Product unit cost |
| `lead_time_days` | Supplier/delivery lead time |
| `transportation_mode` | Transportation method |
| `sales_amount` | Sales amount |
| `customer_segment` | Customer segment |
| `forecast_version` | Forecast version |

---

# 🗄️ Data Model

```text
                    SUPPLY CHAIN DATA
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
       Products         Suppliers        Warehouses
          │                │                │
          └────────────────┼────────────────┘
                           │
                           ▼
                    Demand & Forecast
                           │
              ┌────────────┼────────────┐
              ▼            ▼            ▼
         Inventory      Logistics      Sales
              │            │            │
              ▼            ▼            ▼
       Reorder Point   Lead Time    Customer Segment


