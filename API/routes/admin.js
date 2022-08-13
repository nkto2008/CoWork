const express = require('express');
const isAuthorized = require("../helper/authtoken")
const auth = require("../controller/admin/auth.js")
const router = express.Router()


router.post('/welcome', async (req, res) => {
    await auth.login(req.body,res)
})

router.post('/bye', isAuthorized, async(req, res) => {
    await auth.logout(req,res)
})

/**
 * @swagger
 * components:
 *   schemas:
 *     AdminLogin:
 *       type: object
 *       required:
 *         - email
 *         - password
 *       properties:
 *         email:
 *           type: string
 *           description: The admin email
 *         password:
 *           type: string
 *           description: The admin password
 *       example:
 *         email: yone4life@gmail.com
 *         password: YoneBtcEth
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     AdminToken:
 *       type: object
 *       properties:
 *         token:
 *           type: string
 *           description: The admin token
 *       example:
 *         token: JhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjJlYmJlZGZhMmRi...
 */

/**
 * @swagger
 * components:
 *   securitySchemes:
 *    bearerAuth:
 *     type: http
 *     scheme: bearer
 *     bearerFormat: JWT
 */

 /**
  * @swagger
  * tags:
  *   name: Admin
  *   description: Admin management
  */


/**
 * @swagger
 * /welcome:
 *   post:
 *     summary: Login a admin
 *     tags: [Admin]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/AdminLogin'
 *     responses:
 *       200:
 *         description: The admin was successfully login
 *         content:
 *           application/json:
 *             schema:
 *                 $ref: '#/components/schemas/AdminToken'
 *       500:
 *         description: Internal server error
 */

/**
 * @swagger
 * /bye:
 *   post:
 *     summary: Logout a admin
 *     tags: [Admin]
 *     security:
 *      - bearerAuth: []
 *     responses:
 *       200:
 *         description: The admin was successfully disconnected
 *         content:
 *           text/html:
 *             schema:
 *              type: string
 *             required: true
 *             description: confirm logout
 *             example: "you are disconnected"
 *       500:
 *         description: Internal server error
 */



module.exports = router