-- =========================
-- E-COMMERCE SUBSCRIPTION DB
-- =========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    gender VARCHAR(10),
    acquisition_channel VARCHAR(50)
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    plan_type VARCHAR(30),      -- Basic / Premium / Pro
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),         -- active / cancelled
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    subscription_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20), -- success / failed
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
