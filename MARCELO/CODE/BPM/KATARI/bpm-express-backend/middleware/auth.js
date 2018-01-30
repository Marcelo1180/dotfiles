import Debug from 'debug'
import { secret } from '../config'
import jwt from 'jsonwebtoken'

const debug = new Debug('bpm:auth')

const usuarios = [
  {
    _id: '3ada4b6d6ed7d0bccb26099a24013316',
    _rev: '11-dcac62cfa3ca9eb1e9afafefd339f457',
    user: '6102948',
    // password: '3FB7B39416F1D067268747FC214494D759D2609F863ACE1A8A76705618D5C80B',
    password: 'Developer',
    profile: {
      ci: '6102948',
      tipo_documento: 'CI',
      nombres: 'Juan M.',
      primer_apellido: 'Arteaga',
      segundo_apellido: 'Gutierrez',
      fecha_nacimiento: '06/04/1984',
      email: {
        mail1: 'jarteaga@agetic.gob.bo',
        mail2: 'arteagamarcelo@gmail.com'
      },
      phone: {
        phone1: '72597122'
      },
      usuario: 'jarteaga'
    },
    activo: true
  }
]

const findUsuarioByUser = u => usuarios.find(({ user }) => user === u)

export const required = (req, res, next) => {
  jwt.verify(req.query.token, secret, (err, token) => {
    if(err){
      debug('JWT no fue encriptado con la clave secreta')
      return res.status(401).json({
        message: 'No autorizado',
        error: err
      })
    }
    debug(`Token verificado ${token} statisfactoriamente`)
    req.user = token.user
    next()
  })
}
