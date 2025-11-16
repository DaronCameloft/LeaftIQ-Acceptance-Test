Feature: Lista de actividades agrícolas
  Como usuario,
  Quiero anotar mis actividades diarias de cultivo (siembra, riego, fertilización, tratamientos) y resultados obtenidos durante una campaña,
  Para llevar un control ordenado y consultar lo que he realizado en cada jornada.

  Scenario Outline: Carga y visualización de la bitácora
    Given que el usuario se encuentra en la pantalla "Cuenta"
    When el usuario presiona la pestaña "Bitácora"
    Then el sistema carga la pantalla "Bitácora"
    And el usuario visualiza un icono de <icono_filtro>, un botón de <boton_anadir> ("+") y una lista cronológica de sus registros, como <titulo_registro> y <descripcion_registro>.

    Examples: Variables de salida
      | icono_filtro   | boton_anadir | titulo_registro     | descripcion_registro     |
      | (Icono Filtro) | "+"          | "Bitácora #006"   | "Para Aeonium arboreum"  |
      | (Icono Filtro) | "+"          | "Bitácora #005"   | "Para Tomates"           |
      | (Icono Filtro) | "+"          | "Bitácora #004"   | "Para Lechugas"          |
      | (Icono Filtro) | "+"          | "Bitácora #003"   | "Preparacion de tierra"  |
      | (Icono Filtro) | "+"          | "Bitácora #002"   | "Ideas de cultivo"       |
      | (Icono Filtro) | "+"          | "Bitácora #001"   | "Probando bitacoras"     |

  Scenario Outline: Abrir y visualizar las opciones de filtro
    Given que el usuario se encuentra en la pantalla "Bitácora"
    When el usuario presiona el icono de <icono_filtro>
    Then el sistema despliega en la parte superior las opciones para filtrar
    And el usuario visualiza un campo de <campo_busqueda> por texto, un campo para seleccionar <campo_fecha> y opciones para filtrar por <opcion_filtro_1> o <opcion_filtro_2>.

    Examples: Variables de entrada
      | icono_filtro   |
      | (Icono Filtro) |

    Examples: Variables de salida
      | campo_busqueda | campo_fecha | opcion_filtro_1 | opcion_filtro_2 |
      | "Buscar"       | "DD/MM/YY"  | "Campaña"       | "Planta"        |

  Scenario Outline: Aplicar un filtro y ver los resultados
    Given que el usuario se encuentra en la pantalla "Bitácora" con las opciones de filtro visibles
    When el usuario ingresa una <fecha> y selecciona el filtro por <opcion_filtro_1>
    Then el sistema actualiza la lista
    And muestra únicamente los registros que coinciden con los criterios del filtro, como <titulo_resultado> para la <fecha_resultado> seleccionada.

    Examples: Variables de entrada
      | fecha        | opcion_filtro_1 |
      | "01/10/2025" | "Campaña"       |

    Examples: Variables de salida
      | titulo_resultado          | fecha_resultado |
      | "Resultados de campaña"   | "01/10/2025"    |

  Scenario Outline: Abrir las opciones para añadir una nueva entrada
    Given que el usuario se encuentra en la pantalla "Bitácora"
    When el usuario presiona el botón de <boton_anadir> ("+")
    Then el sistema despliega un menú modal titulado <titulo_modal>
    And el usuario visualiza las opciones de <opcion_1> y <opcion_2>.

    Examples: Variables de entrada
      | boton_anadir |
      | "+"          |

    Examples: Variables de salida
      | titulo_modal        | opcion_1                         | opcion_2          |
      | "Añadir a bitácora" | "Registrar resultado de campaña" | "Añadir bitácora" |