Feature: Alertas climáticas anticipadas
  Como productor,
  Quiero recibir notificaciones sobre eventos climáticos extremos (heladas, sequías, lluvias intensas),
  Para tomar precauciones y proteger mis cultivos antes de que ocurra el riesgo.

  Scenario Outline: Escenario 1: Visualizar el detalle de una alerta climática
    Given que el usuario se encuentra en la pantalla "Notificaciones" en la pestaña "Climáticas"
    When el usuario presiona sobre una notificación
    Then el sistema carga la pantalla con el <titulo_alerta> y <descripcion_alerta> del evento
    And el usuario visualiza un resumen del evento que incluye, <zona>, <ventana> de tiempo, <nivel_riesgo>, <cultivos_sensibles>, <recomendacion_inmediata>
    And el usuario visualiza los botones de acción <boton_guia> y <boton_recordatorio>.

    Examples: Variables de salida
      | titulo_alerta      | descripcion_alerta                                                                         | zona                           | ventana                                 | nivel_riesgo        | cultivos_sensibles                  | recomendacion_inmediata                                                                         | boton_guia               | boton_recordatorio                              |
      | "Alerta de helada" | "Se esperan bajas temperaturas en tu zona en las próximas 48 horas. Protege tus cultivos." | "Tu distrito/área configurada" | "Hoy 22:00 – Mañana 08:00 (próx. 48 h)" | "Alto (color rojo)" | "Aeonium exterior, tomate, lechuga" | "Entra macetas o cúbrelas con manta térmica; riega por la mañana, nunca de noche; evita podas." | "Ver guía de protección" | "Crear recordatorio: mover macetas a las 20:00" |