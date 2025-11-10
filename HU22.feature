Feature: Búsqueda de contenido general (plantas y artículos)
  Como usuario,
  Quiero buscar plantas y artículos dentro de la aplicación,
  Para encontrar rápidamente la información específica que necesito, ya sea sobre tipos de plantas o guías de cuidado.

  Scenario Outline: Iniciar una búsqueda y ver sugerencias
    Given el usuario se encuentra en la sección de artículos o en la pantalla principal
    When presiona la barra de búsqueda
    Then el sistema lo redirige a la pantalla de búsqueda
    And visualiza una lista de <lista_busquedas> y sugerencias de plantas populares para facilitar el acceso rápido.

    Examples: Variables de salida
      | lista_busquedas       |
      | "Búsquedas recientes" |

  Scenario Outline: Búsqueda exitosa con resultados de plantas y artículos
    Given el usuario está en la pantalla de búsqueda
    When ingresa un término de búsqueda válido, como <termino_busqueda>
    Then el sistema muestra una lista de resultados que incluyen tanto plantas como artículos relacionados
    And cada resultado se presenta en una tarjeta con una <imagen>, <titulo>, <descripcion> y una <etiqueta> que indica el tipo de contenido.

    Examples: Variables de entrada
      | termino_busqueda |
      | "Plant"          |

    Examples: Variables de salida
      | imagen                               | titulo                     | descripcion                                                                        | etiqueta             |
      | (Imagen de Plantas Florales)         | "Plantas Florales"         | "Consejos esenciales para el cuidado de plantas con flores, incluyendo la prep..." | "Follaje de Plantas" |
      | (Imagen de Plantas para macetas)     | "Plantas para macetas"     | "Guía para el trasplante exitoso de tus plantas en maceta. Aprende el mom..."      | "Articulos & guias"  |
      | (Imagen de Sansevieria)              | "Sansevieria"              | "Lengua de Suegra o Planta Serpiente. Se explica el método de riego de 'emp..."    | "Follaje de Plantas" |
      | (Imagen de Aeonium arboreum)         | "Aeonium arboreum"         | "Aeonium arboreum o Aeonium korneliuslemsii es una especie de planta tro..."       | "Follaje de Plantas" |
      | (Imagen de Descubre plantas para...) | "Descubre plantas para..." | "Información para explorar y seleccionar plantas adecuadas para un entor..."       | "Articulos & guias"  |

  Scenario Outline: Búsqueda sin resultados
    Given el usuario está en la pantalla de búsqueda
    When ingresa un término que no arroja ninguna coincidencia
    Then el sistema muestra una <ilustracion> y el mensaje <mensaje_titulo>
    And se le sugiere al usuario que <mensaje_sugerencia>.

    Examples: Variables de salida
      | ilustracion                           | mensaje_titulo           | mensaje_sugerencia                                                       |
      | (Ilustración de agricultor pensativo) | "Plantas no encontradas" | "Verifica tus palabras clave o intenta buscar con otras palabras clave." |