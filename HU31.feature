Feature: Creación de campaña
  Como productor,
  Quiero guardar los resultados de mis campañas (rendimiento, calidad de cosecha),
  Para comparar con años anteriores y evaluar si mis prácticas fueron efectivas.

  Scenario Outline: Registrar una nueva campaña exitosamente
    Given que el usuario se encuentra en la pantalla "Bitácora" y ha seleccionado la opción "Registrar resultado de campaña"
    When el sistema carga la pantalla "Campaña"
    Then el usuario visualiza la sección <seccion_datos> con los campos <campo_1>, <campo_2>, <campo_3>, <campo_4>, <campo_5>
    And segmentos de <segmento_1>, <segmento_2>, <segmento_3>, <segmento_4>, <segmento_5>, <segmento_6>, <segmento_7>
    And los botones de <boton_cancelar> y <boton_guardar>.

    Examples: Variables de salida
      | seccion_datos       | campo_1    | campo_2    | campo_3   | campo_4            | campo_5            | segmento_1    | segmento_2 | segmento_3        | segmento_4          | segmento_5   | segmento_6                 | segmento_7   | boton_cancelar | boton_guardar |
      | "Datos del cultivo" | "Cultivo"  | "Variedad" | "Parcela" | "Fecha de siembra" | "Fecha de cosecha" | "Rendimiento" | "Calidad"  | "Sanidad & clima" | "Insumos & labores" | "Económicos" | "Ubicación & trazabilidad" | "Evidencias" | "Cancelar"     | "Guardar"     |