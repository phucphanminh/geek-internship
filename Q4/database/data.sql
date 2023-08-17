USE geekinternship;

-- Insert data into the user table
INSERT INTO user (id, username, password, phone, account)
VALUES
    ('user1', 'user1_username', 'user1_password', '123456789', 'user1_account'),
    ('user2', 'user2_username', 'user2_password', '987654321', 'user2_account');

-- Insert data into the category table manually
INSERT INTO category (id, name, img) VALUES
    ('cat1', 'Category 1', 'category1.jpg'),
    ('cat2', 'Category 2', 'category2.jpg'),
    ('cat3', 'Category 3', 'category3.jpg');

-- Insert data into the product table
INSERT INTO product (id, categoryid, name, img, price, discount)
VALUES
    ('prod1', 'cat1', 'Product 1', 'product1.jpg', 100.00, 10.00),
    ('prod2', 'cat1', 'Product 2', 'product2.jpg', 150.00, NULL),
    ('prod3', 'cat2', 'Product 3', 'product3.jpg', 200.00, 20.00),
    ('prod4', 'cat2', 'Product 4', 'product4.jpg', 75.00, NULL),
    ('prod5', 'cat3', 'Product 5', 'product5.jpg', 50.00, 5.00);

-- Insert data into the store table
INSERT INTO store (id, address)
VALUES
    ('store1', '123 Store Street'),
    ('store2', '456 Shop Avenue'),
    ('store3', '789 Market Road');

-- Insert data into the sales table
INSERT INTO sales (id, userid, address, price, orderTime) VALUES
    ('sale1', 'user1', 'Address 1', 100.00, '2023-01-15 10:30:00'),
    ('sale2', 'user2', 'Address 2', 200.00, '2023-02-20 14:45:00'),
    ('sale3', 'user1', 'Address 3', 150.00, '2023-03-10 09:15:00'),
    ('sale4', 'user2', 'Address 4', 300.00, '2023-04-05 12:00:00'),
    ('sale5', 'user1', 'Address 5', 250.00, '2023-05-18 16:20:00'),
    ('sale6', 'user2', 'Address 6', 400.00, '2023-05-28 08:00:00'), 
    ('sale7', 'user1', 'Address 7', 350.00, '2023-06-25 11:30:00'), 
    ('sale8', 'user2', 'Address 8', 500.00, '2023-06-12 13:45:00'), 
    ('sale9', 'user1', 'Address 9', 450.00, '2023-08-05 09:00:00'), 
    ('sale10', 'user2', 'Address 10', 600.00, '2023-08-12 15:10:00'); 

-- Insert data into the voucher table
INSERT INTO voucher (id, name, amount)
VALUES
    ('voucher1', 'Voucher 1', 10.00),
    ('voucher2', 'Voucher 2', 25.00),
    ('voucher3', 'Voucher 3', 5.00);
    
-- Insert data into the store_product table
INSERT INTO store_product (store_id, product_id, amountRemain)
VALUES
    ('store1', 'prod1', 50),
    ('store1', 'prod2', 30),
    ('store2', 'prod3', 20),
    ('store2', 'prod4', 10),
    ('store3', 'prod5', 100);

-- Insert data into the user_voucher table
INSERT INTO user_voucher (user_id, voucher_id)
VALUES
    ('user1', 'voucher1'),
    ('user1', 'voucher2'),
    ('user2', 'voucher2');

-- Insert data into the sales_voucher table
INSERT INTO sales_voucher (sales_id, voucher_id) VALUES
    ('sale1', 'voucher1'),
    ('sale2', 'voucher2'),
    ('sale3', 'voucher3'),
    ('sale4', 'voucher1'),
    ('sale5', 'voucher2'),
    ('sale6', 'voucher3'),
    ('sale7', 'voucher1'),
    ('sale8', 'voucher2'),
    ('sale9', 'voucher3'),
    ('sale10', 'voucher1');

-- Insert data into the sales_product table manually
INSERT INTO sales_product (sales_id, product_id, quantity) VALUES
    ('sale1', 'prod1', 2),
    ('sale1', 'prod3', 1),
    ('sale2', 'prod2', 3),
    ('sale3', 'prod4', 1),
    ('sale4', 'prod3', 2),
    ('sale4', 'prod5', 1),
    ('sale5', 'prod1', 1),
    ('sale6', 'prod2', 2),
    ('sale7', 'prod4', 2),
    ('sale8', 'prod5', 3),
    ('sale8', 'prod1', 1),
    ('sale9', 'prod3', 2),
    ('sale9', 'prod2', 1),
    ('sale10', 'prod5', 2),
    ('sale10', 'prod4', 1);

