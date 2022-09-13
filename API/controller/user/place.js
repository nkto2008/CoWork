const PlaceModel = require('../../model/place.js')
const slpModel = require('../../model/placelinkschedules.js')
const RentModel = require('../../model/rent.js')
const Mongoose = require('mongoose')

const getPlaceUser = async(res) => {
    const places = await PlaceModel.find()

    if(places){
        var tmp = []
        for(i in places){
            var horaire = await slpModel.find({idPlace: places[i]._id})
            var result = [{"place":places[i],"schedules": horaire}]
            tmp = tmp.concat(result)
        }
        res.status(200).send(tmp)
    }else{
        res.status(400).send("no place found")
    }
}

module.exports = {getPlaceUser}