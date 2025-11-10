Feature: Visualización y acciones en Artículo
  Como usuario,
  Quiero leer artículos detallados sobre temas de cultivo, con la opción de guardarlos para leer más tarde y compartirlos,
  Para así profundizar mis conocimientos y tener la información a la mano.

  Scenario Outline: Visualización del contenido de un artículo
    Given el usuario se encuentra en la pantalla "Guías rápidas" en la pestaña de "Artículos"
    When presiona sobre el artículo <titulo_articulo_lista>
    Then el sistema carga la pantalla "Artículo" con el contenido completo (<titulo>, <subtitulo> y <descripcion>)
    And el usuario visualiza en la barra superior un ícono para <icono_compartir> y otro para <icono_guardar>.

    Examples: Variables de entrada
      | titulo_articulo_lista                                               |
      | "Descubre como preparar un cultivo: trucos, preparación y cuidados" |

    Examples: Variables de salida
      | titulo                                                              | subtitulo                                        | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | icono_compartir      | icono_guardar               |
      | "Descubre como preparar un cultivo: trucos, preparación y cuidados" | "Preparar un cultivo: primeros pasos esenciales" | "Antes de sembrar, es clave preparar adecuadamente el terreno para asegurar un buen desarrollo de tus plantas. Comienza limpiando el área, retirando piedras, malezas y restos de cultivos anteriores. Remueve la tierra con una pala o azadón, procurando airearla y asegurar un buen drenaje. Es recomendable enriquecer el suelo con abono orgánico o compost, lo que aportará nutrientes vitales para el crecimiento. Haz surcos o camas de plantación según el tipo de cultivo y la disposición deseada. Asegúrate de regar la tierra suavemente antes de sembrar, manteniéndola húmeda pero sin encharcar. Finalmente, monitorea tus plantas a diario, controlando la aparición de plagas y asegurando que reciban suficiente luz y agua para crecer sanas y fuertes" | (Icono de Compartir) | (Icono de Guardar/Archivar) |

  Scenario Outline: Escenario 2: Compartir un artículo
    Given un usuario está en la pantalla de "Artículo"
    When presiona el ícono de <icono_compartir>
    Then se despliega un menú modal titulado <titulo_modal> desde la parte inferior de la pantalla
    And el menú muestra una lista de <lista_personas> y <lista_redes> (<red_1>, <red_2>, <red_3>, <red_4>).

    Examples: Variables de entrada
      | icono_compartir      |
      | (Icono de Compartir) |

    Examples: Variables de salida
      | titulo_modal | lista_personas       | lista_redes      | red_1      | red_2      | red_3       | red_4      |
      | "Compartir"  | "Personas recientes" | "Redes Sociales" | "WhatsApp" | "Facebook" | "Instagram" | "Telegram" |

  Scenario Outline: Guardar un artículo
    Given un usuario se encuentra en la pantalla de "Artículo"
    When presiona el ícono de <icono_guardar>
    Then el sistema procesa la acción
    And se muestra un mensaje de confirmación en la parte superior que dice <mensaje_confirmacion> con un <icono_check>.

    Examples: Variables de entrada
      | icono_guardar               |
      | (Icono de Guardar/Archivar) |

    Examples: Variables de salida
      | mensaje_confirmacion | icono_check      |
      | "Artículo guardado"  | (Icono de check) |