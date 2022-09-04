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



module.exports = router