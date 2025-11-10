Feature: Preparación de cultivo adaptado
  Como agricultor,
  Quiero una guía con respecto a la preparación del cultivo, enseñada a través de vídeo, esta guía debe ser adaptada a mi entorno y que se pueda archivar y compartir,
  Para iniciar con buenos pasos la actividad.

  Scenario Outline: Visualización de la guía "Preparar cultivo"
    Given que el usuario se encuentra en la pantalla "Guías rápidas"
    When el usuario presiona sobre la guía <guia_titulo>
    Then el sistema carga la pantalla "Preparar cultivo" y el usuario visualiza un icono para <icono_compartir> y otro para <icono_archivar> la guía
    And una sección de vídeo titulada <video_titulo_1>
    And una sección de vídeo titulada <video_titulo_2>.

    Examples: Variables de entrada
      | guia_titulo         |
      | "Preparar cultivo"  |

    Examples: Variables de salida
      | icono_compartir | icono_archivar | video_titulo_1                           | video_titulo_2                             |
      | "Compartir"     | "Archivar"     | "Preparar cultivo para huertos urbanos"  | "Preparar cultivo para granjas o parcelas" |