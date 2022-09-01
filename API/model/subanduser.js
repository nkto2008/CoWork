const mongoose = require('mongoose');

const SubUserSchema = new mongoose.Schema(
    {
      user_fk: {
        type: String,
        default: ""
      },
      sub_fk: {
        type: Number,
        default: ""
      },
      date: {
        type: Date,
        default: ""
      }
    }
  );
  const subanduser = mongoose.model("subandusers", SubUserSchema) 
  module.exports = subanduser