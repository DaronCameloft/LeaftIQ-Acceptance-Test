Feature: Guías paso a paso de actividades
  Como usuario,
  Quiero acceder a guías paso a paso personalizadas adaptadas a mi actividad y planta,
  Para cometer la menor cantidad de errores al cuidar de mi planta.

  Scenario Outline: Carga de la pantalla de introducción a la guía de regado
    Given que el usuario se encuentra en la pantalla "Detalle de Planta Registrada"
    When el usuario presiona la actividad de recordatorio de regado
    Then el sistema carga la pantalla de introducción de la "Guía de regado personalizado" y el usuario visualiza el <titulo_guia> personalizado para su planta, una <descripcion_guia> del objetivo de la guía
    And un botón de <boton_comenzar>.

    Examples: Variables de salida
      | titulo_guia                             | descripcion_guia                                  | boton_comenzar |
      | "Guía de regado para Aeonium arboreum"  | "Aprenderas a regar de manera segura y eficiente" | "Comenzar"     |

  Scenario Outline: Visualización del contenido de la guía de regado
    Given que el usuario se encuentra en la pantalla de introducción de la "Guía de regado personalizado"
    When el usuario presiona el botón <boton_comenzar>
    Then el sistema carga el contenido de la guía y el usuario visualiza las secciones informativas de <seccion_1>, <seccion_2>, <seccion_3>, <seccion_4>, <seccion_5>, <seccion_6>
    And un botón para <boton_terminar>.

    Examples: Variables de entrada
      | boton_comenzar |
      | "Comenzar"     |

    Examples: Variables de salida
      | seccion_1       | seccion_2                     | seccion_3                  | seccion_4         | seccion_5               | seccion_6           | boton_terminar      |
      | "Cuándo regar"  | "Cómo regar (método seguro)"  | "Frecuencias orientativas" | "Errores comunes" | "Señales y corrección"  | "Video instructivo" | "Terminar tutorial" |