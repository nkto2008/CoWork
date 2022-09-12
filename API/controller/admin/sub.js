const SubModel = require('../../model/sub');

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


module.exports = {createSub}