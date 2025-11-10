Feature: Información de estado de planta
  Como agricultor principiante,
  Quiero conocer los detalles del estado de mi planta y datos importantes,
  Para tener un rápido monitoreo.

  Scenario Outline: Escaneo y descripción de la planta
    Given el usuario ha escaneado una planta y su condición es buena
    And se encuentra en la pantalla de "Detalle Planta"
    When cuando el sistema carga
    Then el usuario visualiza el <nombre_planta>
    And visualiza sus datos de <origen>, <habito>, <floracion>
    And visualiza el <boton_ver_fotos>, y otro <boton_agregar_jardin>.
    And presenta detalles de la planta, como la <nivel_agua>, <nivel_luz> y <nivel_fertilizante>
    And una <descripcion> de las plantas, con una sección de diagnóstico que contiene tarjetas de <tarjeta1>, <tarjeta2>, <tarjeta3>, <tarjeta4>, <tarjeta5> y <tarjeta6>.

    Examples: Variables de salida
      | nombre_planta    | origen                  | habito                      | floracion           | boton_ver_fotos                                               | boton_agregar_jardin                      | nivel_agua   | nivel_luz   | nivel_fertilizante | descripcion                                                                                                                                                                                            | tarjeta1      | tarjeta2         | tarjeta3        | tarjeta4                 | tarjeta5   | tarjeta6  |
      | Aeonium arboreum | Origen: Islas Canarias. | Hábito: 0.5-1.5 m exterior. | Floracion: amarilla | botón con icono de ojo para visualizar más fotos de la planta | icono planta para agregarlo a "Mi jardín" | MEDIA AGUA   | 35-40% LUZ  | BAJO FERTILIZANTE  | Suculenta arborescente con tallos delgados y rosetas carnosas verde-amarillentas. Crece en clima fresco (invierno) y reposa en verano. Prefiere sol filtrado a pleno sol, sustrato muy drenante y riegos espaciados dejando secar el suelo. Produce flores amarillas en panículas. | Morfología    | Estado hídrico | Iluminación     | Crecimiento/Estación | Sanidad    | Riesgos   |

  Scenario Outline: Detalles de la planta
    Given el usuario se encuentra en la pantalla "Detalle Planta"
    When cuando presiona una de las <tarjetas_categoria_diagnostico>
    Then la pantalla muestra una <descripcion_detalle> respecto a la categoría.

    Examples: Variables de entrada
      | tarjetas_categoria_diagnostico |
      | Morfología                     |

    Examples: Variables de salida
      | descripcion_detalle                                                                                                          |
      | Tallos leñosos delgados con cicatrices foliares y rosetas compactas de hojas carnosas obovadas con borde ligeramente rojizo. |

      