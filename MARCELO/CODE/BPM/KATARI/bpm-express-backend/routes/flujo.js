import express from 'express'
import Debug from 'debug'
const debug = new Debug('bpm:routes:flujo')

const app = express.Router()

// const currentUser = {
//   _id: '3ada4b6d6ed7d0bccb26099a24013316',
//   _rev: '11-dcac62cfa3ca9eb1e9afafefd339f457',
//   usuario: '6102948',
//   contrasena: '3FB7B39416F1D067268747FC214494D759D2609F863ACE1A8A76705618D5C80B',
//   profile: {
//     ci: '6102948',
//     tipo_documento: 'CI',
//     nombres: 'Juan M.',
//     primer_apellido: 'Arteaga',
//     segundo_apellido: 'Gutierrez',
//     fecha_nacimiento: '06/04/1984',
//     email: {
//       mail1: 'jarteaga@agetic.gob.bo',
//       mail2: 'arteagamarcelo@gmail.com'
//     },
//     phone: {
//       phone1: '72597122'
//     },
//     usuario: 'jarteaga'
//   },
//   activo: true
// }

// // Lo que debe leer este middleware es el flujo base del tramite seleccionado
// function flujoMiddleware (req, res, next) {
//   const { id } = req.params
//   req.flujo = flujos.find(({ _id }) => _id === +id) // id convertirlo a numero +id
//   next()
// }

// function userMiddleware (req, res, next) {
//   req.user = currentUser
//   next()
// }

// function momentoMiddleware (req, res, next) {
//   const f = req.flujo
//   req.momentos = f.momentos.find(({ momento }) => momento === f.actual) // buscar los siguientes pasos para el paso actual
//   next()
// }

// const template_flujo = {
//   _id: 1,
//   _idx: 'c6616011ee5602c2774bd91c7b01cd45',
//   _rev: '25-f2f0ca8b31619b0e64dd82ecdac9f105',
//   doc_type: 'template_flujos',
//   createAt: new Date(),
//   titulo: 'Registro de Estudiantes',
//   slug: 'registro_estudiantes',
//   activo: false,
//   deleted: false,
//   version: '1.0.0',
//   actual: 'm0',
//   permisos: [
//     {
//       momento: 'm0',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     },
//     {
//       momento: 'm1',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     },
//     {
//       momento: 'm2',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     }
//   ],
//   temporizador: [
//     {
//       momento: 'm0',
//       tiempo: '2d 5h 4m 3s'
//     }
//   ],
//   acciones: [
//     {
//       momento: 'm1',
//       accion: [
//         {
//           notificar: {
//             version: '1.0.0',
//             mensaje: 'Observado desde el Técnico',
//             destinatario: 'jarteaga@agetic.gob.bo'
//           }
//         }
//       ]
//     },
//     {
//       momento: 'm1',
//       accion: [
//         {
//           firmar: {
//             version: '1.0.0'
//           }
//         }
//       ]
//     }
//   ],
//   momentos: [
//     {
//       momento: 'm0',
//       sig: [
//         {
//           momento: 'm1',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ],
//       obs: []
//     },
//     {
//       momento: 'm1',
//       sig: [
//         {
//           momento: 'm2',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ],
//       obs: [
//         {
//           momento: 'm0',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ]
//     },
//     {
//       momento: 'm2',
//       sig: [
//         {
//           momento: 'EOF',
//           documento_titulo: 'Finalizar el Flujo'
//         }
//       ],
//       obs: [
//         {
//           momento: 'm0',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ]
//     }
//   ],
//   documentos: [
//     {
//       momento: 'm0',
//       documento: 'd1'
//     },
//     {
//       momento: 'm1',
//       documento: 'd1'
//     },
//     {
//       momento: 'm2',
//       documento: 'd1'
//     }
//   ],
//   expediente: []
// }

// const template_documento = {}

