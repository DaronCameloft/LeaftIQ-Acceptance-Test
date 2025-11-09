Feature: Ejemplo de visual referencial de problema encontrado
  Como usuario,
  Quiero detectar cual es el problema que presenta mi planta y que debo hacer para solucionarlo,
  Para evitar la pérdida de mi planta.

  Scenario Outline: Imagen general del problema
    Given he encontrado un problema y he presionado el icono de ojo
    When cuando el sistema cargue.
    Then se me redirige a la pantalla “Imagen referencial problema”, donde se muestra datos como el <nombre_planta>, el <nombre_problema>, un <icono_agregar_jardin> la planta, y una <barra_seleccion> con las opciones de “<opcion_general>”, “<opcion_hojas>”, “<opcion_tallo>”
    And la opción predeterminada es “<opcion_predeterminada>”, por lo que se muestra una <imagen_referencia_general> del problema identificado.

    Examples: Variables de salida
      | nombre_planta    | nombre_problema | icono_agregar_jardin | barra_seleccion    | opcion_general | opcion_hojas | opcion_tallo | opcion_predeterminada | imagen_referencia_general  |
      | Aeonium arboreum | Exceso de riego | icono planta         | barra de selección | General        | Hojas        | Tallo        | General               | (Imagen de planta enferma) |

  Scenario Outline: Imagen de las hojas de la planta
    Given me encuentro en la pantalla “Imagen referencial problema”
    When presiono la opción “<opcion_hojas>” de la <barra_seleccion>
    Then la imagen de referencia realiza un acercamiento a la imagen general a las <imagen_referencia_hojas> de la planta.

    Examples: Variables de entrada
      | opcion_hojas | barra_seleccion |
      | Hojas        | barra selección |

    Examples: Variables de salida
      | imagen_referencia_hojas             |
      | (Imagen de planta enferma (hojas))  |

  Scenario Outline: Imagen del tallo de la planta
    Given me encuentro en la pantalla “Imagen referencial problema”
    When presiono la opción “<opcion_tallo>” de la <barra_seleccion>
    Then la imagen de referencia realiza un acercamiento a la imagen general a las <imagen_referencia_tallo> de la planta.

    Examples: Variables de entrada
      | opcion_tallo | barra_seleccion    |
      | Tallo        | barra selección    |

    Examples: Variables de salida
      | imagen_referencia_tallo            |
      | (Imagen de planta enferma (tallo)) |