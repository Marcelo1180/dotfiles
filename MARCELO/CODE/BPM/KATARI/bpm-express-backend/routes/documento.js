import express from 'express'
const app = express.Router()

const documento = {
  '_id': 'c6616011ee5602c2774bd91c7b02a32c',
  '_rev': '14-a90ba15d2bf6b09cb2d6cd27d1621bed',
  'doc_type': 'documentos',
  'template_id': '3ada4b6d6ed7d0bccb26099a2405504b',
  'template_rev': '6-971737aa2ec077c3cf493eeb8aa755ea',
  'slug': 'profile_estudiante',
  'titulo': 'Formulario de registro de estudiantes',
  'version': '1.0.0',
  'activo': true,
  'deleted': false,
  'firmas': [
    {
      'hashsign': 'f-c6616011ee5602c2774bd91c7b02931d',
      'checksum': 'c-c6616011ee5602c2774bd91c7b02931d'
    }
  ],
  'cuerpo': [
    {
      'render': 'formly',
      'name': 'input-58',
      'validacion': {
        'input-58': {
          'email': true
        }
      },
      'contenido': {
        'key': 'input',
        'type': 'input-58',
        'name': '58',
        'templateOptions': {
          'type': 'email',
          'label': 'Email address',
          'placeholder': 'Enter email'
        }
      }
    },
    {
      'render': 'formly',
      'name': 'estado_civil',
      'validacion': {
        'checked-32': {
          'isBoolean': true
        }
      },
      'contenido': {
        'key': 'checked',
        'type': 'checkbox',
        'name': '32',
        'templateOptions': {
          'label': 'Check me out'
        }
      }
    },
    {
      'render': 'vue-components',
      'name': 'segip_representante_legal',
      'contenido': "<segip v-bind='texto1'></segip>"
    },
    {
      'render': 'vue-components',
      'name': 'homonimia-36',
      'validacion': {
        'ci': {
          'number': true
        },
        'fecha': {
          'dateOnly': true,
          'message': '^Tu tienes que ser mayor de 18 años'
        },
        'buscador': {
          'alfa': true,
          'uppercase': true
        }
      },
      'cuerpo': "<homonimia v-bind='texto1'></hominimia>"
    }
  ],
  'valores': [
    {
      'name': 'input-58',
      'version': '1.0.0',
      'valor': 'demo@agetic.gob.bo'
    },
    {
      'name': 'estado_civil',
      'version': '1.0.0',
      'valor': true
    },
    {
      'name': 'segip_representante_legal',
      'version': '1.0.0',
      'valores': {
        'ci': '6452897',
        'fecha': '15/05/2018'
      }
    },
    {
      'name': 'homonimia-36',
      'version': '1.0.0',
      'valores': {
        'ci': '6452897',
        'fecha': '15/05/2018',
        'buscador': 'VENTA LA TUTI'
      }
    }
  ]
}

const documentos = new Array(10).fill(documento)

// /api/v1/documentos
app.get('/', (req, res) => res.status(200).json(documentos))

// /api/v1/documentos/:id
app.get('/:id', (req, res) => res.status(200).json(documentos))

export default app
