Feature: Gestión de Mi Jardín
  Como agricultor principiante,
  Quiero gestionar y ver todas mis plantas registradas, buscarlas, añadir nuevas y consultar un historial de actividad
  Para percibir mayor control en el cuidado de mis plantas.

  Scenario Outline: Registro sin plantas
    Given el usuario se encuentre en la pantalla “Mi Jardín” y no ha guardado ninguna planta
    When cuando el sistema verifique que aún no se ha registrado ninguna planta.
    Then el sistema muestra el <icono_app>, el mensaje <mensaje_vacio> y <submensaje_vacio>
    And se visualiza un <boton_flotante_anadir> para añadir plantas, un <icono_buscador>, uno de <icono_mas_opciones>
    And una pestaña de <pestaña_historial>.

    Examples: Variables de salida
      | icono_app      | mensaje_vacio         | submensaje_vacio                    | boton_flotante_anadir | icono_buscador | icono_mas_opciones | pestaña_historial |
      | (Icono LeafIQ) | No tienes plantas :() | No guardaste ninguna planta todavía | (Icono "+")           | (Icono Lupa)   | (Icono 3 puntos)   | Historial         |

  Scenario Outline: Registro con plantas
    Given el usuario se encuentre en la pantalla “Mi Jardín”
    When cuando el sistema encuentre todas las plantas asociadas a su cuenta
    Then el usuario visualiza una barra de selección con las opciones de <opcion_plantas>, con un <contador_plantas> indicando la cantidad e <opcion_historial>, un <icono_buscar>, un <boton_flotante_anadir>
    And presenta una tarjeta por cada planta registrada, con su <nombre_comun>, <nombre_botanico>, <iconos_actividades>. Cada una presenta una fecha para redireccionar a una pantalla con más información.

    Examples: Variables de salida
      | opcion_plantas | contador_plantas | opcion_historial | icono_buscar | boton_flotante_anadir | nombre_comun | nombre_botanico      | iconos_actividades               |
      | Plantas        | (7)              | Historial        | (Icono Lupa) | (Icono "+")           | Suculenta    | Aeonium arboreum     | (Iconos agua, sol, fertilizante) |
      | Plantas        | (7)              | Historial        | (Icono Lupa) | (Icono "+")           | Tomate       | Solanum lycopersicum | (Iconos agua, sol)               |
      | Plantas        | (7)              | Historial        | (Icono Lupa) | (Icono "+")           | Lechuga      | Lactuca sativa       | (Iconos sol, fertilizante)       |
      | Plantas        | (7)              | Historial        | (Icono Lupa) | (Icono "+")           | Rábanos      | Raphanus sativus     | (Iconos agua, fertilizante)      |

  Scenario Outline: Visualización del historial del jardín
    Given el usuario se encuentre en la pantalla “Mi Jardín”
    When presiona la pestaña <pestaña_historial>
    Then el sistema muestra una lista cronológica de las plantas registradas, agrupadas por <grupo_fecha>
    And cada entrada del historial muestra la <imagen_planta>, <nombre_planta>, <descripcion_planta> de la planta.

    Examples: Variables de entrada
      | pestaña_historial |
      | Historial         |

    Examples: Variables de salida
      | grupo_fecha         | imagen_planta         | nombre_planta         | descripcion_planta                                                                    |
      | Hoy, Oct 18, 2025   | (Imagen de Aeonium)   | Aeonium arboreum      | Suculenta arborescente de las Islas Canarias, con tallos delgados y rosetas carnos... |
      | Hoy, Oct 18, 2025   | (Imagen de Campanula) | Campanula             | Planta ornamental muy popular, conocida por su floración en forma de 'ca...           |
      | Ayer, Oct 17, 2025  | (Imagen de Anthurium) | Anthurium andraeanum  | Planta tropical de interior muy apreciada por sus flores (espatas) grandes y...       |
      | Ayer, Oct 17, 2025  | (Imagen de Musa)      | Musa spp              | Planta tropical, herbácea gigante, reconocida por su tronco robusto (pseudotal...)    |
      | Oct 16, 2025        | (Imagen de Olea)      | Olea europaea         | Árbol perenne de origen mediterráneo, muy longevo y resistente. Se caracteriz...      |

  Scenario Outline: Buscar una planta
    Given el usuario se encuentre en la pantalla “Mi Jardín”
    When presiona el ícono de <icono_buscar> en la barra superior
    Then es redirigido a la pantalla de búsqueda.
    And al escribir un <termino_busqueda>, el sistema filtra y muestra los resultados de plantas que coinciden, junto con las <seccion_busquedas_recientes>.

    Examples: Variables de entrada
      | icono_buscar | termino_busqueda |
      | (Icono Lupa) | Sucu             |

    Examples: Variables de salida
      | seccion_busquedas_recientes |
      | Búsquedas recientes         |

  Scenario Outline: Seleccionar y eliminar plantas de la lista
    Given el usuario se encuentra en la pestaña <pestana_plantas> de "Mi Jardín"
    When entra en modo de selección y marca la casilla de una o más plantas
    Then aparece una barra de acción en la parte superior que muestra la <contador_seleccion>
    And en esa misma barra se muestra un <icono_eliminar> para borrar las plantas seleccionadas de la lista.

    Examples: Variables de entrada
      | pestana_plantas |
      | Plantas        |

    Examples: Variables de salida
      | contador_seleccion | icono_eliminar      |
      | 1 Seleccionado     | (Icono eliminar)    |