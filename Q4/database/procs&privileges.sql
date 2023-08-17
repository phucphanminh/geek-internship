USE geekinternship;

DELIMITER $$
DROP PROCEDURE IF EXISTS `MakePurchaseWithVoucher`$$
CREATE PROCEDURE MakePurchaseWithVoucher(
    IN userId CHAR(20),
    IN storeId CHAR(20),
    IN productQuantities JSON, -- JSON array of product IDs and quantities
    IN voucherId CHAR(20),
    IN purchaseAddress TEXT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE product_id CHAR(20);
    DECLARE quantity INT;
    DECLARE totalAmount DECIMAL(10, 2);
    DECLARE voucherAmount DECIMAL(10, 2);
    DECLARE productPrice DECIMAL(10, 2);
    
    -- Calculate the total price of the products including shipping fees
    SET totalAmount = 0.00; -- Initial total

    -- Loop through the JSON array of product IDs and quantities
    SET i = JSON_LENGTH(productQuantities);
    
    WHILE i > 0 DO
        SET product_id = JSON_UNQUOTE(JSON_EXTRACT(productQuantities, CONCAT('$[', i - 1, '].product_id')));
        SET quantity = JSON_UNQUOTE(JSON_EXTRACT(productQuantities, CONCAT('$[', i - 1, '].quantity')));
        
        -- Add the price of the product to the total
        SELECT price INTO productPrice
        FROM product
        WHERE id = product_id;
        SET totalAmount = totalAmount + productPrice;
        SET i = i - 1;
    END WHILE;

    -- Get the amount of the voucher
    SELECT amount INTO voucherAmount
    FROM voucher
    WHERE id = voucherId;

    -- Calculate the final price after applying the voucher
    SET totalAmount = totalAmount - voucherAmount;

    -- Insert sales record
    INSERT INTO sales (id, userid, address, price)
    VALUES (LEFT(UUID(), 20), userId, purchaseAddress, totalAmount);

    -- Loop through the JSON array again to insert sales-product relationships
    SET i = JSON_LENGTH(productQuantities);
    
    WHILE i > 0 DO
        SET product_id = JSON_UNQUOTE(JSON_EXTRACT(productQuantities, CONCAT('$[', i - 1, '].product_id')));
        SET quantity = JSON_UNQUOTE(JSON_EXTRACT(productQuantities, CONCAT('$[', i - 1, '].quantity')));
        
        -- Insert sales-product relationships
        INSERT INTO sales_product (sales_id, product_id, quantity)
        VALUES ((SELECT id FROM sales WHERE userid = userId ORDER BY orderTime DESC LIMIT 1), product_id, quantity);
        
        SET i = i - 1;
    END WHILE;

    -- Insert sales-voucher relationship
    INSERT INTO sales_voucher (sales_id, voucher_id)
    VALUES ((SELECT id FROM sales WHERE userid = userId ORDER BY orderTime DESC LIMIT 1), voucherId);
END $$
DELIMITER ;

CALL MakePurchaseWithVoucher('user1', 'store1',
  '[{"product_id": "prod1", "quantity": 2},
    {"product_id": "prod2", "quantity": 1},
    {"product_id": "prod3", "quantity": 3}]',
  'voucher1', '123 Đường ABC, Quận XYZ, Thành phố ABC');
  

DELIMITER $$
DROP PROCEDURE IF EXISTS `GetMonthlySalesSummary`$$
CREATE PROCEDURE GetMonthlySalesSummary(IN yearVal INT, IN monthVal INT)
BEGIN
    SELECT 
        YEAR(orderTime) AS year,
        MONTH(orderTime) AS month,
        COUNT(id) AS totalOrders,
        SUM(price) AS totalRevenue
    FROM sales
    WHERE YEAR(orderTime) = yearVal AND MONTH(orderTime) = monthVal
    GROUP BY year, month;
END $$

DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS `GetTopSellingProducts`$$
CREATE PROCEDURE GetTopSellingProducts(IN yearVal INT, IN monthVal INT)
BEGIN
    SELECT 
        sp.product_id,
        p.name AS product_name,
        SUM(sp.quantity) AS total_quantity
    FROM sales_product sp
    JOIN product p ON sp.product_id = p.id
    WHERE EXISTS (
        SELECT 1
        FROM sales s
        WHERE s.id = sp.sales_id
        AND YEAR(s.orderTime) = yearVal AND MONTH(s.orderTime) = monthVal
    )
    GROUP BY sp.product_id, product_name
    ORDER BY total_quantity DESC
    LIMIT 10;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `GetUserPurchaseSummary`$$
CREATE PROCEDURE GetUserPurchaseSummary(IN yearVal INT, IN monthVal INT)
BEGIN
    SELECT 
        s.userid,
        u.username,
        SUM(s.price) AS total_purchase
    FROM sales s
    JOIN user u ON s.userid = u.id
    WHERE YEAR(s.orderTime) = yearVal AND MONTH(s.orderTime) = monthVal
    GROUP BY s.userid, u.username
    ORDER BY total_purchase DESC;
END $$
DELIMITER ;


CALL GetMonthlySalesSummary(2023, 8);
CALL GetTopSellingProducts(2023, 8);
CALL GetUserPurchaseSummary(2023, 8);


  
  

