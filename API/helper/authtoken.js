const jwt = require("jsonwebtoken");
const UserModel = require("../model/user.js")

const config = process.env;

const isAuthorized = async (req, res, next) => {
    var token = req.headers["authorization"];
    if (token.includes("Bearer")) {
        token = token.replace("Bearer ", "");
    }
    const user = await UserModel.findOne({token})
    if (!token || !user) {
        return res.status(403).send("Something wrong with your request");
    }
    try {
        const decodetoken = jwt.verify(token, config.TS);
        req.user = decodetoken;
    } catch (err) {
        return res.status(401).send("Invalid Token");
    }
    return next();
};

module.exports = isAuthorized;