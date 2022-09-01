const express = require('express');
const isAuthorized = require("../helper/authtoken")
const auth = require("../controller/admin/auth.js")
const user = require("../controller/admin/user.js")
const service = require("../controller/admin/service.js")
const place = require("../controller/admin/place.js")
const router = express.Router()


//User routes

router.post('/welcome', async (req, res) => {
    await auth.login(req.body,res)
})

router.post('/bye', isAuthorized, async(req, res) => {
    await auth.logout(req,res)
})

router.get('/getUsers', isAuthorized, async(req,res) => {
    await user.getAllUsers(req,res)
})

router.post('/getUserById',isAuthorized,async(req,res) => {
    await user.getUserById(req.body, res)
})

router.post('/getUserByRole',isAuthorized, async(req,res) => {
    await user.getUserByRole(req.body, res)
})

router.delete('/deleteUsers', isAuthorized, async(req,res) => {
    await user.deleteUsers(req.body,res)
})
//Service Routes
router.post('/addService', isAuthorized, async(req,res) => {
    await service.addService(req.body,res)
})

router.get('/getService', isAuthorized, async(req,res) => {
    await service.getService(res)
})

router.post('/getServiceById', isAuthorized, async(req,res) => {
    await service.getServiceById(req.body, res)
})

router.patch('/updateService', isAuthorized, async(req,res) => {
    await service.updateService(req.body, res)
})

router.delete('/deleteService', isAuthorized, async(req,res) => {
    await service.deleteService(req.body, res)
})

//Lieux routes

router.post('/createPlace',isAuthorized, async(req,res) => {
    await place.addPlace(req.body,res)
})

router.get('/getPlace', isAuthorized, async(req,res) => {
    await place.getPlace(res)
})

router.post('/getPlaceById', isAuthorized, async(req,res) => {
    await place.getPlaceById(req.body, res)
})

router.patch('/updatePlace', isAuthorized, async(req,res) => {
    await place.updatePlace(req.body, res)
})

router.delete('/deletePlace', isAuthorized, async(req,res) => {
    await place.deletePlace(req.body, res)
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