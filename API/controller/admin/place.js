const PlaceModel = require('../../model/place.js')
const slpModel = require('../../model/placelinkschedules.js')
const SchedulesModel = require('../../model/schedules.js')


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
                const arrayTime = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"]
                for(let i in horaire){

                    let arraySchedules = {"idPlace": place._id, "day": arrayTime[count],"time": body.horaire[i],"rent": 0}
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

const getPlace = async(res) => {
    const places = await PlaceModel.find().sort({_id: -1})

    if(places){
        var tmp = []
        for(i in places){
            var horaire = await slpModel.find({idPlace: places[i]._id}).sort({_id: 1})
            var result = [{"place":places[i],"schedules": horaire}]
            tmp = tmp.concat(result)
        }
        res.status(200).send(tmp)
    }else{
        res.status(400).send("no place found")
    }
}

const getPlaceById = async(body,res) => {
    const place = await PlaceModel.findOne({_id: body.id})
    if(place){
        var horaire = await slpModel.find({idPlace: place._id})
        var result = {"place":place,"schedules": horaire}
        res.status(200).send(result)
    }else{
        res.status(400).send("no place found")
    }
}

const updatePlace = async(body,res) => {
    const {id, name, city, cp, horaire} = body
    const place = await PlaceModel.findOne({_id: id})
    const timesch = await slpModel.find({idPlace: id}).sort({_id: 1})
    if(place){
        if(name){
            place.name = name
        }
        if(city){
            place.city = city
        }
        if(cp){
            place.cp = cp
        }
        if(horaire){
            const arrayTime = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"]
            var counter = 0
            for(i in timesch){
                var day = arrayTime[counter]
                if(horaire[day] != ""){
                    timesch[i].time = horaire[day]
                    timesch[i].rent = false
                    await timesch[i].save()
                }
                counter++
            }
        }
        place.save()
        res.status(200).send("update place")

            
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