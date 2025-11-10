Feature: Lista de artículos
  Como agricultor principiante,
  Quiero una lista de artículos informativos,
  Para mantenerme informado constantemente sobre información sobre procesos y el impacto de LeafIQ en otros usuarios.

  Scenario Outline: Visualización de la sección de artículos
    Given el usuario se encuentra en la pantalla "Guías rápidas"
    When presiona la pestaña <pestana>
    Then el sistema actualiza la lista para mostrar los artículos disponibles
    And cada artículo se presenta con una <imagen_destacada> y una <descripcion_articulo>.

    Examples: Variables de entrada
      | pestana    |
      | "Artículos" |

    Examples: Variables de salida
      | imagen_destacada                                  | descripcion_articulo                                                |
      | (Imagen de herramienta en tierra de cultivo)      | "Descubre como preparar un cultivo: trucos, preparación y cuidados" |
      | (Imagen de huertos urbanos en cajas de madera)    | "Los huertos urbanos estan aumentando tras la aparicion de LeafIQ"  |
      | (Imagen de jardín en azotea con ciudad al fondo)  | "Descubre plantas para la azotea"                                   |