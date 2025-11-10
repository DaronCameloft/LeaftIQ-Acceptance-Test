Feature: Diario de planta registrada
  Como agricultor,
  Quiero registrar las actividades realizadas para mis plantas,
  Para observar mi cuidado con respecto a una sola planta.

  Scenario Outline: Visualizar el historial de actividades en el “Diario”
    Given un usuario se encuentra en la pantalla “Detalle de Planta Registrada”
    And la pestaña <pestana_diario> está seleccionada
    When el usuario revisa la pantalla
    Then ve un historial cronológico de todas las actividades pasadas para esa planta, como <actividad_regado>, <actividad_rotacion>, <actividad_fertilizante>, <actividad_foto> y <actividad_nota>
    And cada actividad muestra su fecha y hora correspondiente, con un icono representativo de la actividad.

    Examples: Variables de entrada
      | pestana_diario |
      | Diario         |

    Examples: Variables de salida
      | actividad_regado | actividad_rotacion | actividad_fertilizante | actividad_foto | actividad_nota |
      | Regado           | Rotación           | Fertilizante           | Foto           | Nota           |

  Scenario Outline: Abrir el menú para "Añadir Acción"
    Given un usuario está en la pestaña <pestana_diario>
    When el usuario presiona el botón <boton_anadir_accion>
    Then se abre un pop-up titulado <titulo_popup> desde la parte inferior de la pantalla
    And el pop-up muestra una lista de acciones que puede registrar, como <accion_regado>, <accion_rotacion>, <accion_fertilizante>, <accion_foto> y <accion_nota>, con su icono.

    Examples: Variables de entrada
      | pestana_diario | boton_anadir_accion |
      | Diario         | + Añadir accion     |

    Examples: Variables de salida
      | titulo_popup  | accion_regado | accion_rotacion | accion_fertilizante | accion_foto | accion_nota |
      | Añadir Acción | Regado        | Rotación        | Fertilizante        | Foto        | Nota        |

  Scenario Outline: Registrar una "Nota" en el Diario
    Given el usuario ha presionado <boton_anadir_accion> y ha seleccionado <accion_nota>
    When el sistema lo redirige a la pantalla <pantalla_anadir_nota>
    Then el usuario puede escribir en el campo de texto y ve los botones <boton_cancelar> y <boton_anadir>
    And al presionar <boton_anadir>, la nota se guardará en el historial del "Diario".

    Examples: Variables de entrada
      | boton_anadir_accion | accion_nota |
      | Añadir acción      | Nota        |

    Examples: Variables de salida
      | pantalla_anadir_nota | boton_cancelar | boton_anadir |
      | Añadir Nota          | Cancelar       | Añadir       |

  Scenario Outline: Iniciar el registro de una "Foto" en el Diario
    Given el usuario ha presionado <boton_anadir_accion> y ha seleccionado <accion_foto>
    When el sistema lo redirige a la pantalla <pantalla_anadir_foto>
    Then se activa la interfaz de la cámara del dispositivo
    And el usuario ve un botón para tomar la foto, un acceso a la galería, un botón para <boton_guardar>, y otro para consultar a la IA.

    Examples: Variables de entrada
      | boton_anadir_accion | accion_foto |
      | Añadir acción       | Foto        |

    Examples: Variables de salida
      | pantalla_anadir_foto | boton_guardar |
      | Añadir Foto          | Guardar       |

  Scenario Outline: Visualizar la nueva acción registrada en el "Diario"
    Given el usuario acaba de guardar una nueva acción (como una foto).
    When el sistema regresa a la pestaña "Diario"
    Then la nueva acción, <nueva_accion>, aparece al inicio de la línea de tiempo del historial, bajo la fecha <fecha_hoy>

    Examples: Variables de salida
      | nueva_accion | fecha_hoy |
      | Foto         | Hoy       |

  Scenario Outline: Confirmar la eliminación de una acción
    Given un usuario ha presionado el ícono de tres puntos en una actividad y ha seleccionado la opción "Eliminar"
    When el sistema muestra un pop-up de confirmación
    Then el pop-up contiene el mensaje <titulo_popup> y la pregunta <pregunta_confirmacion>
    And se presentan los botones <boton_confirmar> y <boton_cancelar>.

    Examples: Variables de salida
      | titulo_popup    | pregunta_confirmacion                                      | boton_confirmar | boton_cancelar |
      | Eliminar acción | ¿Estás seguro de querer eliminar esta acción de tu diario? | Sí, Eliminar    | Cancelar       |

  Scenario Outline: Confirmar la eliminación de una planta
    Given un usuario está en la pantalla de "Detalle de Planta Registrada"
    When presiona la opción para eliminar la planta
    Then el sistema muestra un pop-up de confirmación titulado <titulo_popup>
    And el pop-up pregunta <pregunta_confirmacion> y presenta los botones <boton_confirmar> y <boton_cancelar>.

    Examples: Variables de salida
      | titulo_popup          | pregunta_confirmacion                                             | boton_confirmar | boton_cancelar |
      | Eliminar de Mi Jardín | ¿Estás seguro de querer eliminar 'Aeonium arboreum' de Mi Jardín? | Sí, Eliminar    | Cancelar       |

  Scenario Outline: Confirmación de eliminación de la planta
    Given el usuario ha presionado <boton_confirmar> en el pop-up de confirmación
    When el sistema procesa la eliminación
    Then se muestra un pop-up de confirmación en la parte inferior de la pantalla
    And el mensaje indica <mensaje_confirmacion> con un <icono_confirmacion>.

    Examples: Variables de entrada
      | boton_confirmar |
      | Sí, Eliminar    |

    Examples: Variables de salida
      | mensaje_confirmacion                              | icono_confirmacion |
      | 'Aeonium arboreum' ha sido eliminado de Mi Jardin | (Icono check)      |