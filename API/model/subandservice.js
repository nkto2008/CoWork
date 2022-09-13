const mongoose = require('mongoose');

const SubAndServiceSchema = new mongoose.Schema(
    {
      fk_sub: {
        type: String,
        default: ""
      },
      fk_service: {
        type: String,
        default: ""
      },
    }
  );
  const subandservices = mongoose.model("subsandservices", SubAndServiceSchema) 
  module.exports = subandservices