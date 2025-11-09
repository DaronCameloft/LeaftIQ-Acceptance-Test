Feature: Problema exacto de la planta
  Como usuario,
  Quiero detectar cual es el problema que presenta mi planta y que debo hacer para solucionarlo,
  Para evitar la pérdida de mi planta.

  Scenario Outline: Problema encontrado
    Given el usuario se encuentra en la pantalla de “Detalle de planta”, con un diagnóstico <estado_diagnostico>
    When presiona en uno de los botones de los problemas identificadas
    Then redirige al usuario a la pantalla de “Problema encontrado”
    And el usuario visualiza el <nombre_planta>, <datos_origen>, <datos_habito>, <datos_floracion>
    And un botón con <icono_ver_fotos_planta> para visualizar más fotos de la planta, y otro con <icono_agregar_jardin> para agregarlo a “Mi jardín”.
    And presenta el <nombre_problema>, un <icono_ver_imagen_problema>
    And una <descripcion_problema> con la indicación necesaria de “<indicacion_accion_inmediata>”.
    And una <imagen_referencia_problema>

    Examples: Variables de entrada
      | estado_diagnostico |
      | negativo           |

    Examples: Variables de salida
      | nombre_planta    | datos_origen           | datos_habito                | datos_floracion     | icono_ver_fotos_planta | icono_agregar_jardin | nombre_problema | icono_ver_imagen_problema                                | descripcion_problema                                   | indicacion_accion_inmediata | imagen_referencia_problema   |
      | Aeonium arboreum | Origen: Islas Canarias | Hábito: 0.8-1.5 m exterior. | Floración: amarilla | icono de ojo           | icono planta         | Exceso de riego | icono de visualización de imagen referencial de problema | Exceso de riego / riesgo de pudrición (Alta prioridad) | Acción inmediata            | (Imagen de planta infectada) |