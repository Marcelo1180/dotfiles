#!/bin/bash

echo "¡¡¡Antes asegurese estar en modo postgres@usuario!!!  Ej: sudo su [Enter] pass: *** luego su postgres[Enter]"

echo 'Introduze nombre base de datos:'

read datos
psql $datos < solicitud.sql
echo 'Solicitud guardados satisfactoriamente'

psql $datos < persona.sql
echo 'Persona guardados satisfactoriamente'

psql $datos < representante.sql
echo 'Representante guardados satisfactoriamente'

psql $datos < actividad.sql
echo 'Actividad guardados satisfactoriamente'

psql $datos < balance.sql
echo 'Balance guardados satisfactoriamente'

echo 'Datos migrados ok...'
