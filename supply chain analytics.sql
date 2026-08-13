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

--1.What is the total sales amount by product category?
--2.Which product category has the highest actual demand?
--3.Which products have the highest total sales amount?
--4.What is the total sales amount by warehouse?
--5.Which warehouse has the highest inventory on hand?
--6.Which supplier generates the highest total sales?
--7.What is the average lead time for each supplier?
--8.Which transportation mode has the highest average lead time?
--9.What is the total forecast quantity vs actual demand by product category?
--10.Which products have actual demand greater than their forecast quantity?
--11.Calculate the percentage contribution of each product category to total sales.
--12.Identify products where inventory on hand is below the reorder point.
--13.Which region generates the highest average sales per transaction?
--14.What is the total transportation demand by transportation mode?
--15.Which warehouse has the highest average reorder point?
--16.Find the products with inventory levels more than twice their reorder point.
--17.Which suppliers have the highest number of products supplied?
--18.Calculate the difference between sales amount and estimated product cost for each transaction.
