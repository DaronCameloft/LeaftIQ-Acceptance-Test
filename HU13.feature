Feature: Información de planta registrada
  Como agricultor,
  Quiero obtener toda la información necesaria de mi planta en un apartado, como su distribución, dato curso y condiciones,
  Para comprender mejor a mi planta y el cuidado que debo garantizar.

  Scenario Outline: Consultar información general de la especie de la planta
    Given un usuario se encuentra en la pantalla “Detalle de Planta Registrada”
    When el usuario selecciona la pestaña <pestana_seleccionada>
    Then la pantalla muestra una serie de secciones expandibles como <seccion_1>, <seccion_2>, <seccion_3>, <seccion_4>, <seccion_5>, <seccion_6>, <seccion_7>, <seccion_8>, y <seccion_opinion>
    And un botón para crear una conversación con el <chat_ia> de la aplicación.

    Examples: Variables de entrada
      | pestana_seleccionada |
      | Informacion           |

    Examples: Variables de salida
      | seccion_1         | seccion_2     | seccion_3     | seccion_4     | seccion_5       | seccion_6                   | seccion_7 | seccion_8     | seccion_opinion                   | chat_ia                |
      | Galería de fotos  | Descripción   | Distribución  | Condiciones   | Plagas comunes  | Características especiales  | Usos      | Dato curioso  | ¿La informacion te parecio útil?  | Habla con un experto   |