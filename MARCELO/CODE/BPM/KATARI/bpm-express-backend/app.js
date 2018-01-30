import express from 'express'
import bodyParser from 'body-parser'
import { flujo, auth } from './routes'
// import { flujo, documento } from './routes'

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extend: true }))

if (process.env.NODE_ENV === 'development') {
  app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*') // De cualquier dominio pueden acceder a esta app. para produccion se debe colocar el dominio de acceso
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Request-With, Content-Type, Accept')
    res.setHeader('Access-Control-Allow-Methods', 'POST, GET, PATCH, DELETE, OPTIONS')
    next()
  })
}

app.get('/', (req, res) => res.send('Hola desde express!!!!'))

app.use('/api/v1/flujos', flujo)
app.use('/api/auth', auth)
// app.use('/api/v1/documentos', documento)

export default app
