const mongoose = require('mongoose');

const SchedulesSchema = new mongoose.Schema(
    {
      day: {
        type: String,
        default: ""
      }
    }
  );
  const schedules = mongoose.model("schedules", SchedulesSchema) 
  module.exports = schedules