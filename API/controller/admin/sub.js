const SubModel = require('../../model/sub');
const UserModel = require('../../model/user.js')

const createSub = async(body,res) => {
    if(!body.name || !body.fk_service || !body.price){
        res.status(400).send("all input are required")
    }else{
        const newSub = new SubModel(body)
        const sub = await SubModel.find({name: body.name})
        if(sub){
            res.status(400).send("sub already exist")
        }else{
            await newSub.save()
            res.status(200).json("sub created")
        }
    }
}

const getSub = async(res) => {
        const subs = await SubModel.find()
        if(subs){
            res.status(200).json(subs)
        }else{
            res.status(400).send("no sub found")
        }
}

const getSubById = async(body, res) => {
    if(!body.id){
        res.status(400).send("all input are required")
    }else{
        const subs = await SubModel.findById({_id: body.id})
        if(subs){
            res.status(200).json(subs)
        }else{
            res.status(400).send("no sub found")
        }
    }
}

const deleteSubs = async(body,res) => {
    if(!body.id){
        res.status(40).send("all input are required")
    }else{
        const id = Mongoose.Types.ObjectId(body.id)
        const subs = await SubModel.findOneAndDelete({_id: id})
        if(subs){
            res.status(200).send("delete done")
        }else{
            res.status(400).send("No subs found")
        }
    }
}

const SubForUser = async(body,res) => {
    if(!body.id || !body.idSub){
        res.status(400).send("all input are required")
    }else{
        const user = await UserModel.find({token: id})
        if(user){
            user.fk_sub = body.idSub
            if(await user.save()){
                res.status(200).send("subscription done")
            }else{
                res.status(400).send("error")
            }
        }
    }
}



module.exports = {createSub, getSub, getSubById, deleteSubs, SubForUser}