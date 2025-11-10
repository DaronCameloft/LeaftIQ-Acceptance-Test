Feature: Creación de cuenta
  Como nuevo usuario,
  Quiero poder crear una cuenta ingresando mi nombre, correo electrónico y una contraseña, o crearla mediante redes sociales como "Facebook" y "Google",
  Para tener un perfil personal y seguro en la aplicación.

  Scenario Outline: Carga de la pantalla "Crear cuenta"
    Given que el usuario se encuentra en la pantalla "¡Comencemos!"
    When el usuario presiona el botón <boton_crear_principal>
    Then el sistema carga la pantalla "Crear cuenta"
    And el usuario visualiza opciones de registro con <opcion_social_1> y <opcion_social_2>, un formulario con los campos <campo_nombre>, <campo_email> y <campo_pass>, una casilla para aceptar los <link_terminos> y <link_privacidad>
    And el botón <boton_crear_submit>.
    And una opción para redirigir al <link_login>.

    Examples: Variables de entrada
      | boton_crear_principal |
      | "Crear cuenta"        |

    Examples: Variables de salida
      | opcion_social_1 | opcion_social_2 | campo_nombre | campo_email | campo_pass    | link_terminos            | link_privacidad          | boton_crear_submit | link_login      |
      | "Facebook"      | "Google"        | "Nombre"     | "Email"     | "Contraseña"  | "Terminos y condiciones" | "Politica de privacidad" | "Crear cuenta"     | "Inicia sesion" |

  Scenario Outline: Crear una cuenta exitosamente con correo y contraseña
    Given que el usuario se encuentra en la pantalla "Crear cuenta"
    When el usuario completa los campos <nombre>, <email> y <contraseña>
    And marca la casilla de <checkbox_terminos>
    And presiona el botón <boton_crear>
    Then el sistema crea la nueva cuenta y lo auténtica
    And lo redirige a la pantalla principal de la aplicación.

    Examples: Variables de entrada
      | nombre          | email                   | contraseña  | checkbox_terminos                      | boton_crear     |
      | "DaronCameloft" | "U202416274@upc.edu.pe" | "********"  | "Yo acepto los Terminos y condiciones" | "Crear cuenta"  |
