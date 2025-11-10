Feature: Verificación de correo
  Como nuevo usuario que ha registrado una cuenta,
  Quiero que llegue un código de verificación al correo vinculado y se me solicite en la aplicación,
  Para evitar la usurpación.

  Scenario Outline: Carga de la pantalla de verificación de correo
    Given que el usuario acaba de registrar una nueva cuenta con su correo electrónico
    When el sistema lo redirige para verificar su correo
    Then el sistema carga la pantalla "Verifica tu correo"
    And el usuario visualiza los campos para ingresar un código OTP, y un botón de <boton_verificar> y “Un enlace para <link_reenviar>.

    Examples: Variables de salida
      | boton_verificar    | link_reenviar     |
      | "Verificar correo" | "Reenviar código" |

  Scenario Outline: Verificar el correo exitosamente
    Given que el usuario se encuentra en la pantalla "Verifica tu correo"
    When el usuario ingresa el <codigo_otp> correcto que recibió en su correo
    And presiona el botón <boton_verificar>
    Then el sistema valida el código y verifica la cuenta del usuario
    And lo redirige a la pantalla principal de la aplicación, habiendo iniciado sesión.

    Examples: Variables de entrada
      | codigo_otp | boton_verificar   |
      | "52671"    | "Verificar correo" |

  Scenario Outline: Visualización del estado de carga durante la creación de la cuenta
    Given que el usuario se encuentra en la pantalla "Verifica tu correo" y ha ingresado el código OTP
    When el usuario presiona el botón <boton_verificar>
    Then el sistema muestra un menú modal de carga
    And el usuario visualiza un indicador de progreso con el texto <texto_carga>.

    Examples: Variables de entrada
      | boton_verificar    |
      | "Verificar correo" |

    Examples: Variables de salida
      | texto_carga         |
      | "Creando cuenta..." |

  Scenario Outline: Carga de la pantalla de bienvenida post-registro
    Given que el sistema ha finalizado exitosamente la creación de la cuenta
    When el sistema redirige al usuario
    Then el sistema carga la pantalla de <titulo_pantalla>
    And el usuario visualiza un mensaje de confirmación que dice <mensaje_confirmacion>
    And le pregunta <pregunta_accion>, presentando las opciones <opcion_1>
    And <opcion_2> mediante botones.

    Examples: Variables de salida
      | titulo_pantalla         | mensaje_confirmacion     | pregunta_accion               | opcion_1      | opcion_2              |
      | "¡Bienvenido a LeafIQ!" | "Tu jardín se ha creado" | "¿Qué quieres hacer primero?" | "Ver perfil"  | "Pantalla principal"  |