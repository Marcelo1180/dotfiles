import Debug from 'debug'
import app from './app'

const PORT = 3000
const debug = new Debug('bpm:index')

app.listen(PORT, () => {
  debug(`Servidor ejecutando en el puerto ${PORT}`)
})
