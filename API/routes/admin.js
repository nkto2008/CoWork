const express = require('express');
const isAuthorized = require("../helper/authtoken")
const auth = require("../controller/admin/auth.js")
const user = require("../controller/admin/user.js")
const service = require("../controller/admin/service.js")
const router = express.Router()


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

router.post('/addService', isAuthorized, async(req,res) => {
    await service.addService(req.body,res)
})

router.get('/getService', isAuthorized, async(req,res) => {
    await service.getService(res)
})

router.post('/getServiceById', isAuthorized, async(req,res) => {
    await service.getServiceById(req.body, res)
})


module.exports = router