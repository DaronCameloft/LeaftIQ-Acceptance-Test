Feature: Recordatorios de actividades
  Como agricultor,
  Quiero crear y recibir recordatorios de las actividades necesarias,
  Para garantizar un mejor cuidado y crear una rutina.

  Scenario Outline: Gestionar recordatorios de cuidado sin plan personalizado
    Given un usuario se encuentra en la pantalla “Detalle de Planta Registrada” y aún no ha generado un plan
    When el usuario selecciona la pestaña <pestana_recuerdos>
    Then ve una lista de tareas de cuidado, cada una con su <tarea_cuidado>, su <fecha_tarea> y un <toggle_interruptor>
    And se visualiza un <boton_flotante_anadir> para añadir un recordatorio manual
    And se muestra un botón en la parte inferior con el texto <texto_boton_generar_plan>.

    Examples: Variables de salida
      | pestana_recuerdos | tarea_cuidado | fecha_tarea                     | toggle_interruptor | boton_flotante_anadir | texto_boton_generar_plan   |
      | Recuerdos         | Regado        | Siguiente: Oct 1, 2025 08:00 AM | (toggle on)        | (Icono "+")           | Generar plan personalizado |
      | Recuerdos         | Rotacion      | Siguiente: Oct 2, 2025 16:00 PM | (toggle on)        | (Icono "+")           | Generar plan personalizado |
      | Recuerdos         | Fertilizante  | Siguiente: Oct 3, 2025 10:00 AM | (toggle off)       | (Icono "+")           | Generar plan personalizado |

  Scenario Outline: Gestionar recordatorios de cuidado con plan personalizado
    Given un usuario se encuentra en la pantalla “Detalle de Planta Registrada” y ya ha generado un plan
    When el usuario selecciona la pestaña <pestana_recuerdos>
    Then ve la lista de tareas de cuidado activadas por el plan, como <tarea_cuidado>, cada una con su <fecha_tarea> y sus <toggles_activos>
    And se visualiza un botón <boton_ver_plan> en la cabecera, debajo de la información de la planta
    And el <boton_flotante_anadir> sigue visible para añadir recordatorios manuales.

    Examples: Variables de salida
      | pestana_recuerdos | tarea_cuidado | fecha_tarea                   | toggles_activos   | boton_ver_plan | boton_flotante_anadir |
      | Recuerdos         | Regado        | Siguiente: Oct 1, 2025 08:00 AM | (toggle on)     | Ver plan       | (Icono "+")           |
      | Recuerdos         | Rotacion      | Siguiente: Oct 2, 2025 16:00 PM | (toggle on)     | Ver plan       | (Icono "+")           |
      | Recuerdos         | Fertilizante  | Siguiente: Oct 3, 2025 10:00 AM | (toggle off)    | Ver plan       | (Icono "+")           |

  Scenario Outline: Añadir un recordatorio manual
    Given el usuario se encuentra en la pestaña <pestana_recuerdos>
    When presiona el <boton_flotante_anadir>
    Then es redirigido a la pantalla <pantalla_anadir_recordatorio>
    And puede configurar los campos <campo_acerca_de>, <campo_repite> y <campo_hora>
    And ve los botones <boton_cancelar> y <boton_guardar> en la parte inferior.

    Examples: Variables de entrada
      | pestana_recuerdos | boton_flotante_anadir |
      | Recuerdos         | (Icono "+")           |

    Examples: Variables de salida
      | pantalla_anadir_recordatorio | campo_acerca_de       | campo_repite        | campo_hora | boton_cancelar | boton_guardar |
      | Añadir recordatorio          | Recuérdame acerca de: | Repite              | Hora       | Cancelar       | Guardar       |