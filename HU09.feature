Feature: Revisar el historial de diagnósticos
  Como agricultor,
  Quiero ver un historial de todos los diagnósticos que he realizado,
  Para poder organizar mis revisiones y hacer seguimiento al estado de mis plantas a lo largo del tiempo.

  Scenario Outline: Visualizar la lista de diagnósticos históricos
    Given el usuario ha realizado diagnósticos previamente.
    When el usuario accede a la pantalla "Historial de diagnóstico"
    Then el sistema muestra una lista de todos los diagnósticos realizados, organizados cronológicamente
    And la lista está agrupada por <grupo_fecha>
    And cada entrada del historial muestra la <imagen_planta_diagnosticada>, su <nombre_planta> y una <descripcion_planta>
    And cada entrada indica claramente el resultado del diagnóstico con un <icono_resultado> y <texto_resultado>
    And el usuario puede presionar sobre cualquier entrada para ver el detalle de ese diagnóstico.

    Examples: Variables de salida
      | grupo_fecha         | imagen_planta_diagnosticada | nombre_planta         | descripcion_planta                                                                    | icono_resultado     | texto_resultado       |
      | Hoy, Oct 18, 2025   | (Imagen de Aeonium)         | Aeonium arboreum      | Suculenta arborescente de las Islas Canarias, con tallos delgados y rosetas carnos... | (Icono check verde) | Planta en buen estado |
      | Hoy, Oct 18, 2025   | (Imagen de Campanula)       | Campanula             | Planta ornamental muy popular, conocida por su floración en forma de 'ca...           | (Icono check verde) | Planta en buen estado |
      | Ayer, Oct 17, 2025  | (Imagen de Anthurium)       | Anthurium andraeanum  | Planta tropical de interior muy apreciada por sus flores (espatas) grandes y...       | (Icono alerta rojo) | Planta en mal estado  |
      | Ayer, Oct 17, 2025  | (Imagen de Musa)            | Musa spp              | Planta tropical, herbácea gigante, reconocida por su tronco robusto (pseudotal...     | (Icono alerta rojo) | Planta en mal estado  |
      | Oct 16, 2025        | (Imagen de Olea)            | Olea europaea         | Árbol perenne de origen mediterráneo, muy longevo y resistente. Se caracteriz...      | (Icono check verde) | Planta en buen estado |