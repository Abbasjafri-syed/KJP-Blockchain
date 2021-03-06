// Route Making in Express

const express = require('express')
const app = express()
const path = require('path')
const port = 1992
const content = "Test Code Working"

app.get('/home', (req, res) => {
  console.log(__dirname);
  res.sendFile(path.join(__dirname, 'drop.html' ))
});

app.get('/portfolio', (req, res) => {
  res.send('Name-Syed Asghar Abbas, Contact = gmail.com, Marital status- unmarried')
});

app.get('/skills', (req, res) => {
  res.send('Time Management, Team Working, In-depth Analyis, Problem solving')
})

app.get('/background', (req, res) => {
  res.send('Currently working as a freelance Content Writer')
})
  app.get('/assignment', (req, res) => {
    res.json({'Batch': 'KJP-3', 'Course':'Blockchain'})
      })
      app.get('/resume', (req, res) => {
        console.log(__dirname);
        res.sendFile(path.join(__dirname, 'index.html' ))
      });

app.listen(port, () => {
  console.log(`Example app listening on port ${port} checking ${content}`)
})


// app.get('/home/about', (req, res) => {
//   res.send('Background')
// })

// app.get('/Portfolio', (req, res) => {
//   res.send('My Portfolio')
//   console.log(req)
//   console.log(res)
// })


