const db = require('../database');

exports.makePurchase = async (req, res) => {
  const { userId, storeId, productQuantities, voucherId, purchaseAddress } = req.body;
//   console.log(req.body);
  try {
    const results = await db.promise().query(`CALL MakePurchaseWithVoucher('${userId}', '${storeId}', '${productQuantities}', '${voucherId}', '${purchaseAddress}')`);
    res.json({ message: 'Purchase successfully made.' });
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: err.message });
  }
};

exports.getMonthlySalesSummary = async (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  try {
    const [results] = await db.promise().query(`CALL GetMonthlySalesSummary(${year}, ${month})`);
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getTopSellingProducts = async (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  try {
    const [results] = await db.promise().query(`CALL GetTopSellingProducts(${year}, ${month})`);
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getUserPurchaseSummary = async (req, res) => {
  const year = req.params.year;
  const month = req.params.month;

  try {
    const [results] = await db.promise().query(`CALL GetUserPurchaseSummary(${year}, ${month})`);
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
