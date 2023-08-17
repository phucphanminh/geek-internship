DROP SCHEMA IF EXISTS geekinternship;
CREATE SCHEMA geekinternship;
USE geekinternship;

-- Tạo bảng Store
CREATE TABLE store (
    id CHAR(20) PRIMARY KEY NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Tạo bảng Category
CREATE TABLE category (
    id CHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL
);

-- Tạo bảng Product
CREATE TABLE product (
    id CHAR(20) PRIMARY KEY NOT NULL,
    categoryid CHAR(20) NOT NULL,
    name VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10, 2),
    FOREIGN KEY (categoryid) REFERENCES category(id)
);

-- Tạo bảng User
CREATE TABLE user (
    id CHAR(20) PRIMARY KEY NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    account VARCHAR(255) NOT NULL
);

-- Tạo bảng Voucher
CREATE TABLE voucher (
    id CHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

-- Tạo bảng Sales
CREATE TABLE sales (
    id CHAR(20) PRIMARY KEY NOT NULL,
    userid CHAR(20) NOT NULL,
    address TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    orderTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES user(id)
);

-- Tạo bảng Store_Product
CREATE TABLE store_product (
    store_id CHAR(20) NOT NULL,
    product_id CHAR(20) NOT NULL,
    amountRemain INT NOT NULL,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Tạo bảng User_Voucher
CREATE TABLE user_voucher (
    user_id CHAR(20) NOT NULL,
    voucher_id CHAR(20) NOT NULL,
    PRIMARY KEY (user_id, voucher_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (voucher_id) REFERENCES voucher(id)
);

-- Tạo bảng Sales_Voucher
CREATE TABLE sales_voucher (
    sales_id CHAR(20) NOT NULL,
    voucher_id CHAR(20) NOT NULL,
    PRIMARY KEY (sales_id, voucher_id),
    FOREIGN KEY (sales_id) REFERENCES sales(id),
    FOREIGN KEY (voucher_id) REFERENCES voucher(id)
);

-- Tạo bảng Sales_Product
CREATE TABLE sales_product (
    sales_id CHAR(20) NOT NULL,
    product_id CHAR(20) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (sales_id, product_id),
    FOREIGN KEY (sales_id) REFERENCES sales(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
