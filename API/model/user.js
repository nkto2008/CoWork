const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema(
    {
      firstname: {
        type: String,
        default: ""
      },
      phonenumber: {
        type: String,
        default: ""
      },
      lastname: {
        type: String,
        default: ""
      },
      pseudo: {
        type: String,
        default: ""
      },
      email: {
        type: String,
        default: ""
      },
      password: {
        type: String,
        default: ""
      },
      token: {
        type: String,
        default: ""
      },
      fk_role: {
        type: String,
        default: ""
      },
      fk_sub: {
        type: String,
        default: ""
      }
    }
  );
  const user = mongoose.model("users", UserSchema) 
  module.exports = user