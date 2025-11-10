Feature: Seguimiento de impacto sostenible
  Como usuario que aplica prácticas sostenibles,
  Quiero poder ver un resumen de mi impacto sostenible con métricas cuantificadas,
  Para entender el beneficio real de mis acciones y motivarme a continuar mejorando mis prácticas ecológicas.

  Scenario Outline: Visualizar el resumen de impacto sostenible
    Given que el usuario se encuentra en la pantalla "Sostenibilidad"
    When el usuario presiona la opción "Mi impacto Sostenible"
    Then el sistema carga la pantalla "Mi Impacto Sostenible"
    And el usuario visualiza un resumen de su periodo y una lista de métricas cuantificadas, como, <titulo_metrica>, y el progreso de <titulo_progreso>.

    Examples: Variables de salida
      | titulo_metrica                                | titulo_progreso                |
      | "Kilos de residuos orgánicos compostados"     | ""                             |
      | "Litros de agua ahorrada"                     | ""                             |
      | "Residuos plásticos evitados por el usuario"  | ""                             |
      | "Energía limpia usada en bombeo"              | ""                             |
      | ""                                            | "Buenas prácticas completadas" |