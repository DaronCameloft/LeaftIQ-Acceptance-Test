Feature: Visualización de detalle del producto
  Como agricultor urbano,
  Quiero poder ver los detalles completos de una planta, incluyendo su precio, descripción y la información del proveedor,
  Para tomar una decisión de compra informada y conocer dónde puedo adquirirla.

  Scenario Outline: Visualizar la información detallada de un producto y su proveedor
    Given que el usuario se encuentra en la pantalla "Proveedores cercanos"
    When el usuario presiona sobre un producto de la lista
    Then el sistema carga la pantalla de detalle del producto
    And el usuario visualiza la información de la planta, incluyendo su <precio> y <tamaño>, los "Detalles" de cuidado (<agua>, <luz>, <fertilizante>), una <descripcion_planta> textual
    And el usuario también visualiza la información del proveedor, incluyendo, la <titulo_ubicacion>, el <nombre_vivero> y su <direccion_vivero>
    And el <horario_atencion>.

    Examples: Variables de salida
      | precio    | tamaño    | agua         | luz          | fertilizante        | descripcion_planta                                                                                                                                                                                                                                                                                                                          | titulo_ubicacion          | nombre_vivero       | direccion_vivero                    | horario_atencion              |
      | "S/ 250"  | "12.7 cm" | "MEDIA AGUA" | "35-40% LUZ" | "BAJO FERTILIZANTE" | "La peperomia sandía ( Peperomia argyreia ) ha ganado una gran popularidad entre los amantes de las plantas de interior gracias a su impresionante follaje con estampados de sandía. Crece de forma compacta y sus hojas no solo son coloridas, sino que también tienen un brillo que resulta especialmente atractivo bajo la luz del sol." | "Ubicacion de proveedor"  | "Vivero El Paraiso" | "Avenida A Mz. W, Chorrillos 15067" | "Abierto · Abre a las 8 a.m." |