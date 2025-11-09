Feature: Centro de Salud de la Planta
  Como usuario,
  Quiero tener un centro de salud para mis plantas, donde pueda acceder a herramientas de diagnóstico y explorar artículos sobre plagas y enfermedades
  Para informarme y actuar preventivamente.

  Scenario Outline: Explorar el Centro de Salud y sus recursos
    Given el usuario quiere informarse sobre la salud de las plantas
    When presiona la pestaña <pestana_diagnostico> en la barra de navegación
    Then el sistema carga la pantalla "Diagnósitco" y muestra un botón para ver el <boton_historial> de diagnósticos
    And se muestra una tarjeta principal que ofrece la opción de <opcion_diagnosticar> para iniciar una nueva revisión
    And se presenta una sección de <seccion_plagas> con tarjetas para <articulo_plaga_1> y <articulo_plaga_2> para una consulta rápida
    And se visualiza una sección para <seccion_explorar_articulos> de enfermedades.

    Examples: Variables de entrada
      | pestana_diagnostico  |
      | Diagnóstico          |

    Examples: Variables de salida
      | boton_historial | opcion_diagnosticar | seccion_plagas                | articulo_plaga_1 | articulo_plaga_2 | seccion_explorar_articulos |
      | Historial       | Diagnosticar        | Artículos referente a plagas  | Pulgones         | Mosca Blanca     | Explorar artículos         |