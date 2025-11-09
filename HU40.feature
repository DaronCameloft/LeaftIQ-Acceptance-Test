Feature: Visualizar y gestionar la suscripción LeafIQ Pro
  Como usuario de LeafIQ,
  Quiero ver los detalles de mi suscripción actual (LeafIQ Pro), sus beneficios, el costo anual y el método de pago asociado,
  Para entender qué estoy recibiendo y cómo se está facturando.

  Scenario Outline: Visualizar los detalles de la suscripción activa
    Given el usuario ha accedido a la pantalla "Facturación & Suscripciones"
    When la suscripción <nombre_plan> está activa
    Then el sistema muestra prominentemente el nombre <nombre_plan> con su logo
    And se visualiza el <precio_anual> de la suscripción y un <indicador_ahorro>
    And se lista el <beneficio> incluido en el plan <nombre_plan>
    And se visualiza el <titulo_metodo_pago>, mostrando los <detalles_tarjeta>
    And se indica la <fecha_expiracion> de la suscripción y un enlace para <link_renovacion>.

    Examples: Variables de entrada
      | nombre_plan   |
      | "LeafIQ Pro"  |

    Examples: Variables de salida
      | precio_anual       | indicador_ahorro | beneficio                                     | titulo_metodo_pago            | detalles_tarjeta              | fecha_expiracion                                     | link_renovacion |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Sin publicidad"                              | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Diagnósticos por imagen ilimitados"          | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Plan de cuidado personalizado con IA"        | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Zonas de clima y alertas ilimitadas"         | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Reportes de ahorro de agua e insumos"        | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Exportación de \"Mi Impacto Sostenible\""    | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "Analíticas avanzadas"                        | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |
      | "S/. 360.00 /año"  | "Ahorras 30%"    | "20% de descuento en proveedores aliados"     | "Metodo de pago seleccionado" | "VISA •••• •••• •••• 5567"    | "Tu suscripción expirará el 20 de octubre de 2026." | "aquí"          |