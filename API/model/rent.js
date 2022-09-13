const mongoose = require('mongoose');

const RentSchema = new mongoose.Schema(
    {
      fk_user: {
        type: String,
        default: ""
      },
      fk_place: {
        type: String,
        default: ""
      },
      fk_pls: {
        type: String,
        default: ""
      }
    }
  );
  const rent = mongoose.model("rents", RentSchema) 
  module.exports = rent