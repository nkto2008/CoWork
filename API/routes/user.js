const express = require('express');
const isAuthorized = require("../helper/authtoken")
const router = express.Router()

router.post('/login', async (req, res) => {
    await auth.login(req.body,res)
})

router.post('/signUp', async (req, res) => {
    await auth.SignUp(req.body,res)

})

router.post('/logout', isAuthorized, async(req, res) => {
    await auth.logout(req,res)
})



module.exports = router