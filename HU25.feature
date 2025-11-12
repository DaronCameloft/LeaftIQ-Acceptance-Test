Feature: Notificaciones sistemáticas y climáticas
  Como agricultor rural,
  Quiero recibir notificaciones que me informen de mi entorno y acerca de mi cuenta,
  Para estar alerta e informado.

  Scenario Outline: Visualización de notificaciones del sistema
    Given el usuario se encuentra en la pantalla principal de la aplicación
    When el usuario presiona el icono de "Notificaciones"
    Then el sistema carga la pantalla "Notificaciones" con la pestaña <pestana_seleccionada> seleccionada por defecto
    And el usuario visualiza una lista de notificaciones relevantes a su cuenta y actividad, como <nombre>,
    And <descripcion>. Cada una con un <icono> y <fecha>.

    Examples: Variables de entrada
      | pestana_seleccionada |
      | "Sistema"            |

    Examples: Variables de salida
      | icono                | nombre                                                    | descripcion                                                                                                | fecha          |
      | (Icono de bicho)     | "Alerta de plaga cercana — Cochinilla algodonosa"         | "Se reporta un brote en tu zona. Revisa hoy las axilas y el envés de tus plantas y mantén en observación." | "09:41 AM"     |
      | (Icono de candado)   | "Seguridad de cuenta"                                     | "Nuevo inicio de sesión desde un dispositivo distinto. Verifica si fuiste tú."                             | "Ayer · 09:03" |
      | (Icono de estrella)  | "Novedad: Modo verano"                                    | "Activa reglas de reposo para suculentas con un toque"                                                     | "Dom · 10:26"  |
      | (Icono de escudo)    | "Tu jardín se respaldó en la nube"                        | "Guardamos fotos y notas para evitar pérdidas."                                                            | "Dom · 21:57"  |

  Scenario Outline: Visualización de notificaciones climáticas
    Given el usuario se encuentra en la pantalla "Notificaciones"
    When el usuario presiona la pestaña <pestana_seleccionada>
    Then el sistema muestra la lista de notificaciones relacionadas con el clima
    And el usuario visualiza una lista de alertas relevantes para su zona, como, <nombre>,
    And <descripcion>. Cada una con un <icono> y <fecha>.

    Examples: Variables de entrada
      | pestana_seleccionada  |
      | "Climaticas"          |

    Examples: Variables de salida
      | icono                       | nombre                    | descripcion                                                                                          | fecha          |
      | (Icono de copo de nieve)    | "Alerta de Helada"        | "Se esperan bajas temperaturas en tu zona en las próximas 48 horas. Protege tus cultivos."           | "09:41 AM"     |
      | (Icono de llama)            | "Alerta de Ola de Calor"  | "Temperaturas muy altas previstas en las próximas 24-72 h. Hidrata y sombrea tus plantas."           | "Ayer · 09:03" |
      | (Icono de nube con lluvia)  | "Lluvia Intensa"          | "Acumulados altos en 24-48 h. Asegura drenaje y eleva macetas."                                      | "Dom · 10:26"  |
      | (Icono de viento)           | "Viento Fuerte"           | "Rachas >60 km/h previstas. Fija tutores y mueve macetas pesadas."                                   | "Dom · 21:57"  |