Feature: Guía de compostaje
  Como usuario interesado en la sostenibilidad,
  Quiero acceder a una guía detallada y paso a paso sobre cómo hacer compostaje casero,
  Para aprender el proceso, los materiales necesarios y las proporciones correctas para convertir mis residuos orgánicos en abono para mis plantas.

  Scenario Outline: Escenario 1: Visualizar la guía detallada de compostaje
    Given que el usuario se encuentra en la pantalla "Sostenibilidad"
    When el usuario presiona la opción <opcion_guia>
    Then el sistema carga la pantalla "Guía de compostaje"
    And el usuario visualiza una guía estructurada que incluye un <video_instructivo>, una lista de <lista_necesitas>, las <lista_proporciones> recomendadas,
    And las instrucciones <instrucciones_pasos>.

    Examples: Variables de entrada
      | opcion_guia          |
      | "Guía de compostaje" |

    Examples: Variables de salida
      | video_instructivo                    | lista_necesitas   | lista_proporciones | instrucciones_pasos |
      | (Imagen "GUÍA DE COMPOSTAJE CASERO") | "¿Qué necesitas?" | "Proporciones"     | "Paso a paso"       |