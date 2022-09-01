const bcrypt = require('bcrypt')
const UserModel = require('../../model/user.js')
const RoleModel = require('../../model/role.js')
const jwt = require("jsonwebtoken");


const login = async(body,res) => {

    const { email, password } = body;

    if (!email || !password) {
      res.status(400).send("All input is required");
    }
    // Find if user exist
    const user = await UserModel.findOne({email: email });
    const RoleUser = await RoleModel.findOne({_id: user.fk_role})
    //if my user exist and the password match
    if (user && (await bcrypt.compare(password, user.password)) && RoleUser.name == "admin") {
      // Create token
      const token = jwt.sign(
        { user_id: user._id, email },
        process.env.TS,
        {
          expiresIn: "7h",
        }
      );

      // save user token
      user.token = token;
      user.save()

      // user
      res.status(200).json(user.token);
    }else {
        res.status(400).send("Invalid Credentials")
    }
}

const logout = async(body, res) => {
    if(!body.user){
        res.status(400).send("you are not supposed to be here");
    }else {
        const email = body.user.email
        const user = await UserModel.findOne({email})
        user.token = ""
        if(user.save()){
            res.status(200).send("you are disconnected")
        }else {
            res.status(400).send("error in the process of logout")
        }
    }
}

module.exports = {login, logout}