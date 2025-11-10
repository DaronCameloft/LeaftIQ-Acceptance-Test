Feature: Generación de receta digital de cuidado
  Como usuario,
  Quiero poder generar una "receta digital" que resuma el plan de cuidado de mi planta,
  Para poder descargarla, compartirla o tenerla como una guía de referencia rápida y consolidada.

  Scenario Outline: Visualización del estado de carga al generar la receta
    Given el usuario se encuentra en la pantalla "Plan personalizado"
    When el usuario presiona la opción "Generar receta"
    Then el sistema muestra un menú modal de carga
    And el usuario visualiza un indicador de progreso con el texto <texto_carga>.

    Examples: Variables de salida
      | texto_carga         |
      | "Generando receta..." |

  Scenario Outline: Carga de la pantalla de receta generada con sus opciones
    Given que el sistema ha finalizado la generación de la receta digital
    When el sistema redirige al usuario
    Then el sistema carga la pantalla "Receta digital generada" con un <codigo_qr>
    And el usuario visualiza las opciones de <opcion_descargar>, <opcion_compartir>, el botón <boton_volver> y el botón <boton_ver_receta>.

    Examples: Variables de salida
      | codigo_qr   | opcion_descargar | opcion_compartir | boton_volver | boton_ver_receta |
      | "código QR" | "Descargar"      | "Compartir"      | "Volver"     | "Ver receta"     |

  Scenario Outline: Confirmación de descarga de la receta
    Given que usuario se encuentra en la pantalla "Receta digital generada"
    When presiona la opción <opcion_descargar>
    Then el sistema procesa la descarga
    And se muestra un mensaje de confirmación en la parte superior que dice <mensaje_confirmacion>.

    Examples: Variables de entrada
      | opcion_descargar |
      | "Descargar"      |

    Examples: Variables de salida
      | mensaje_confirmacion  |
      | "Receta descargada" |