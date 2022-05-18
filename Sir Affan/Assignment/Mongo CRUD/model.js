mong = require("mongoose")


// employee management system
schema = mong.Schema({
    taskname : { type : String },
    timerequired :   { type : String },
    status  : { type : String }
})

model = mong.model("employees", schema )



module.exports = model


