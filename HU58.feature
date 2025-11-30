Feature: Detalle del síntoma mediante interacción con marcadores AR
  Como usuario,
  Quiero tocar un marcador AR y visualizar una etiqueta con nombre del síntoma, causa y nivel de severidad,
  Para comprender mejor qué le sucede a mi planta y qué tan grave es el problema.

  Scenario Outline: Mostrar información al tocar un marcador
    Given que el usuario está en el modo AR,
    And los marcadores de síntomas están visibles,
    When el usuario toca uno de los <marcadores>,
    Then debe aparecer una etiqueta flotante con <nombre_sintoma>

    Examples: Variables de entrada
      | marcadores   |
      | "marcadores" |

    Examples: Variables de salida
      | nombre_sintoma       |
      | "nombre del síntoma" |

  Scenario Outline: Cerrar la información del síntoma
    Given que la etiqueta de información está abierta,
    When el usuario toca <ubicacion_toque>,
    Then la etiqueta debe cerrarse,
    And los marcadores deben seguir visibles

    Examples: Variables de entrada
      | ubicacion_toque        |
      | "fuera de la etiqueta" |