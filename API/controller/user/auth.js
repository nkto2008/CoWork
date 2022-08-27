const bcrypt = require('bcrypt')
const UserModel = require('../../model/user.js')
const RoleModel = require('../../model/role.js')
const jwt = require("jsonwebtoken");
const Mongoose = require('mongoose');

const signUp = async (body,res) => {
    
    if (!body.email || !body.password || !body.lastname || !body.firstname || !body.pseudo || !body.phonenumber) {
        res.status(400).send("All input are required");
    }else {
        const newUser = new UserModel(body)
        const oldUser = await UserModel.findOne({ email: newUser.email })

        if (oldUser) {
            if(oldUser.phonenumber == body.phonenumber){
                res.status(400).send("you cant use this phone number")
            }else{
                res.status(400).send("User already exist");
            }
        }else {
            encryptedPassword = await bcrypt.hash(newUser.password, 10);
            newUser.password = encryptedPassword
            newUser.fk_role = Mongoose.Types.ObjectId("62e436aa1a254799431166b0")
            await newUser.save()
            res.status(200).json({message: "User created"})
        }
    }
}

const login = async(body,res) => {

    const { email, password } = body;

    if (!email || !password) {
      res.status(400).send("All input is required");
    }
    // Find if user exist
    console.log(email)
    const user = await UserModel.findOne({email: email });
    console.log(user)
    const RoleUser = await RoleModel.findOne({_id: user.fk_role})
    //if my user exist and the password match
    if (user && (await bcrypt.compare(password, user.password)) && RoleUser.name == "user") {
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
      res.status(200).json({message: user.token});
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

module.exports = {signUp, login, logout}