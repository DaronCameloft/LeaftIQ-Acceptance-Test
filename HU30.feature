Feature: Creación de bitácora
  Como agricultor rural,
  Quiero crear registros personalizados basados en fecha y hora, ubicación, notas y fotos sobre mis actividades,
  Para tener como ejemplo para mis siguientes trabajos.

  Scenario Outline: Visualizar el contenido de una entrada de bitácora
    Given que el usuario se encuentra en la pantalla "Bitácora"
    When el usuario presiona sobre la entrada <id_bitacora>
    Then el sistema carga la pantalla <id_bitacora> y el usuario visualiza los detalles de la entrada, organizados en secciones como <seccion_1>, <seccion_2>, <seccion_3>, <seccion_4>
    And los botones <boton_cancelar>, <boton_guardar> y un botón para añadir un nuevo ítem (<boton_add>).

    Examples: Variables de entrada
      | id_bitacora       |
      | "Bitácora #006" |

    Examples: Variables de salida
      | seccion_1       | seccion_2   | seccion_3 | seccion_4 | boton_cancelar | boton_guardar | boton_add |
      | "Fecha y hora"  | "Ubicación" | "Nota"    | "Fotos"   | "Cancelar"     | "Guardar"     | "+"       |

  Scenario Outline: Abrir las opciones para añadir un nuevo ítem a la bitácora
    Given que el usuario se encuentra en la pantalla <id_bitacora>
    When el usuario presiona el botón para añadir un nuevo ítem (<boton_add>)
    Then el sistema despliega un menú modal titulado <titulo_modal>
    And el usuario visualiza las siguientes opciones para agregar <opcion>
    And <opcion>.

    Examples: Variables de entrada
      | id_bitacora       | boton_add |
      | "Bitácora #006" | "+"       |

    Examples: Variables de salida
      | titulo_modal    | opcion          |
      | "Añadir item"   | "Fecha y Hora"  |
      | "Añadir item"   | "Ubicación"     |
      | "Añadir item"   | "Foto"          |
      | "Añadir item"   | "Nota"          |

  Scenario Outline: Añadir una nueva nota a la bitácora
    Given el usuario ha presionado la opción <opcion_menu> desde el menú "Añadir item"
    When el sistema lo redirige a la pantalla "Añadir Nota"
    Then el usuario puede escribir en el campo de texto
    And ve los botones <boton_cancelar> y <boton_anadir>.

    Examples: Variables de entrada
      | opcion_menu |
      | "Nota"      |

    Examples: Variables de salida
      | boton_cancelar | boton_anadir |
      | "Cancelar"     | "Añadir"     |

  Scenario Outline: Visualizar la bitácora actualizada con la nueva nota
    Given el usuario ha presionado <boton_anadir> en la pantalla "Añadir Nota"
    When el sistema lo regresa a la pantalla <id_bitacora>
    Then la nueva nota (ej. <nuevo_item_titulo>) aparece en la lista de ítems de la bitácora.
    And cada ítem de la bitácora muestra un <icono_menu> y un <icono_arrastre>.

    Examples: Variables de entrada
      | boton_anadir | id_bitacora       |
      | "Añadir"     | "Bitácora #006" |

    Examples: Variables de salida
      | nuevo_item_titulo | icono_menu             | icono_arrastre         |
      | "Nota #2"         | (Icono de tres puntos) | (Icono de dos líneas)  |

  Scenario Outline: Visualizar el estado de sincronización del nuevo ítem
    Given el usuario está en la pantalla <id_bitacora> después de añadir un ítem.
    When el nuevo ítem (<nuevo_item_titulo>) aún no se ha guardado en la nube.
    Then se muestra un <icono_sincronizacion> (nube con flecha) junto al ítem, indicando que el guardado está en proceso.

    Examples: Variables de entrada
      | id_bitacora       | nuevo_item_titulo |
      | "Bitácora #006" | "Nota #2"         |

    Examples: Variables de salida
      | icono_sincronizacion        |
      | (Icono de nube con flecha)  |