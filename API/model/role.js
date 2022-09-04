const mongoose = require('mongoose');

const RoleSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
    }
  );
  const role = mongoose.model("roles", RoleSchema) 
  module.exports = role