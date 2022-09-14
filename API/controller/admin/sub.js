const SubModel = require('../../model/sub');
const UserModel = require('../../model/user.js')
const SSModel = require('../../model/subandservice')
const ServiceModel = require('../../model/service')

const createSub = async(body,res) => {
    if(!body.name || !body.services || !body.price){
        res.status(400).send("all input are required")
    }else{
        const newSub = new SubModel(body)
        const sub = await SubModel.findOne({name: body.name})
        if(sub){
            res.status(400).send("sub already exist")
        }else{
            if(newSub.save()){
                const services = body.services
                for(let i in services){
                    let nameservice = await ServiceModel.findOne({_id: services[i].service})
                    let arraySS = {"fk_sub": newSub._id, "fk_service": nameservice._id}
                    let sands = new SSModel(arraySS)
                    sands.save()
                }
            }
            res.status(200).json("sub created")
        }
    }
}

const getSub = async(res) => {
        const subs = await SubModel.find()
        if(subs){
            var tmp = []
            var services = []
            for(i in subs){
                var sands = await SSModel.find({fk_sub: subs[i]._id}).sort({_id: 1})
                for(j in sands){
                    var service = await ServiceModel.findOne({_id: sands[j].fk_service})
                    services.push(service)
                }
                var result = [{"sub":subs[i],"service": services}]
                tmp = tmp.concat(result)
                services = []
            }
            res.status(200).send(tmp)
        }else{
            res.status(400).send("no sub found")
        }
        res.status(200).send(tmp)
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
        const user = await UserModel.find({token: body.id})
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

const getSubUser = async(body,res) => {
    if(!body.token){
        res.status(400).send("all input are required")
    }else{
        const user = await UserModel.find({token: body.token})
        if(user){
            if(user.fk_sub){
                const sub = await SubModel.find({_id: user.fk_sub})
                if(sub){
                    res.status(200).send(sub)
                }else{
                    res.status(400).send("no sub find for this id sub")
                }
            }else{
                res.status(400).send("no sub find for this user")
            }
        }else{
            res.status(400).send("no user find with token")
        }
    }
}



module.exports = {createSub, getSub, getSubById, deleteSubs, SubForUser, getSubUser}