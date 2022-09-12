const UserModel = require('../../model/user.js')


const createAccount = async(body,res) => {
    if (!body.email || !body.password || !body.lastname || !body.firstname || !body.pseudo || !body.phonenumber || !body.fk_role) {
        res.status(400).send("All input are required");
    }else {
        const newUser = new UserModel(body)
        const oldUser = await UserModel.findOne({ email: newUser.email })

        if (oldUser) {
                res.status(400).send("User already exist");
        }else {
            encryptedPassword = await bcrypt.hash(newUser.password, 10);
            newUser.password = encryptedPassword
            newUser.fk_role = Mongoose.Types.ObjectId("62e436aa1a254799431166b0")
            await newUser.save()
            res.status(200).json({message: "User created"})
        }
    }
}

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

const deleteUsers= async(body,res) => {
    const user = await UserModel.findOneAndDelete({_id: body.id})
    if(user){
        res.status(200).send("User delete success")
    }else{
        res.status(400).send("User not found")
    }

}





module.exports = {getAllUsers, getUserById, getUserByRole, deleteUsers, createAccount}