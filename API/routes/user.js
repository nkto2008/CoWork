const express = require('express');
const isAuthorized = require("../helper/authtoken")
const auth = require("../controller/user/auth.js")
const router = express.Router()


// Define the User schema in the swagger, we will use it in endpoints descriptions

/**
 * @swagger
 * components:
 *   schemas:
 *     User:
 *       type: object
 *       required:
 *         - firstname
 *         - lastname
 *         - phonenumber
 *         - pseudo
 *         - email
 *         - password
 *       properties:
 *         id:
 *           type: string
 *           description: The auto-generated id of the book
 *         firstname:
 *           type: string
 *           description: The user firstname
 *         lastname:
 *           type: string
 *           description: The user lastname
 *         phonenumber:
 *           type: string
 *           description: The user phone number
 *         pseudo:
 *           type: string
 *           description: The user pseudo
 *         email:
 *           type: string
 *           description: The user email
 *         password:
 *           type: string
 *           description: The user password
 *         token:
 *           type: string
 *           description: The user token for authentication
 *         fk_role:
 *           type: string
 *           description: The user role
 *       example:
 *         id: 2e79c624d47102bb0cc16
 *         firstname: Tagri
 *         lastname: Hokuto
 *         phonenumber: 0601020304
 *         pseudo: Yone_btc
 *         email: yone4life@gmail.com
 *         password: b$10$yvw6V2yM9KmM4kFCD6GJ8ukeuvwZNcJeOGQGeKB.5lr2FfI.D
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     UserLogin:
 *       type: object
 *       required:
 *         - email
 *         - password
 *       properties:
 *         email:
 *           type: string
 *           description: The user email
 *         password:
 *           type: string
 *           description: The user password
 *       example:
 *         email: yone4life@gmail.com
 *         password: b$10$yvw6V2yM9KmM4kFCD6GJ8ukeuvwZNcJeOGQGeKB.5lr2FfI.D
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     UserPost:
 *       type: object
 *       properties:
 *         token:
 *           type: string
 *           description: The user token
 *       example:
 *         token: JhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjJlYmJlZGZhMmRi...
 */

 /**
  * @swagger
  * tags:
  *   name: User
  *   description: User management
  */
router.post('/login', async (req, res) => {
    await auth.login(req.body, res)
})


/**
 * @swagger
 * /login:
 *   post:
 *     summary: Login a user
 *     tags: [User]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/UserLogin'
 *     responses:
 *       200:
 *         description: The user was successfully created
 *         content:
 *           application/json:
 *             schema:
 *                 $ref: '#/components/schemas/UserPost'
 *       500:
 *         description: Internal server error
 */

router.post('/signUp', async (req, res) => {
    await auth.signUp(req.body, res)
})

/**
 * @swagger
 * /signUp:
 *   post:
 *     summary: Create a new user
 *     tags: [User]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/User'
 *     responses:
 *       200:
 *         description: The user was successfully created
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/User'
 *       500:
 *         description: Internal server error
 */

router.post('/logout', isAuthorized, async (req, res) => {
    await auth.logout(req, res)
})


module.exports = router