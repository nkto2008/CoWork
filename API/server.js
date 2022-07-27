const express = require('express');
const routeruser = require("./routes/user.js")
const routeradmin = require("./routes/admin.js")
const dotenv = require('dotenv')
const mongoose = require('mongoose');
const morgan = require('morgan')
const bodyparser = require('body-parser')


dotenv.config()
const app = express()
const port = process.env.PORT
const username = process.env.USERDB
const password = process.env.DBPWD
const dbname = process.env.DBNAME




// Middleware
app.use(bodyparser.json())
app.use(morgan('tiny'))

//BDD connection and server start
mongoose.connect(
  `mongodb+srv://${username}:${password}@votaction.scor1.mongodb.net/${dbname}?retryWrites=true&w=majority`,
  {
    useNewUrlParser: true,
    useFindAndModify: false,
    useUnifiedTopology: true
  }
);

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error: "));
db.once("open", function () {
  console.log("Connected");
});

app.use(routeruser);
app.use(routeradmin)

app.listen(process.env.PORT || 8080, () => {
  console.log(`server listen at ${port}`)
})