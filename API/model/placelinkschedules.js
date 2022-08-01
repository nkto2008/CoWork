const mongoose = require('mongoose');

const SLPSchema = new mongoose.Schema(
    {
      idPlace: {
        type: String,
        default: ""
      },
      idSchedules: {
        type: String,
        default: ""
      },
      time: {
        type: String,
        default: ""
      }
    }
  );
  const slp = mongoose.model("scheduleslinkplaces", SLPSchema) 
  module.exports = slp