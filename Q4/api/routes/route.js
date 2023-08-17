// summaryRoutes.js
const express = require('express');
const router = express.Router();
const Controller = require('../controllers/controller.js');

router.get('/monthly-sales-summary/:year/:month', Controller.getMonthlySalesSummary);
router.get('/top-selling-products/:year/:month', Controller.getTopSellingProducts);
router.get('/user-purchase-summary/:year/:month', Controller.getUserPurchaseSummary);
router.post('/make-purchase', Controller.makePurchase);

module.exports = router;
