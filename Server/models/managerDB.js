import { pool, con, pool1 } from './connection.js';
async function managerLogIn(user) {
  console.log('in function managerLogIn');
  const sql = `SELECT * FROM managers where email="${user.email}" and password="${user.password}"`;
  const res = pool.query(sql);
  //   console.log(JSON.parse(res[0]));
  return res;
}
async function getFualtByType(req, res) {
  const id = req.params;
  const { property_id, status, type } = req.query;

  console.log('in function getFualtByType');
  console.log(status);
  const sql = `SELECT * FROM reports where property_id=${property_id} and status="${status}" and type="${type}"  `;

  try {
    const resualt = await pool.query(sql);
    console.log(resualt[0]);
    return res.status(200).json(resualt[0]);
  } catch (error) {
    console.error('Error adding report:', error);
    return res.status(500).json({ error: 'Error adding report' });
  }
}
async function getAllProperties(req, res) {
  console.log('in function getAllPropertiesNumbers');
  const sql = `SELECT id,city,address FROM properties where manager_id=${req.params.id}`;
  try {
    const resualt = await pool.query(sql);
    // console.log(resualt[0]);
    return res.status(200).json(resualt[0]);
  } catch (error) {
    console.error('Error adding report:', error);
    return res.status(500).json({ error: 'Error adding report' });
  }
}
async function updateReportStatus(req, res) {
  console.log('in function updateReportStatus');

  const reportId = req.params.reportId;
  const { status } = req.body;
  console.log(reportId, ' ', status);
  try {
    const updateQuery = `UPDATE reports SET status = ? WHERE fault_id = ?`;
    await pool.query(updateQuery, [status, reportId]);

    res.status(200).json({ message: 'Report status updated successfully.' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error.' });
  }
}

export { managerLogIn, getFualtByType, getAllProperties, updateReportStatus };
