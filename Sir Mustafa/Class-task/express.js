//calling data in route and by passing parameter values

const express = require("express")
const app = express()
const PORT = 3000

var data = [
      {
        name: "ahmed", 
        age: 25,
        image: "https://reqres.in/img/faces/1-image.jpg"
    },
    {
        name: "Sana", 
        age: 18,
        image: "https://reqres.in/img/faces/2-image.jpg"
    },
    {
        name: "Hasan", 
        age: 79,
        image: "https://reqres.in/img/faces/4-image.jpg"
    }
]


app.get("/home", (req, res) => {
    
    res.send(data)
})

app.get("/profile/:name", (req, res) => {
    // route ki logic

    Jsond = data.find(value => {
        return value.name == req.params.name
        
    })
    res.send(Jsond) 
})

app.listen(PORT, () => {
    console.log("server is running");
})
