import express from 'express'
import Debug from 'debug'
import jwt from 'jsonwebtoken'

const app = express.Router()
const debug = new Debug('bpm:auth')

// const secret = 'miclavesecreta'

// const usuarios = [
//   {
//     _id: '3ada4b6d6ed7d0bccb26099a24013316',
//     _rev: '11-dcac62cfa3ca9eb1e9afafefd339f457',
//     user: '6102948',
//     // password: '3FB7B39416F1D067268747FC214494D759D2609F863ACE1A8A76705618D5C80B',
//     password: 'Developer',
//     profile: {
//       ci: '6102948',
//       tipo_documento: 'CI',
//       nombres: 'Juan M.',
//       primer_apellido: 'Arteaga',
//       segundo_apellido: 'Gutierrez',
//       fecha_nacimiento: '06/04/1984',
//       email: {
//         mail1: 'jarteaga@agetic.gob.bo',
//         mail2: 'arteagamarcelo@gmail.com'
//       },
//       phone: {
//         phone1: '72597122'
//       },
//       usuario: 'jarteaga'
//     },
//     activo: true
//   }
// ]

// const findUsuarioByUser = u => usuarios.find(({ user }) => user === u)

function comparePasswords (providerPassword, usuarioPassword) {
  return providerPassword === usuarioPassword
}

app.post('/signin', (req, res, next) => {
  const { user, password } = req.body
  const usuario = findUsuarioByUser(user)

  if (!usuario) {
    debug(`El nombre de usuario ${user} no fue encontrado`)
    return handleLoginFailed(res)
  }

  if (!comparePasswords(password, usuario.password)) {
    debug(`Las contrasenas no coinciden ${password} !== ${usuario.password}`)
    return handleLoginFailed(res)
  }

  const token = createToken(usuario)

  res.status(200).json({
    message: 'Autentificacion satisfactoria',
    token,
    usuarioId: usuario._id,
    primerApellido: usuario.profile.primer_apellido,
    segundoApellido: usuario.profile.segundo_apellido,
    nombres: usuario.profile.nombres,
    email: usuario.profile.email.mail1
  })
})

app.post('/signup', (req, res) => {
  const { primerApellido, segundoApellido, nombres, email, user, password } = req.body
  const usuario = {
    _id: +new Date(),
    _rev: '11-dcac62cfa3ca9eb1e9afafefd339f457',
    user: user,
    // password: '3FB7B39416F1D067268747FC214494D759D2609F863ACE1A8A76705618D5C80B',
    password: password,
    profile: {
      ci: '6102948',
      tipo_documento: 'CI',
      nombres: nombres,
      primer_apellido: primerApellido,
      segundo_apellido: segundoApellido,
      fecha_nacimiento: '06/04/1984',
      email: {
        mail1: email,
        mail2: 'arteagamarcelo@gmail.com'
      },
      phone: {
        phone1: '72597122'
      },
      usuario: 'jarteaga'
    },
    activo: true
  }
  debug(`Creando nuevo usuario: ${usuario}`)
  usuarios.push(usuario)
  const token = createToken(usuario)
  res.status(201).json({
    message: 'Usuario creado',
    token,
    usuarioId: usuario._id,
    primerApellido,
    segundoApellido,
    nombres,
    email
  })
})

const createToken = (usuario) => jwt.sign({ usuario }, secret, { expiresIn: 86400 })

const handleLoginFailed = (res, message) =>
  res.status(401).json({
    message: 'Login failed',
    error: message || 'No existen coincidencias para el Email o Password'
  })

export default app
