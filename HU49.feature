Feature: Acceso a Políticas de Privacidad y Términos de Servicio
  Como usuario preocupado por mi privacidad y mis derechos,
  Quiero poder acceder y leer fácilmente la Política de Privacidad y los Términos de Servicio,
  Para entender cómo se utilizarán mis datos, cuáles son mis derechos y cuáles son las reglas de uso de la aplicación.

  Scenario Outline: Acceder y visualizar la Política de Privacidad
    Given que el usuario se encuentra en la pantalla "Crear cuenta" o en la pantalla “Cuenta”
    When el usuario presiona el enlace de <enlace_politica>
    Then el sistema carga la pantalla "Política de Privacidad"
    And el usuario visualiza el texto del documento, incluyendo secciones como un <seccion_resumen> que explica qué datos se recopilan y la sección <seccion_quienes_somos>.

    Examples: Variables de entrada
      | enlace_politica           |
      | "Política de Privacidad"  |

    Examples: Variables de salida
      | seccion_resumen       | seccion_quienes_somos |
      | "1. Resumen (TL;DR)"  | "2. Quiénes somos"    |

  Scenario Outline: Acceder y visualizar los Términos de Servicio
    Given que el usuario se encuentra en la pantalla "Cuenta"
    When el usuario presiona el enlace de <enlace_terminos>
    Then el sistema carga la pantalla "Términos de Servicio"
    And el usuario visualiza el texto del documento, incluyendo secciones como, <seccion_quienes_somos>, <seccion_elegibilidad> y <seccion_licencia>.

    Examples: Variables de entrada
      | enlace_terminos        |
      | "Términos de Servicio" |

    Examples: Variables de salida
      | seccion_quienes_somos | seccion_elegibilidad        | seccion_licencia      |
      | "1. Quiénes somos"    | "2. Elegibilidad y cuenta"  | "3. Licencia de uso"  |