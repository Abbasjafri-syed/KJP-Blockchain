// express
exp = require("express")
a = exp()
port = 3500

log = require("morgan")
const bodyParser = require("body-parser")



//MIDDLE WARES
a.use(bodyParser.json())
a.use (log("dev"))

// mongoose connection
mong = require("mongoose")


mong.connect("mongodb://localhost:27017/db")
const db = mong.connection
db.on("error" , err => console.error(err))
db.once("open" , ()=>{
    console.log("CONNECTED TO MONGODB/data")
}) 






// importing
abc = require("./routes")
a.use("/", abc)


a.get("/home",(req,res)=>{
    console.log('ready');
    res.send("NODE & MONGO made it,......")
})







a.listen(port,()=>{
    console.log("server is runing at " + port)
})
