Feature: Plan de cuidado personalizado y recordatorios
  Como usuario,
  Quiero que la aplicación genere un plan de cuidado adaptado a cada tipo de planta y me proponga recordatorios,
  Para seguir instrucciones claras y confiar en el correcto cuidado de mi planta.

  Scenario Outline: Visualizar y activar un plan de cuidado personalizado
    Given que el usuario se encuentra en la pantalla "Detalle de Planta Registrada"
    When el usuario selecciona la opción "Generar plan personalizado"
    Then el sistema carga la pantalla "Plan personalizado" y el usuario visualiza una lista de recordatorios como <recordatorio_1>, <recordatorio_2> y <recordatorio_3>, cada uno con su <fecha_programada_1>, <fecha_programada_2>, <fecha_programada_3> y un interruptor para activar el recordatorio
    And se muestra la sección "Recomendaciones" (<ubicacion>, <luz_solar>, <maceta>, <epoca>, <clima_local>) y el "Plan de cuidados" detallado (<plan_cuidado_1>, <plan_cuidado_2>, <plan_cuidado_3>)
    And al final de la pantalla, se presentan los botones <boton_cancelar> y <boton_guardar>.

    Examples: Variables de salida
      | recordatorio_1 | fecha_programada_1                  | recordatorio_2 | fecha_programada_2                    | recordatorio_3 | fecha_programada_3                | ubicacion                   | luz_solar | maceta                           | epoca       | clima_local | plan_cuidado_1       | plan_cuidado_2        | plan_cuidado_3 | boton_cancelar | boton_guardar |
      | "Regado"       | "Siguiente: Oct 13, 2025 08:00 AM"  | "Rotacion"     | "Siguiente: Oct 8, 2025 16:00 PM"     | "Fertilizante" | "Siguiente: Nov, 2025 10:00 AM"   | "Interior junto a ventana"  | "Directo" | "Terracota o plastico. 13-18 cm" | "Primavera" | "Templado"  | "Revision de plagas" | "Chequeo de sustrato" | "Trasplante"   | "Cancelar"     | "Guardar"     |

  Scenario Outline: Visualizar un plan de cuidado ya guardado
    Given el usuario ya ha guardado un plan personalizado para su planta
    When accede a la pantalla del plan
    Then el sistema carga la pantalla "Plan personalizado" en modo de visualización.
    And el usuario visualiza la lista de recordatorios, las "Recomendaciones" y el "Plan de cuidados" detallado
    And al final de la pantalla, se muestra una tarjeta para <tarjeta_receta> con un botón de <boton_receta>.

    Examples: Variables de salida
      | tarjeta_receta               | boton_receta      |
      | "Genera una receta digital"  | "Generar receta"  |