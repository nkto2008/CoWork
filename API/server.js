const express = require('express');
const routeruser = require("./routes/user.js")
const routeradmin = require("./routes/admin.js")
const dotenv = require('dotenv')
const mongoose = require('mongoose');
const morgan = require('morgan')
const bodyparser = require('body-parser')
const swaggerJsDoc = require('swagger-jsdoc')
const swaggerUiExpress = require('swagger-ui-express')

dotenv.config()
const app = express()
const port = process.env.PORT
const username = process.env.USERDB
const password = process.env.DBPWD
const dbname = process.env.DBNAME


// Options are use by swagger-js-doc
const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'CoWork API Documentation',
      version: '1.0.0',
      description: 'API Documentation for CoWork Project',
      contact: {
        name: 'CoWork API',
        url: '',
        https: '//swagger.io',
        email: '',
      },
    },
    
    servers: [
      {
        url: 'http://localhost:8081/',
      }
    ],
  },
  apis: [
    './routes/*.js',
  ],
};

const specs = swaggerJsDoc(options)

// Middleware
app.use(bodyparser.json())
app.use(morgan('tiny'))

//BDD connection and server start
mongoose.connect(
  `mongodb+srv://${username}:${password}@cowork.scor1.mongodb.net/${dbname}?retryWrites=true&w=majority`,
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
app.use("/api-docs", swaggerUiExpress.serve, swaggerUiExpress.setup(specs))

app.listen(process.env.PORT || 8080, () => {
  console.log(`server listen at ${port}`)
})