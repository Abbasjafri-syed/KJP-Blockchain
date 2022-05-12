C:\Program Files\MongoDB\Server\3.2\bin

mongod --storageEngine=mmapv1 --dbpath data --journal //start mongodb
cmd mongo //start shell

" "
{"result" : "pass"}
({"result" : "pass"})
[ "Action", "Sci-Fi" ]
"result" : "pass"
([{

title: "Jurassic World: Fallen Kingdom",

}])

[]

Show dbs

show collections

use database_name => creating db

db.createCollection("nameOfCollection") or 

db.nameOfCollection.insertOne({"result" : "pass"}) => create collection


db.nameOfCollection.insertOne({"result" : "pass"}) => to insert data in collection


db.nameOfCollection.find({}) => find all data


db.nameOfCollection.find({key: value}) => find  data on behalf of key

db.movies.insertMany([{
title: "Jurassic World: Fallen Kingdom",
genres: [ "Action", "Sci-Fi" ],
runtime: 130,
rated: "PG-13",
year: 2018,
directors: [ "J. A. Bayona" ],
cast: [ "Chris Pratt", "Bryce Dallas Howard", "Rafe Spall" ],
type: "movie"
}])
