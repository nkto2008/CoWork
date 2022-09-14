const mongoose = require('mongoose');

const ServiceSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      price: {
        type: Number,
        default: 0.0
      },
    }
  );
  const service = mongoose.model("services", ServiceSchema) 
  module.exports = service