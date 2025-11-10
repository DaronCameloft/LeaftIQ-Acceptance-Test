Feature: Añadir y gestionar métodos de pago
  Como usuario de LeafIQ,
  Quiero poder añadir nuevos métodos de pago y ver los que ya tengo registrados,
  Para facilitar la gestión de mi suscripción y asegurar que los pagos se realicen sin problemas.

  Scenario Outline: Escenario 1: Visualizar los métodos de pago existentes
    Given el usuario ha navegado a la pantalla "Métodos de pago"
    When el usuario tiene métodos de pago registrados
    Then el sistema muestra una lista de los métodos de pago, indicando el tipo de tarjeta, los <detalles_metodo> de la tarjeta o el <nombre_servicio>
    And cada método de pago muestra un <icono_verificacion>, indicando que está activo o validado
    And se visualiza un botón <boton_añadir> en la parte inferior de la pantalla.

    Examples: Variables de salida
      | detalles_metodo       | nombre_servicio | icono_verificacion      | boton_añadir                   |
      | "•••• •••• •••• 4537" | "Mastercard"    | (Icono de verificación) | "Añadir nuevo método de pago"  |
      | "•••• •••• •••• 5567" | "VISA"          | (Icono de verificación) | "Añadir nuevo método de pago"  |
      | ""                    | "Google Pay"    | (Icono de verificación) | "Añadir nuevo método de pago"  |
      | ""                    | "PayPal"        | (Icono de verificación) | "Añadir nuevo método de pago"  |
      | ""                    | "Apple Pay"     | (Icono de verificación) | "Añadir nuevo método de pago"  |

  Scenario Outline: Añadir un nuevo método de pago (Tarjeta de Crédito/Débito)
    Given el usuario se encuentra en la pantalla "Métodos de pago"
    When el usuario presiona el botón <boton_añadir>
    Then el sistema presenta una pantalla titulada "Nuevo método de pago"
    And se visualizan campos para <campo_numero>, <campo_dueño>, <campo_vencimiento> (con selector de mes/año) y <campo_cvv>
    And se muestran los logos de los <titulo_logos>
    And el usuario puede ingresar los datos de su tarjeta
    And se muestra un botón <boton_guardar> para confirmar la adición.

    Examples: Variables de entrada
      | boton_añadir                   |
      | "Añadir nuevo método de pago"  |

    Examples: Variables de salida
      | campo_numero        | campo_dueño           | campo_vencimiento | campo_cvv | titulo_logos      | boton_guardar |
      | "Número de tarjeta" | "Dueño de la tarjeta" | "Vencimiento"     | "CVV"     | "Pagos admitidos" | "Guardar"     |

  Scenario Outline: Visualizar el nuevo método de pago añadido
    Given el usuario ha ingresado correctamente los datos del nuevo método de pago en la pantalla "Nuevo método de pago"
    When el usuario presiona el botón <boton_guardar>
    Then el sistema regresa a la pantalla "Métodos de pago"
    And el nuevo método de pago <detalles_nuevo_metodo> aparece ahora en la lista de métodos de pago, con su correspondiente <icono_verificacion>.

    Examples: Variables de entrada
      | boton_guardar |
      | "Guardar"     |

    Examples: Variables de salida
      | detalles_nuevo_metodo | icono_verificacion      |
      | "•••• •••• •••• 8794" | (Icono de verificación) |