Feature: Chat con IA experto
  Como usuario,
  Quiero hacer preguntas en un chat a una IA experta,
  Para resolver mis dudas específicas sobre el cuidado de mis plantas de manera rápida y obtener recomendaciones personalizadas.

  Scenario Outline: Iniciar una conversación con la IA
    Given el usuario ha accedido a la función de Chat con IA
    When la pantalla de "IA Experto" carga
    Then el sistema muestra el mensaje <mensaje_bienvenida>
    And se presenta un campo de texto para <placeholder_pregunta> y un botón para <boton_pro>.

    Examples: Variables de salida
      | mensaje_bienvenida        | placeholder_pregunta | boton_pro             |
      | "¿En qué puedo ayudarte?" | "Preguntar a LeafIQ" | "Obtener LeafIQ Pro"  |

  Scenario Outline: Realizar una consulta y recibir una respuesta
    Given el usuario está en la pantalla del chat con IA
    When escribe una pregunta, como <pregunta_usuario>, y la envía
    Then su pregunta aparece en la conversación
    And la IA de LeafIQ responde con <respuesta_ia>.

    Examples: Variables de entrada
      | pregunta_usuario                                                       |
      | "¿Cómo puedo empezar un huerto en casa si no tengo mucha experiencia?" |

    Examples: Variables de salida
      | respuesta_ia                                                                                                                                                                                                                                                                                                                                       |
      | "¡Es una excelente idea! Para comenzar, elige un espacio con buena luz solar, preferiblemente que reciba al menos 6 horas de sol al día. Puedes preparar la tierra asegurándote de eliminar piedras y malezas, y luego enriquecerla con abono orgánico o compost. Si lo prefieres, puedes usar macetas o cajas recicladas si tienes poco espacio." |

  Scenario Outline: Acceder al historial de chats
    Given el usuario se encuentra en la pantalla del chat con IA
    When presiona el ícono de menú
    Then se despliega una vista con un <historial_chat> de conversaciones anteriores
    And se muestra la opción de <opcion_nuevo_chat> para iniciar una nueva conversación.

    Examples: Variables de salida
      | opcion_nuevo_chat | historial_chat                      |
      | "Nuevo Chat"      | "Comenzar huerto sin experiencia"   |
      | "Nuevo Chat"      | "Como regar un cactus"              |
      | "Nuevo Chat"      | "Que tan bueno es la marca"         |
      | "Nuevo Chat"      | "Lo nuevo de LeafIQ Pro"            |

  Scenario Outline: Seleccionar la versión de la IA (Usuario Pro)
    Given un usuario con una suscripción a "LeafIQ Pro" está en la pantalla del chat con IA
    When presiona el selector de modelo (ej. <selector_modelo>)
    Then se despliega un menú que muestra las versiones de IA disponibles
    And puede seleccionar entre los diferentes modelos, como <modelo_1> o <modelo_2>.

    Examples: Variables de entrada
      | selector_modelo |
      | "LeafIQ - 4.5"  |

    Examples: Variables de salida
      | modelo_1 | modelo_2 |
      | "IQ-4"   | "IQ-4.5" |