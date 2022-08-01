const PlaceModel = require('../../model/place.js')
const slpModel = require('../../model/placelinkschedules.js')


const addPlace = async(body,res) => {
    const {name,city,cp,horaire} = body
    if(!name || !city || !cp || !horaire){
        res.status(400).send("All input are required")
    }else{
        const place = new PlaceModel(body)
        const checkPlace = await PlaceModel.findOne({name: place.name})
        if(checkPlace){
            res.status(400).send("this place already exist")
        }else{
            if(place.save()){
                let count = 0
                const arrayTime = ["62e7eb1851e22ff8eed0a9e5","62e7eb2a51e22ff8eed0a9e6","62e7eb3551e22ff8eed0a9e7","62e7eb4151e22ff8eed0a9e8","62e7eb4a51e22ff8eed0a9e9","62e7eb5351e22ff8eed0a9ea","62e7eb6051e22ff8eed0a9eb"]
                for(let i in horaire){
                    let arraySchedules = {"idPlace": place._id, "idSchedules": arrayTime[count],"time": body.horaire[i]}
                    console.log(arraySchedules)
                    let schedules = new slpModel(arraySchedules)
                    schedules.save()
                    count++
                }
                res.status(200).send("new place created")
            }else{
                res.status(400).send("error in creation of new place")
            }
        }  
    }

}
// !!!!!!!! NEED TO SEND SCHEDULES TOO
const getPlace = async(res) => {
    const places = await PlaceModel.find()
    if(places){
        res.status(200).send(places)
    }else{
        res.status(400).send("no place found")
    }

}

const getPlaceById = async(body,res) => {
    const place = await PlaceModel.findOne({_id: body.id})
    if(place){
        res.status(200).send(place)
    }else{
        res.status(400).send("no place found")
    }

}

const updatePlace = async(body,res) => {
    const {id, name, city, cp, horaire} = body
    const place = await PlaceModel.findOne({_id: id})
    if(place){
        if(!name){
            place.name = name
        }
        if(!city){
            place.city = city
        }
        if(!cp){
            place.cp = cp
        }
        if(!horaire){
            
        }
            
    }else{
        res.status(400).send("no place found")
    }
}

const deletePlace = async(body,res) => {
    const {id} = body
    if(!id){
        res.status(400).send("all input are required")
    }else{
        const schedules = await slpModel.find({idPlace: id})
        for(let i = 0; i < schedules.length; i++){
            await slpModel.findOneAndDelete({idPlace: id})
        }
        const place = await PlaceModel.findOne({_id: id})
        if(place.delete()){
            res.status(200).send("Place delete success")
        }else{
            res.status(400).send("error in delete place process")
        }

    }
}



module.exports = {addPlace, getPlace, getPlaceById, updatePlace, deletePlace}