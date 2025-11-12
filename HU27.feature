Feature: Alertas de plagas en la zona
  Como productor,
  Quiero ser notificado cuando se detecten brotes de plagas en mi región,
  Para aplicar medidas preventivas y evitar que afecten a mis cultivos.

  Scenario Outline: Escenario 1: Visualizar el detalle de una alerta de plaga
    Given que el usuario se encuentra en la pantalla "Notificaciones" en la pestaña "Sistema"
    When el usuario presiona sobre la notificación de "Alerta de plaga cercana"
    Then el sistema carga la pantalla "Alerta de plaga" con la <informacion_detallada> del brote reportado
    And el usuario visualiza un resumen del evento que incluye la <fuente> de la información, <zona> del brote, <nivel_riesgo>, <cultivos_en_riesgo>, <que_observar_hoy>, <accion_recomendada_hoy>, <plan_seguimiento>
    And el usuario visualiza una sección de <imagen_referencia>.

    Examples: Variables de salida
      | informacion_detallada                                                                                      | fuente                             | zona                      | nivel_riesgo | cultivos_en_riesgo                                  | que_observar_hoy                                                                                                       | accion_recomendada_hoy                                                                                                 | plan_seguimiento                                                                                                                                   | imagen_referencia      |
      | "Se reporta un brote en tu zona. Revisa hoy las axilas y el envés de tus plantas y mantén en observación." | "Red aliada de monitoreo agrícola" | "Tu distrito configurado" | "Medio–Alto" | "suculentas ( Aeonium, Echeveria), tomate, lechuga" | "Busca manchas blancas algodonosas en axilas y nervaduras, melaza pegajosa sobre hojas o maceta y hormigas asociadas." | "Aisla plantas sospechosas, limpia focos con hisopo + alcohol 70%, mejora ventilación y evita fertilizar esta semana." | "Repite inspección y tratamiento con aceite de neem 2% o jabón potásico a los 7 y 14 días. Si la infestación persiste, poda partes muy afectadas." | "Imagen de referencia" |