// const flujo = {
//   _id: 1,
//   _idx: 'c6616011ee5602c2774bd91c7b01cd45',
//   _rev: '25-f2f0ca8b31619b0e64dd82ecdac9f105',
//   doc_type: 'flujos',
//   createAt: new Date(),
//   template_id: '3ada4b6d6ed7d0bccb26099a2405b244',
//   template_rev: '3-f208c0f43108d046d99a49f0e02d00fd',
//   titulo: 'Registro de Estudiantes',
//   slug: 'registro_estudiantes',
//   activo: false,
//   deleted: false,
//   version: '1.0.0',
//   actual: 'm0',
//   permisos: [
//     {
//       momento: 'm0',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     },
//     {
//       momento: 'm1',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     },
//     {
//       momento: 'm2',
//       usuario: '3ada4b6d6ed7d0bccb26099a24013316',
//       permiso: '111'
//     }
//   ],
//   temporizador: [
//     {
//       momento: 'm0',
//       tiempo: '2d 5h 4m 3s'
//     }
//   ],
//   acciones: [
//     {
//       momento: 'm1',
//       accion: [
//         {
//           notificar: {
//             version: '1.0.0',
//             mensaje: 'Observado desde el Técnico',
//             destinatario: 'jarteaga@agetic.gob.bo'
//           }
//         }
//       ]
//     },
//     {
//       momento: 'm1',
//       accion: [
//         {
//           firmar: {
//             version: '1.0.0'
//           }
//         }
//       ]
//     }
//   ],
//   momentos: [
//     {
//       momento: 'm0',
//       sig: [
//         {
//           momento: 'm1',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ],
//       obs: []
//     },
//     {
//       momento: 'm1',
//       sig: [
//         {
//           momento: 'm2',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ],
//       obs: [
//         {
//           momento: 'm0',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ]
//     },
//     {
//       momento: 'm2',
//       sig: [
//         {
//           momento: 'EOF',
//           documento_titulo: 'Finalizar el Flujo'
//         }
//       ],
//       obs: [
//         {
//           momento: 'm0',
//           documento_titulo: 'Registro de Estudiantes'
//         }
//       ]
//     }
//   ],
//   documentos: [
//     {
//       momento: 'm0',
//       documento: 'd1'
//     },
//     {
//       momento: 'm1',
//       documento: 'd1'
//     },
//     {
//       momento: 'm2',
//       documento: 'd1'
//     }
//   ],
//   expediente: []
// }

// const flujos = new Array(10).fill(flujo)

// Ruta para el ususario para mostrar todos los flujos de este usuario
// GET /api/v1/flujos
app.get('/', (req, res) => res.status(200).json(flujos))

// Ruta para el usuario para mostrar un flujo por id
// GET /api/v1/flujos/:id
app.get('/:id', flujoMiddleware, (req, res) => {
  res.status(200).json(req.flujo)
})

// Ruta para el usuario para crear un nuevo flujo clonar en base al template flujo
// parametros @tipo flujo
// POST /api/v1/flujos
app.post('/', userMiddleware, (req, res) => {
  const flujo = req.body
  flujo._id = +new Date()
  flujo.user = req.user
  flujo.createAt = new Date()
  flujo.documento = []
  flujos.push(flujo)
  res.status(201).json(flujo)
})

// Ruta para el usuario creador
// Ver los momentos disponibles para ir al siguiente paso
app.post('/:id/momentos', flujoMiddleware, userMiddleware, momentoMiddleware, (req, res) => {
  res.status(201).json(req.momentos)
})

// Ruta para el usuario creador
// Ver los momentos disponibles para ir al siguiente paso
app.post('/:id/momentos/:xmomento', flujoMiddleware, userMiddleware, momentoMiddleware, (req, res) => {
  const { xmomento } = req.params
  const f = req.flujo
  const m = req.momentos // buscar los siguientes pasos para el paso actual
  const siguiente = m.sig.find(({ momento }) => momento === xmomento) // buscar si el siguiente paso esta disponible
  const observado = m.obs.find(({ momento }) => momento === xmomento) // buscar si el siguiente paso esta disponible
  if (siguiente || observado) {
    const caso = {}
    f.actual = xmomento
    caso.createAt = new Date()
    caso.user = req.user
    caso.momento = xmomento
    f.expediente.push(caso) // grabar el momento que se selecciono en el expediente
    debug(`Paso seleccionado ${xmomento}`)
    res.status(201).json(siguiente)
  } else {
    debug(`No puede seleccionar esta opcion ${xmomento}`)
    res.status(400).json({message: `No puede seleccionar esta opcion ${xmomento}`})
  }
})

export default app
