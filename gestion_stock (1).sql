
-- SQL file for a simple stock management system
-- Three tables: categories, products, stock_movements

DROP TABLE IF EXISTS stock_movements;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE stock_movements (
    id INT PRIMARY KEY,
    product_id INT,
    movement_type VARCHAR(10), -- IN or OUT
    quantity INT NOT NULL,
    movement_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample data
INSERT INTO categories VALUES
(1, 'Informatique'),
(2, 'Fournitures'),
(3, 'Électronique');

INSERT INTO products VALUES
(1, 'Clavier mécanique', 1, 79.90),
(2, 'Souris sans fil', 1, 29.99),
(3, 'Ramette de papier A4', 2, 5.50),
(4, 'Casque audio', 3, 49.00);

INSERT INTO stock_movements VALUES
(1, 1, 'IN', 50, '2025-01-10'),
(2, 1, 'OUT', 5, '2025-01-15'),
(3, 2, 'IN', 100, '2025-02-01'),
(4, 3, 'IN', 200, '2025-02-05'),
(5, 3, 'OUT', 20, '2025-02-10'),
(6, 4, 'IN', 40, '2025-02-12');
