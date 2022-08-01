const ServiceModel = require('../../model/service.js')



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






module.exports = {addService, getService, getServiceById}