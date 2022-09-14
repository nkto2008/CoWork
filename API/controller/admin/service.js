const ServiceModel = require('../../model/service.js')
const Mongoose = require('mongoose');


const addService = async(body,res) => {
    const {name,price} = body
    if(!name || !price){
        res.status(400).send("All input are required")
    }else{
        const existService = await ServiceModel.findOne({name: name})
        if(existService){
            res.status(200).send("this service already exist")
        }else{
            const service = new ServiceModel(body)
            service.save()
            res.status(200).send("service create")
        }
    }

}

const getService = async(res) => {
    const services = await ServiceModel.find()
    if(services){
        res.status(200).json(services)
    }else{
        res.status(400).send("no services found")
    }

}

const getServiceById = async(body,res) => {
    console.log(body.service)
    const id = body.service
    if(!id){
        res.status(400).send("All input are required")
    }else{
        const Service = await ServiceModel.findOne({_id: id})
        if(Service){
            res.status(200).json(Service)
        }else{
            res.status(400).send("No Service found")
        }
    }

}

const updateService = async(body,res) => {

    const id = body.id
    if(id){
        const idServ = Mongoose.Types.ObjectId(id)
        const serv = await ServiceModel.findOne({_id: idServ})

        if(!serv){
            res.status(403).send("Something wrong with your request");
        } else {
            if(body.name) {
                serv.name = body.name
            }
            if(body.price) {
                serv.price = body.price
            }
            serv.save()
            res.status(200).send("update done")
        }
    } else {
        res.status(403).send("ID missed");
    }

}

const deleteService = async(body,res) => {
    const id = body.id
    if(!id){
        res.status(400).send("All input are required")
    }else{
        const idService = Mongoose.Types.ObjectId(id)
        console.log(idService)
        const Service = await ServiceModel.findOneAndDelete({_id: idService})
        if(Service){
            res.status(200).send("delete done")
        }else{
            res.status(400).send("No Service found")
        }
    }
}






module.exports = {addService, getService, getServiceById, updateService,deleteService}