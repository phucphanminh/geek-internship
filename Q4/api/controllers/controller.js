const db = require('../database');

exports.makePurchase = (req, res) => {
  const { userId, storeId, productQuantities, voucherId, purchaseAddress } = req.body;

  db.query(`CALL MakePurchaseWithVoucher('${userId}', '${storeId}', '${productQuantities}', '${voucherId}', '${purchaseAddress}')`, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: 'Purchase successfully made.' });
    }
  });
};

exports.getMonthlySalesSummary = (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  db.query(`CALL GetMonthlySalesSummary(${year}, ${month})`, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results[0]);
    }
  });
};

exports.getTopSellingProducts = (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  db.query(`CALL GetTopSellingProducts(${year}, ${month})`, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results[0]);
    }
  });
};

exports.getUserPurchaseSummary = (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  db.query(`CALL GetUserPurchaseSummary(${year}, ${month})`, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results[0]);
    }
  });
};