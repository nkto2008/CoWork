const UserModel = require('../../model/user.js')



const getAllUsers = async(body,res) => {
    const AllUsers = await UserModel.find()
    if(AllUsers){
        res.status(200).json(AllUsers)
    }else{
        res.status(400).send("No Users found")
    }

}

const getUserById = async(body,res) => {
    const user = await UserModel.findOne({_id: body.id})
    if(user){
        res.status(200).json(user)
    }else{
        res.status(400).send("No Users found")
    }

}

const getUserByRole= async(body,res) => {
    const user = await UserModel.find({fk_role: body.role})
    if(user){
        res.status(200).json(user)
    }else{
        res.status(400).send("No Users found")
    }

}





module.exports = {getAllUsers, getUserById, getUserByRole}