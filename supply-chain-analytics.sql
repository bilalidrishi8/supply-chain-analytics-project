CREATE TABLE supply_chain_forecasting (
        transaction_id TEXT,
        order_date TEXT,
        delivery_date TEXT,
        product_id VARCHAR(20),    
		product_name VARCHAR(100),
        category VARCHAR(100),
        warehouse VARCHAR(100),
        region VARCHAR(100),    
		supplier_id TEXT,
        supplier_name VARCHAR(100),
        forecast_qty NUMERIC(12,2),
        actual_demand_qty NUMERIC(12,2),
        inventory_on_hand NUMERIC(12,2),
        reorder_point NUMERIC(12,2),
        unit_cost NUMERIC(12,2),
        lead_time_days INT,
        transportation_mode VARCHAR(50),
        sales_amount NUMERIC(15,2),
        customer_segment VARCHAR(50),    
    forecast_version VARCHAR(20)
);

SELECT * FROM supply_chain_forecasting

-- ============================================================
-- SUPPLY CHAIN FORECASTING & INVENTORY ANALYTICS
-- INTERMEDIATE SQL BUSINESS QUESTIONS
-- ============================================================


-- 1. What is the total sales amount by product category?
SELECT * FROM supply_chain_forecasting

SELECT
    category,
    SUM(sales_amount) AS total_sales
FROM supply_chain_forecasting
GROUP BY category
ORDER BY total_sales DESC;


-- 2. Which product category has the highest actual demand?
SELECT * FROM supply_chain_forecasting

SELECT
    category,
    SUM(actual_demand_qty) AS total_actual_demand
FROM supply_chain_forecasting
GROUP BY category
ORDER BY total_actual_demand DESC
LIMIT 1;


-- 3. Which products have the highest total sales amount?
SELECT * FROM supply_chain_forecasting

SELECT
    product_name,
    SUM(sales_amount) AS total_sales
FROM supply_chain_forecasting
GROUP BY product_name
ORDER BY total_sales DESC;


-- 4. What is the total sales amount by warehouse?
SELECT * FROM supply_chain_forecasting

SELECT
    warehouse,
    SUM(sales_amount) AS total_sales
FROM supply_chain_forecasting
GROUP BY warehouse
ORDER BY total_sales DESC;


-- 5. Which warehouse has the highest inventory on hand?
SELECT * FROM supply_chain_forecasting

SELECT
    warehouse,
    SUM(inventory_on_hand) AS total_inventory
FROM supply_chain_forecasting
GROUP BY warehouse
ORDER BY total_inventory DESC
LIMIT 1;


-- 6. Which supplier generates the highest total sales?
SELECT * FROM supply_chain_forecasting

SELECT
    supplier_name,
    SUM(sales_amount) AS total_sales
FROM supply_chain_forecasting
GROUP BY supplier_name
ORDER BY total_sales DESC
LIMIT 1;


-- 7. What is the average lead time for each supplier?
SELECT * FROM supply_chain_forecasting

SELECT
    supplier_name,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time
FROM supply_chain_forecasting
GROUP BY supplier_name
ORDER BY avg_lead_time DESC;


-- 8. Which transportation mode has the highest average lead time?
SELECT * FROM supply_chain_forecasting

SELECT
    transportation_mode,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time
FROM supply_chain_forecasting
GROUP BY transportation_mode
ORDER BY avg_lead_time DESC
LIMIT 1;


-- 9. What is the total forecast quantity vs actual demand by product category?
SELECT * FROM supply_chain_forecasting

SELECT
    category,
    SUM(forecast_qty) AS total_forecast_qty,
    SUM(actual_demand_qty) AS total_actual_demand
FROM supply_chain_forecasting
GROUP BY category
ORDER BY category;


-- 10. Which products have actual demand greater than their forecast quantity?
SELECT * FROM supply_chain_forecasting

SELECT
    product_name,
    SUM(forecast_qty) AS total_forecast,
    SUM(actual_demand_qty) AS total_actual_demand
FROM supply_chain_forecasting
GROUP BY product_name
HAVING SUM(actual_demand_qty) > SUM(forecast_qty)
ORDER BY total_actual_demand DESC;


-- 11. Calculate the percentage contribution of each product category to total sales.
SELECT * FROM supply_chain_forecasting

SELECT
    category,
    SUM(sales_amount) AS category_sales,
    ROUND(
        100.0 * SUM(sales_amount)
        / SUM(SUM(sales_amount)) OVER (),
        2
    ) AS sales_contribution_percentage
FROM supply_chain_forecasting
GROUP BY category
ORDER BY sales_contribution_percentage DESC;


-- 12. Identify products where inventory on hand is below the reorder point.
SELECT * FROM supply_chain_forecasting

SELECT
    product_name,
    SUM(inventory_on_hand) AS inventory_on_hand,
    SUM(reorder_point) AS reorder_point
FROM supply_chain_forecasting
GROUP BY product_name
HAVING SUM(inventory_on_hand) < SUM(reorder_point)
ORDER BY inventory_on_hand ASC;


-- 13. Which region generates the highest average sales per transaction?
SELECT * FROM supply_chain_forecasting

SELECT
    region,
    ROUND(AVG(sales_amount), 2) AS avg_sales_per_transaction
FROM supply_chain_forecasting
GROUP BY region
ORDER BY avg_sales_per_transaction DESC
LIMIT 1;


-- 14. What is the total transportation demand by transportation mode?
SELECT * FROM supply_chain_forecasting

SELECT
    transportation_mode,
    SUM(actual_demand_qty) AS total_demand
FROM supply_chain_forecasting
GROUP BY transportation_mode
ORDER BY total_demand DESC;


-- 15. Which warehouse has the highest average reorder point?
SELECT * FROM supply_chain_forecasting

SELECT
    warehouse,
    ROUND(AVG(reorder_point), 2) AS avg_reorder_point
FROM supply_chain_forecasting
GROUP BY warehouse
ORDER BY avg_reorder_point DESC
LIMIT 1;


-- 16. Find products with inventory levels more than twice their reorder point.
SELECT * FROM supply_chain_forecasting

SELECT
    product_name,
    SUM(inventory_on_hand) AS inventory_on_hand,
    SUM(reorder_point) AS reorder_point
FROM supply_chain_forecasting
GROUP BY product_name
HAVING SUM(inventory_on_hand) >
       2 * SUM(reorder_point)
ORDER BY inventory_on_hand DESC;


-- 17. Which suppliers have the highest number of products supplied?
SELECT * FROM supply_chain_forecasting

SELECT
    supplier_name,
    COUNT(DISTINCT product_id) AS total_products
FROM supply_chain_forecasting
GROUP BY supplier_name
ORDER BY total_products DESC;


-- 18. Calculate the difference between sales amount and estimated product cost for each transaction.
SELECT * FROM supply_chain_forecasting

SELECT
    transaction_id,
    product_name,
    sales_amount,
    inventory_on_hand,
    unit_cost,
    (inventory_on_hand * unit_cost) AS estimated_inventory_cost,
    sales_amount - (inventory_on_hand * unit_cost)
        AS sales_cost_difference
FROM supply_chain_forecasting
ORDER BY sales_cost_difference DESC;

---END THE PROJECT---