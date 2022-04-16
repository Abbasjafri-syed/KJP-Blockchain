const express =  require("express");
const app = express()
const path = require("path");
const bodyParser = require("body-parser")
const PORT = 3000



// File System
const fs = require("fs")

// DB Path
const db = "./Public-db/data.json"

// middlewares
app.use(bodyParser.json())


app.get("/filter/:pass", (req, res) => {
    let data = JSON.parse(fs.readFileSync(db, "utf-8"))    
    pass = req.params.pass
        
    fildata = data.filter(passwd => {
       if (passwd.pass == pass)
            return passwd.name
        })
        console.log(fildata);
    
    res.json(typeof fildata !== 'undefined' ? fildata : "User not found")
    
})

app.post('/del/:name', (req, res) => {
    let data = JSON.parse(fs.readFileSync(db, "utf-8"))    
    const name = req.params.name;

      if (data >= 1) {
          let rcrd = data.delete(data.name)
          res.send(rcrd)

      }

  })

  let username= { 
    "name":'Hasan',
    "pass": 234 }
  
  app.post('/update/:users', (req, res) => {
    let data = JSON.parse(fs.readFileSync(db, "utf-8"))    
    const name = req.query.name;
    
    
      if (req.query !== username) {
        console.log('User not Exist'); }
        else{
          data.push(username)
          res.json('user Added')
          
        //   (Object.hasOwnProperty.call(name, "Hasan"))
        //   res.json(typeof fildata !== 'undefined' ? fildata : "User not found")
          
      }

  })


app.listen(PORT, () => {
    console.log("Server is running at port: " + PORT);
})