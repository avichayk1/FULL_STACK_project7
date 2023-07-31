import { pool, con, pool1 } from './connection.js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url'; // Import fileURLToPath
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function managerLogIn(user) {
  console.log('in function managerLogIn');
  const sql = `SELECT * FROM managers where email="${user.email}" and password="${user.password}"`;
  const res = pool.query(sql);
  //   console.log(JSON.parse(res[0]));
  return res;
}
async function getFualtByType(req, res) {
  console.log('in function getFualtByType');
  const id = req.params;
  const { property_id, status, type } = req.query;

  const sql = `SELECT * FROM reports WHERE property_id=${property_id} and status="${status}" and type="${type}"`;

  try {
    const result = await pool.query(sql);
    const reports = result[0];

    // Read the image file and convert it to a base64 string
    for (const report of reports) {
      if (report.image_path) {
        // Extract the file name from the path
        // Convert the relative path to an absolute path
        const imageFilePath = path.join(__dirname, '..', report.image_path);
        const imageBase64 = fs.readFileSync(imageFilePath, {
          encoding: 'base64',
        });
        report.image = `data:image/jpeg;base64,${imageBase64}`;
      }
    }
    console.log(reports);
    return res.status(200).json(reports);
  } catch (error) {
    console.error('Error fetching reports:', error);
    return res.status(500).json({ error: 'Error fetching reports' });
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

async function getManagerDetails(id) {
  console.log('in function getManagerDetails');
  const sql = `SELECT full_name, phone, email from managers WHERE manager_id = ${id}`;
  const response = pool.query(sql);
  return response;
}

export {
  managerLogIn,
  getFualtByType,
  getAllProperties,
  updateReportStatus,
  getManagerDetails,
};
