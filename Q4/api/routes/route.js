const express = require('express');
const router = express.Router();
const Controller = require('../controllers/controller.js');

router.get('/monthly-sales-summary/:year/:month', Controller.getMonthlySalesSummary);
router.get('/top-selling-products/:year/:month', Controller.getTopSellingProducts);
router.get('/user-purchase-summary/:year/:month', Controller.getUserPurchaseSummary);
router.post('/make-purchase', Controller.makePurchase);
// JSON.body
// {
//   "userId": "user1",
//   "storeId": "store3",
//   "productQuantities": "[{\"product_id\": \"prod1\", \"quantity\": 2}, {\"product_id\": \"prod2\", \"quantity\": 1}]",
//   "voucherId": "voucher1",
//   "purchaseAddress": "123 Store Street"
// }

// const dataObject = {};
// dataObject.userId = 'user1';
// dataObject.storeId = 'store3';
// dataObject.voucherId = 'voucher1';
// dataObject.purchaseAddress = '123 Store Street';

// // Tạo mảng productQuantities
// dataObject.productQuantities = [];
// dataObject.productQuantities.push({ product_id: 'prod1', quantity: 2 });
// dataObject.productQuantities.push({ product_id: 'prod2', quantity: 1 });

// console.log(dataObject);

module.exports = router;
