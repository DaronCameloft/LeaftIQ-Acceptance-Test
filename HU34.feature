Feature: Autenticación mediante redes sociales
  Como usuario,
  Quiero poder usar mi cuenta de Google, Apple, Facebook o Linkedin e iniciar sesión,
  Para acceder a la aplicación de forma inmediata sin tener que crear y recordar una nueva contraseña.

  Scenario Outline: Visualizar opciones e iniciar sesión exitosamente con una cuenta social
    Given que el usuario se encuentra en la pantalla "¡Comencemos!"
    When el sistema cargue todas las opciones
    Then el usuario visualiza opciones de autenticación para inicio de sesión, como <opcion_google>, <opcion_apple>, <opcion_facebook>, <opcion_linkedin>
    And los botones de <boton_crear> e <boton_iniciar>
    And botones como texto en la parte inferior de <link_privacidad>, y <link_terminos>.

    Examples: Variables de salida
      | opcion_google           | opcion_apple             | opcion_facebook           | opcion_linkedin           | boton_crear     | boton_iniciar    | link_privacidad           | link_terminos            |
      | "Continuar con Google"  | "Continuar con Iphone"   | "Continuar con Facebook"  | "Continuar con Linkedin"  | "Crear cuenta"  | "Iniciar sesion" | "Política de privacidad"  | "Términos y condiciones" |