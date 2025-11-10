Feature: Interacción con publicaciones de la comunidad
  Como usuario,
  Quiero poder explorar un feed de publicaciones de otros agricultores, ver sus preguntas, consejos y problemas, y también poder interactuar con ellas,
  Para aprender de sus experiencias, obtener ayuda y sentirme parte de una comunidad de soporte.

  Scenario Outline: Visualizar el feed de la comunidad
    Given que el usuario se encuentra en la pantalla principal de la aplicación
    When el usuario presiona la opción para ver la "Comunidad" o el feed
    Then el sistema carga una pantalla con un feed de publicaciones de otros usuarios
    And el usuario visualiza una lista de publicaciones, donde cada una muestra el <nombre_autor> y su <arroba_usuario>, el <contenido_publicacion>,
    And las métricas de interacción (<comentarios>, <republicados>, <me_gusta>, <vistas>).

    Examples: Variables de salida
      | nombre_autor | arroba_usuario | contenido_publicacion                                                                                                                                                                       | comentarios | republicados | me_gusta | vistas    |
      | "Fabricito"  | "@FabriiUPC"   | "Hola! Mi Aeonium arboreum está con las hojas arrugadas, pero siguen firmes. El sustrato se siente seco a 4 cm y está en maceta de terracota, último riego hace 12 dias. ¿Le doy agua hoy?" | "165"       | "1,072"      | "3,045"  | "198.9K"  |
      | "Aldito"     | "@Aldomanias"  | "Todas las personas de este mundo deberian usar LeafIQ por lo maravilloso que es"                                                                                                           | "143"       | "4,331"      | "16.3K"  | "5.1M"    |
      | "Brighite"   | "@gonzalogev"  | "Encontré bolitas blancas tipo algodón en las axilas de mi aeonio y las hojas quedaron pegajosas, ¿Confirmado cochinilla? ¿Qué hago?"                                                       | "833"       | "2,042"      | "15.7K"  | "211.7K"  |

  Scenario Outline: Ver el detalle de una publicación y sus respuestas
    Given que el usuario se encuentra en el feed de la comunidad
    When el usuario presiona sobre una publicación específica
    Then el sistema carga la pantalla de detalle de la publicación
    And el usuario visualiza la publicación original en la parte superior, una lista de respuestas de otros usuarios (<nombre_autor_respuesta>, <arroba_usuario_respuesta>, <contenido_respuesta>) debajo de la publicación
    And iconos para interactuar, como <icono_responder>, <icono_me_gusta> y <icono_compartir>.

    Examples: Variables de salida
      | nombre_autor_respuesta | arroba_usuario_respuesta | contenido_respuesta                                                                                             | icono_responder    | icono_me_gusta   | icono_compartir      |
      | "Gonzalito"            | "@Gonzalazo"             | "Sí, suena a cochinilla algodonosa. Limpia con hisopo + alcohol 70% y luego neem 2%. Repite a los 7 y 14 dias." | (Icono responder)  | (Icono me gusta) | (Icono compartir)    |
      | "Ronaldo"              | "@Ronaldito"             | "Aisla esa maceta y mejora ventilación. Si hay hormigas, pon cebo; suelen 'cuidarlas'."                         | (Icono responder)  | (Icono me gusta) | (Icono compartir)    |
      | "JoseEdu"              | "@Joseee"                | "Contenido promocional\nVengan a comprar unas suculentas al puesto de la cuadra arequipa 123 arcadiadevs.com"   | (Icono responder)  | (Icono me gusta) | (Icono compartir)    |