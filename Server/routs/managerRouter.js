import express from 'express';
const router = express.Router();
import dotenv from 'dotenv';
dotenv.config();

import { checkReqLogInData } from '../midddleware/midddleware.js';
import { checkManagerLogIn } from '../control/Manager.js';
import {
  getFualtByType,
  getAllProperties,
  updateReportStatus,
} from '../models/managerDB.js';
router.post('/login', checkReqLogInData, checkManagerLogIn);
router.get(`/reportsData/:id`, getFualtByType);
router.get(`/:id/allProperties`, getAllProperties);
router.put('/updateReportStatus/:reportId', updateReportStatus);
export default router;
