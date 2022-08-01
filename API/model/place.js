const mongoose = require('mongoose');

const PlaceSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      city: {
        type: String,
        default: ""
      },
      cp: {
        type: Number,
        default: ""
      },
    }
  );
  const place = mongoose.model("places", PlaceSchema) 
  module.exports = place