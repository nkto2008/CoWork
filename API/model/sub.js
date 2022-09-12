const mongoose = require('mongoose');

const SubSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      fk_service: {
        type: String,
        default: ""
      },
      price: {
        type: Number,
        default: ""
      }
    }
  );
  const sub = mongoose.model("subscriptions", SubSchema) 
  module.exports = sub