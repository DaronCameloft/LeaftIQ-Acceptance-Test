Feature: Búsqueda de proveedores cercanos
  Como usuario,
  Quiero poder buscar y explorar un catálogo de plantas de proveedores cercanos,
  Para encontrar y adquirir fácilmente lo que necesito para mi jardín.

  Scenario Outline: Visualizar el catálogo de proveedores cercanos
    Given que el usuario se encuentra en la pantalla "Mi jardín"
    When el usuario presiona la opción para ver "Proveedores cercanos"
    Then el sistema carga la pantalla "Proveedores cercanos"
    And el usuario visualiza las siguientes herramientas para explorar el catálogo que son una barra de <campo_buscar>, pestañas de categorías como <pestaña_1>, <pestaña_2> y <pestaña_3>
    And una lista de productos disponibles con su <nombre_producto> y <precio_producto>.

    Examples: Variables de salida
      | campo_buscar | pestaña_1 | pestaña_2    | pestaña_3     | nombre_producto | precio_producto |
      | "Buscar"     | "Para tí" | "Interiores" | "Exteriores"  | "Peperomia"     | "S/130"         |
      | "Buscar"     | "Para tí" | "Interiores" | "Exteriores"  | "Watermellon"   | "S/250"         |
      | "Buscar"     | "Para tí" | "Interiores" | "Exteriores"  | "Aloe Vera"     | "S/100"         |