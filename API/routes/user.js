const express = require('express');
const auth = require('../controller/user/auth.js')
const isAuthorized = require("../Helper/authotoken")
const router = express.Router()

router.post('/login', async (req, res) => {
    await auth.login(req.body,res)
})

router.post('/signUp', async (req, res) => {
    await auth.ParseInput(req.body,res)

})

router.post('/logout', isAuthorized, async(req, res) => {
    await auth.logout(req,res)
})



module.exports = router