Feature: Suscripción a LeafIQ Pro
  Como usuario,
  Quiero suscribirme a LeafIQ Pro, seleccionando un plan (mensual o anual) y un método de pago,
  Para desbloquear beneficios avanzados como diagnósticos ilimitados y analíticas.

  Scenario Outline: Seleccionar el plan mensual
    Given el usuario se encuentra en la pantalla "Mejorar Plan"
    When la pestaña <pestana> está seleccionada
    Then el sistema muestra el precio de <precio> y la lista de beneficios Pro
    And se muestra el botón <boton_suscripcion>.

    Examples: Variables de entrada
      | pestana    |
      | "Mensual"  |

    Examples: Variables de salida
      | precio          | boton_suscripcion           |
      | "S/. 45.00/mes" | "Suscribirme a LeafIQ Pro"  |

  Scenario Outline: Seleccionar el plan anual
    Given el usuario se encuentra en la pantalla "Mejorar Plan"
    When selecciona la pestaña <pestana>
    Then el sistema muestra el precio de <precio> y la etiqueta <etiqueta_ahorro>
    And se muestra el botón <boton_suscripcion>.

    Examples: Variables de entrada
      | pestana   |
      | "Anual"   |

    Examples: Variables de salida
      | precio            | etiqueta_ahorro | boton_suscripcion           |
      | "S/. 360.00/año"  | "Ahorras 30%"   | "Suscribirme a LeafIQ Pro"  |

  Scenario Outline: Seleccionar un método de pago
    Given el usuario ha presionado <boton_suscripcion> en la pantalla de selección de plan
    When es redirigido a la pantalla "Método de pago"
    Then puede ver una lista de métodos de pago disponibles (<metodo_1>, <metodo_2>, <metodo_3>) y seleccionar uno
    And al presionar <boton_continuar>, es llevado al resumen de la compra.

    Examples: Variables de entrada
      | boton_suscripcion           | boton_continuar |
      | "Suscribirme a LeafIQ Pro"  | "Continuar"     |

    Examples: Variables de salida
      | metodo_1     | metodo_2 | metodo_3     |
      | "Mastercard" | "Visa"   | "Google Pay" |

  Scenario Outline: Revisar y confirmar la compra
    Given el usuario ha seleccionado un plan y un método de pago
    When el sistema lo redirige a la pantalla "Resumen de compra"
    Then visualiza el plan seleccionado, el costo (<costo>), la lista de beneficios y el <metodo_seleccionado>
    And ve el botón <boton_suscripcion> para confirmar.

    Examples: Variables de salida
      | costo            | metodo_seleccionado         | boton_suscripcion           |
      | "S/. 360.00/año" | "VISA •••• •••• •••• 5567"  | "Suscribirme a LeafIQ Pro"  |

  Scenario Outline: Procesar el pago
    Given el usuario está en la pantalla "Resumen de compra"
    When presiona el botón <boton_suscripcion>
    Then el sistema muestra un modal de carga con un spinner y el texto <texto_carga>.

    Examples: Variables de entrada
      | boton_suscripcion           |
      | "Suscribirme a LeafIQ Pro"  |

    Examples: Variables de salida
      | texto_carga       |
      | "Procesando pago" |

  Scenario Outline: Confirmación de suscripción exitosa
    Given el pago ha sido procesado exitosamente
    When el sistema redirige al usuario
    Then se muestra la pantalla "¡Mejora Desbloqueada!" y el mensaje <mensaje_bienvenida>
    And se lista los <lista_beneficios> y se muestra un botón <boton_finalizar> para finalizar.

    Examples: Variables de salida
      | mensaje_bienvenida          | lista_beneficios            | boton_finalizar |
      | "¡Bienvenido a LeafIQ Pro!" | "Beneficios desbloqueados"  | "¡Genial!"      |