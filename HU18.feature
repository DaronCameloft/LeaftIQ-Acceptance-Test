Feature: Lista de guías rápidas
  Como agricultor principiante,
  Quiero una lista de guías rápidas para obtener los conocimientos básicos que se pueden aplicar de manera general a la mayoría de plantas,
  Para sentir a la aplicación como una herramienta de ayuda y aprendizaje.

  Scenario Outline: Carga y visualización de la lista de guías rápidas sobre plantas
    Given que el usuario se encuentra en la pantalla principal de la aplicación
    When el usuario presiona la opción para ver las "Guías rápidas"
    Then el sistema carga la pantalla "Guías rápidas" y el usuario visualiza la pestaña <pestana_seleccionada> seleccionada por defecto
    And una lista de guías generales, cada una con su <titulo_guia>, <descripcion_guia> e <imagen>.

    Examples: Variables de entrada
      | pestana_seleccionada |
      | "Plantas"            |

  Examples: Variables de salida
      | titulo_guia         | descripcion_guia                                                              | imagen                         |
      | "Preparar cultivo"  | "Mezcla drenante, maceta adecuada y primer riego. Listo para empezar."        | (Imagen de preparar cultivo)   |
      | "Cambio de maceta"  | "Cuándo trasplantar, cómo descompactar raíces y replantar sin estrés."        | (Imagen de cambio de maceta)   |
      | "Riego seguro"      | "Método "empapar y drenar", prueba del sustrato seco y frecuencias..."        | (Imagen de riego seguro)       |
      | "Luz y ubicación"   | "Dónde ponerlo para rosetas compactas: sol filtrado, ventilación y rotación." | (Imagen de luz y ubicación)    |