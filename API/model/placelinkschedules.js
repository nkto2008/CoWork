const mongoose = require('mongoose');

const SLPSchema = new mongoose.Schema(
    {
      idPlace: {
        type: String,
        default: ""
      },
      time: {
        type: String,
        default: ""
      },
      day :{
        type: String,
        default: ""
      },
      rent : {
        type: Boolean,
        default: ""
      }
    }
  );
  const slp = mongoose.model("scheduleslinkplaces", SLPSchema) 
  module.exports = slp