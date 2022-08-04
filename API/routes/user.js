const express = require('express');
const isAuthorized = require("../helper/authtoken")
const auth = require("../controller/user/auth.js")
const router = express.Router()

router.post('/login', async (req, res) => {
    await auth.login(req.body, res)
})

router.post('/signUp', async (req, res) => {
    await auth.signUp(req.body, res)

})

router.post('/logout', isAuthorized, async (req, res) => {
    await auth.logout(req, res)
})

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
 *       example:
 *         id: 2e79c624d47102bb0cc16
 *         firstname: Tagri
 *         lastname: Hokuto
 *         phonenumber: 0601020304
 *         pseudo: Yone_btc
 *         email: yone4life@gmail.com
 */

module.exports = router