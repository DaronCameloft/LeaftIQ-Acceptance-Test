Feature: Listado de posibles problemas con probabilidades
  Como usuario, quiero que la aplicación me muestre un listado de posibles problemas identificados en la planta con su nivel de probabilidad con el respectivo cuidado y solución de cada uno,
  Para poder decidir con mayor seguridad qué acción tomar.

  Scenario Outline: Se muestran múltiples resultados probables
    Given que he completado un diagnóstico por foto y el estado de la planta es <estado_planta>
    When la pantalla de resultados carga
    Then el usuario visualiza el <nombre_planta>, <datos_origen>, <datos_habito>, <datos_floracion>
    And un botón con <icono_ver_fotos> para visualizar más fotos de la planta, y otro con <icono_agregar_jardin> para agregarlo a “Mi jardín”.
    And veo los problemas identificados con probabilidades
    And una sección de “<seccion_soluciones>” con una barra de selección con las opciones de “<opcion_general>”, “<opcion_resumen>”, “<opcion_soluciones>”, “<opcion_senales>” y “<opcion_buenas_practicas>”.
    And como opción predeterminada “<opcion_predeterminada>” que muestra toda la información

    Examples: Variables de entrada
      | estado_planta |
      | malo          |

    Examples: Variables de salida
      | nombre_planta    | datos_origen           | datos_habito               | datos_floracion     | icono_ver_fotos | icono_agregar_jardin | seccion_soluciones    | opcion_general | opcion_resumen | opcion_soluciones | opcion_senales | opcion_buenas_practicas | opcion_predeterminada |
      | Aeonium arboreum | Origen: Islas Canarias | Hábito: 0.5-1.5 m exterior.| Floracion: amarilla | icono de ojo    | icono planta         | Soluciones y cuidados | General        | Resumen        | Soluciones        | Señales        | Buenas practicas        | General               |

  Scenario Outline: Seleccionar una opción de soluciones y cuidado
    Given el usuario se encuentra en la pantalla “Lista de problemas”
    When el usuario presiona una de las <opciones>
    Then solo se presenta la información de la <sección_seleccionada>.

    Examples: Variables de entrada
      | opciones |
      | Resumen  |

    Examples: Variables de salida
      | seccion_seleccionada |
      | Resumen accionable   |