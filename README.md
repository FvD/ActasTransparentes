# Actas Transparentes

Actas Transparantes es un Proyecto del San Carlos RUG para aprender R haciendo
aplicaciones útiles. El objetivo es construir una aplicacion con Shiny para
hacer accessibles las Actas que el Municipio de San Carlos publica como parte
de su proyecto de transparencia.

Para empezar a trabajar has un "fork" del proyecto (apreta el botón "Fork"
arriba a la derecha). Esto te da tu propia copia de trabajo y puedes empezar a
escribir código. Siempre puedes mirar como van los demás apretando el numero al
lado de "Fork". Verás todas las ramas del proyecto y podrás ver que tan
adelantados están.

Durante las reuniones del grupo de usuarios R vamos a comparar soluciones y
escojemos las solución que nos parece la mejor como grupo.

Si (aun) no te animas para escribir código siempre puedes aportar tus ideas
creando incidentes con un titulo y una descripción. Por ejemplo:

> Titulo: Crear lista de actas donde aparace termino de busqueda

> Descripción: Las actas no están indexadas en la página del municipio. Quiero
> poder dar un termino de busqueda, que resulte en un listado de las actas
> donde este termino aparece.

Eso nos da nuevas ideas para incorporar y seguramente hay alguien en el grupo
que ve tu idea como un reto para aprender algo nuevo.

Para arrancar con Shiny mira el tutorial que existe aqui: http://shiny.rstudio.com/tutorial/

Para encontontrarnos, ver discusiones pasadas, escribir sobre tus experiencias, hacer preguntas
o charlar puedes mirar en [Facebook](https://www.facebook.com/groups/SanCarlosRUG),
[meetup.com](http://www.meetup.com/es-ES/San-Carlos-R-User-Group/) y aqui 
en [Github](http://sancarlos-rug.github.io/).

# Correr el codigo
Al principio del proyecto nos dimos cuenta que las actas en formato PDF son demasiado pesados (grandes) para trabajarlos directamente. En vez hemos creado un proceso de transformación y carga de los documentos a una base de datos NoSQL. Para ver como funciona lee [CouchDB para Actas Transparentes](http://rpubs.com/FvD/CouchDBActasTransparentes). 

El codigo como esta aqui asume que tienes una base de datos que se llama "actasmunisc" en una base de datos CouchDB local (en tu computador). Puedes hacer la conección a una base de datos en la nube, y mas adelante buscaremos un sitio para alojar una base de datos en producción. Busca uno de los otros miembros del grupo de usuarios para ver si puedes replicar la base de datos de otro para arrancar.
