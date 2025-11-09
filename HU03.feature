Feature: Ejemplo de visual referencial de planta escaneada
  Como usuario,
  Quiero ver una imagen de referencia de una planta y sus partes con respecto a la que he escaneado,
  Para realizar comparaciones de desarrollo.

  Scenario Outline: Imagen general de la planta
    Given he escaneado una planta y he presionado el icono de ojo
    When el sistema carga la pantalla "Imagen referencial planta"
    Then se me redirige a la pantalla "Imagen referencial planta", donde se muestra datos como el <nombre_planta>, un <boton_agregar_jardin>, una <barra_seleccion> con las opciones <opcion1>, <opcion2>, <opcion3>
    And la <opcion1> está seleccionada por defecto
    And se muestra una <imagen_referencia_general> de la planta.

    Examples: Variables de salida
      | nombre_planta    | boton_agregar_jardin | barra_seleccion     | opcion1   | opcion2 | opcion3 | imagen_referencia_general |
      | Aeonium arboreum | Icono de planta      | Barra de selección  | General   | Hojas   | Tallo   | (Imagen de planta sana)   |

  Scenario Outline: Imagen de las hojas de la planta
    Given me encuentro en la pantalla "Imagen referencial planta"
    When presiono la opcion <opcion2> de la <barra_seleccion>
    Then la <opcion2> se muestra como seleccionada
    And la imagen de referencia realiza un acercamiento a las <imagen_referencia_hojas> de la planta.

    Examples: Variables de entrada
      | barra_seleccion    | opcion2 |
      | Barra de selección | Hojas   |

    Examples: Variables de salida
      | imagen_referencia_hojas         |
      | (Imagen de planta sana (hojas)) |

  Scenario Outline: Imagen del tallo de la planta
    Given me encuentro en la pantalla "Imagen referencial planta"
    When presiono la opcion <opcion3> de la <barra_seleccion>
    Then la opcion <opcion3> se muestra como seleccionada
    And la imagen de referencia realiza un acercamiento al <imagen_referencia_tallo> de la planta.

    Examples: Variables de entrada
      | barra_seleccion    | opcion3 |
      | Barra de selección | Tallo   |

    Examples: Variables de salida
      | imagen_referencia_tallo         |
      | (Imagen de planta sana (tallo)) |

      