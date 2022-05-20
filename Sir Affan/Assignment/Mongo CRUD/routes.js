exp = require("express")
routes = exp.Router()

//importing 
var model1 = require("./model")

routes.get("/home",(req,res)=>{
    res.send("THIS IS HOME PAGE")
})


  
routes.post("/create", (req,res)=>{
    console.log(req.body);
    model1.insertMany([{
        "taskname" : req.body.taskname,
        "timerequired" : req.body.timerequired,
        "status"  : req.body.status
    }])
    
    res.json(req.body)
})



routes.post("/remove", (req,res)=>{
    console.log(req.body);
    model1.remove({
        "taskname" : req.body.taskname
    }).exec()     // in delete AND UPDTAE we should use exec()
    
    res.json(req.body)
})



routes.post("/update", (req,res)=>{
    console.log(req.body);
    model1.findOneAndUpdate({
        "taskname" : req.body.taskname }, {$set: {"status":req.query.status }}
       
       ).exec()    
    
    res.json(req.body)
})



routes.post("/delete", (req,res)=>{
    console.log(req.body);
    model1.deleteOne({
        "taskname" : req.body.taskname
    }).exec()     // in delete AND UPDTAE we should use exec()
    
    res.json(req.body)
})




routes.post("/find", (req, res) => {
    abc = model.find({
        taskname: req.body.taskname})
    abc.then(data=>{
        res.send(data)
    })

})


module.exports = routes
