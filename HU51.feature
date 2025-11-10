Feature: Revisar y reintentar la sincronización de datos pendientes
  Como agricultor rural con conexión intermitente,
  Quiero ver una lista de todos los datos que no se han podido subir a la nube,
  Para poder forzar un reintento de sincronización cuando recupere la conexión.

  Scenario Outline: Escenario 1: Visualizar y reintentar la subida de datos pendientes
    Given el usuario ha realizado acciones (como crear una nota, un diagnóstico o solicitar una guía) mientras estaba sin conexión o con una conexión inestable
    When el usuario navega a la pantalla "Datos Pendientes"
    Then el sistema muestra una lista de todos los ítems pendientes de subir a la nube
    And cada ítem muestra su <tipo>, una <descripcion> y un <icono_estado> de "pendiente de subida" (nube con flecha hacia arriba)
    And el usuario ve un botón flotante para <boton_sincronizar> (ícono de recarga) en la esquina inferior
    And al presionar el botón de <boton_sincronizar>, el sistema intenta subir todos los ítems pendientes a la nube.

    Examples: Variables de salida
      | tipo          | descripcion                    | icono_estado                   | boton_sincronizar  |
      | "Nota #2"     | "La planta murió"              | (nube con flecha hacia arriba) | (ícono de recarga) |
      | "Descarga"    | "Guia de cuidado para tomates" | (nube con flecha hacia arriba) | (ícono de recarga) |
      | "Resultados"  | "Diagnóstico de Lechuga"       | (nube con flecha hacia arriba) | (ícono de recarga) |