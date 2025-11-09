Feature: Consultar enciclopedia de enfermedades
  Como agricultor,
  Quiero consultar una base de conocimiento sobre enfermedades comunes de las plantas,
  Para aprender a identificar síntomas y entender sus causas, incluso sin haber realizado un diagnóstico con la cámara.

  Scenario Outline: Explorar la lista de categorías de enfermedades
    Given el usuario ha accedido a la sección de <seccion_enfermedades>
    When el usuario quiere informarse sobre un tipo de enfermedad
    Then el sistema muestra una pantalla con una barra de búsqueda y una lista de categorías de enfermedades
    And cada categoría en la lista muestra una <imagen_categoria>, un <titulo_categoria>, una <descripcion_categoria> y <etiquetas_categoria>
    And el usuario puede presionar sobre cualquier categoría para ver más detalles.

    Examples: Variables de entrada
      | seccion_enfermedades  |
      | Enfermedades comunes |

    Examples: Variables de salida
      | imagen_categoria                            | titulo_categoria                   | descripcion_categoria                                                              | etiquetas_categoria    |
      | (Imagen de enfermedades en hojas)           | Enfermedades en Hojas              | Es la forma más frecuente de detectar enfermedades causadas por hongos (co...      | Enfermedades & plagas  |
      | (Imagen de enfermedades en planta completa) | Enfermedades de la Planta Completa | Generalmente son infecciones sistémicas (virus, marchitez bacteria...              | Enfermedades & plagas  |
      | (Imagen de enfermedades en raíces)          | Enfermedades en Raíces             | El principal problema son las pudriciones causadas por el exceso de riego o d...   | Enfermedades & plagas  |
      | (Imagen de enfermedades en tallos)          | Enfermedades en Tallos             | Incluye chancros, necrosis o pudriciones basales que interrumpen el flujo de ag... | Enfermedades & plagas  |
      | (Imagen de enfermedades en flores y frutos) | Enfermedades en Flores y Frutos    | Afectan la cosecha. Hongos como la Botrytis (moho gris) o el tizón tardío caus...  | Articulos & guias      |

  Scenario Outline: Consultar el detalle de un artículo de enfermedad
    Given el usuario está en la pantalla <seccion_enfermedades>
    When el usuario presiona sobre la categoría <titulo_categoria>
    Then el sistema carga la pantalla "Artículo" correspondiente
    And el usuario visualiza una <imagen_principal_articulo>, el <titulo_articulo> y pestañas de navegación de contenido
    And el usuario puede leer el texto detallado de cada sección
    And el usuario ve opciones en la cabecera para "<opcion_compartir>" y "<opcion_archivar>" el artículo.

    Examples: Variables de entrada
      | seccion_enfermedades  | titulo_categoria        |
      | Enfermedades comunes  | Enfermedades en Hojas   |

    Examples: Variables de salida
      | imagen_principal_articulo      | titulo_articulo       | tab_1        | tab_2    | tab_3  | opcion_compartir  | opcion_archivar  |
      | (Imagen de enfermedad en hoja) | Enfermedades en Hojas | Introduccion | Sintomas | Causas | (Icono Compartir) | (Icono Archivar) |