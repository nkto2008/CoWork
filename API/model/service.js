const mongoose = require('mongoose');

const ServiceSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      price: {
        type: Number,
        default: ""
      },
    }
  );
  const service = mongoose.model("services", ServiceSchema) 
  module.exports = service