exp = require("express")
routes = exp.Router()

//importing 
var model1 = require("./model")

routes.get("/home",(req,res)=>{
    res.send("THIS IS HOME PAGE")
})


  
routes.post("/create", async(req,res)=>{
    console.log(req.body);
    model1.insertMany([{
        "taskname" : req.body.name,
        "timerequired" :   req.body.timerequired,
        "status"  : req.body.status
    }])
    
    res.json("req.body")
})



routes.post("/remove", (req,res)=>{
    console.log(req.body);
    model1.remove({
        name : req.body.name
    }).exec()     // in delete AND UPDTAE we should use exec()
    
    res.json("Task Created")
})



routes.post("/update", (req,res)=>{
    console.log(req.body);
    model1.findOneandUpdate({
        name : req.body.name
    }).exec()    
    
    res.json("Task Updated")
})



routes.post("/delete", (req,res)=>{
    console.log(req.body);
    model1.deleteMany({
        name : req.body.name
    }).exec()     // in delete AND UPDTAE we should use exec()
    
    res.json("Task deleted")
})


module.exports = routes
