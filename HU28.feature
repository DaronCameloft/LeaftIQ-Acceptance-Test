Feature: Configuración y personalización de alertas
  Como usuario,
  Quiero personalizar qué tipos de alertas recibir (clima, plagas) y su frecuencia,
  Para enfocarme solo en la información que sea relevante para mí.

  Scenario Outline: Escenario 1: Acceder a la configuración de notificaciones
    Given que el usuario se encuentra en la pantalla "Notificaciones"
    When el usuario presiona el icono de <icono_configuracion>
    Then el sistema carga la pantalla de configuración de notificaciones
    And el usuario visualiza una lista de categorías de notificaciones que puede activar o desactivar, como: <opcion_general>, <categoria_1>, <categoria_2>, <categoria_3>, <categoria_4>, <categoria_5>, <categoria_6>, <categoria_7>, <categoria_8>, <categoria_9>, <categoria_10>.

    Examples: Variables de entrada
      | icono_configuracion         |
      | (Icono de "Configuración")  |

    Examples: Variables de salida
      | opcion_general              | categoria_1                  | categoria_2                | categoria_3              | categoria_4                     | categoria_5                 | categoria_6            | categoria_7                    | categoria_8              | categoria_9                      | categoria_10                            |
      | "Desactivar notificaciones" | "Actualizaciones de plantas" | "Recordatorios de cuidado" | "Alertas de suscripción" | "Participación en la comunidad" | "Actualizaciones de cuenta" | "Alertas de seguridad" | "Recomendaciones de contenido" | "Alertas de interacción" | "Resumen de actividad de cuenta" | "Actualizaciones de soporte al cliente" |