Feature: Bienvenida introductoria
  Como usuario que ingresa por primera vez a la aplicación,
  Quiero visualizar las características principales de la aplicación,
  Para entenderla y determinar si será útil para mí.

  Scenario Outline: Visualización de la pantalla de carga inicial
    Given que es la primera vez que el usuario abre la aplicación
    When la aplicación se inicia
    Then el sistema muestra una pantalla de carga temporal
    And el usuario visualiza el logo de <logo> y un <indicador_carga>.

    Examples: Variables de salida
      | logo     | indicador_carga      |
      | "LeafIQ" | (Indicador de carga) |

  Scenario Outline: Visualización de la primera característica en la bienvenida
    Given que la pantalla de carga ha finalizado
    When el sistema presenta la bienvenida introductoria
    Then el usuario visualiza la primera pantalla del recorrido, que destaca la característica <caracteristica>
    And la pantalla contiene el <indicador_paso> mostrando el primer paso
    And los botones <boton_saltar> y <boton_siguiente>.

    Examples: Variables de salida
      | caracteristica                              | indicador_paso                | boton_saltar | boton_siguiente |
      | "Identifica el mundo verde alrededor de ti" | (Indicador de página 1 de 3)  | "Saltar"     | "Continuar"     |

  Scenario Outline: Visualización de la segunda característica en la bienvenida
    Given que el usuario se encuentra en la primera pantalla de la bienvenida
    When el usuario presiona el botón <boton_siguiente_in>
    Then el sistema avanza a la segunda pantalla del recorrido, que destaca la característica <caracteristica>
    And la pantalla contiene el <indicador_paso> mostrando el segundo paso
    And los botones <boton_saltar> y <boton_siguiente>.

    Examples: Variables de entrada
      | boton_siguiente_in |
      | "Continuar"        |

    Examples: Variables de salida
      | caracteristica                      | indicador_paso                | boton_saltar | boton_siguiente |
      | "Cuidados inteligentes a tu medida" | (Indicador de página 2 de 3)  | "Saltar"     | "Continuar"     |

  Scenario Outline: Visualización de la última característica y finalización de la bienvenida
    Given que el usuario se encuentra en la segunda pantalla de la bienvenida
    When el usuario presiona el botón <boton_siguiente_in>
    Then el sistema avanza a la última pantalla del recorrido, que destaca la característica <caracteristica>
    And la pantalla contiene el <indicador_paso> mostrando el último paso
    And el botón <boton_comenzar>

    Examples: Variables de entrada
      | boton_siguiente_in |
      | "Continuar"        |

    Examples: Variables de salida
      | caracteristica                   | indicador_paso                | boton_comenzar  |
      | "Alertas que protegen tu jardín" | (Indicador de página 3 de 3)  | "Comenzar"      |