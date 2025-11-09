Feature: Inicio de sesión y recuperación de cuenta
  Como usuario registrado,
  Quiero iniciar sesión con mi correo y contraseña o recuperar mi acceso si la he olvidado,
  Para poder acceder a mi perfil y gestionar mis cultivos de forma segura.

    Scenario Outline: Carga de la pantalla de inicio de sesión
      Given que el usuario se encuentra en la pantalla "¡Comencemos!"
      When el usuario presiona el botón <boton_iniciar_sesion>
      Then visualiza la pantalla "¡Bienvenido!" con los campos <campo_email> y <campo_pass>.
      And se muestran las opciones de inicio de sesión social, la casilla <checkbox_recordar>, el enlace <link_olvidada> y el botón <boton_iniciar_submit>.

      Examples: Variables de entrada
        | boton_iniciar_sesion |
        | "Iniciar sesion"     |

      Examples: Variables de salida
        | campo_email | campo_pass   | checkbox_recordar | link_olvidada           | boton_iniciar_submit |
        | "Email"     | "Contraseña" | "Recuérdame"      | "¿Contraseña olvidada?" | "Iniciar sesion"     |

    Scenario Outline: Inicio de sesión exitoso con credenciales recordadas
      Given el usuario se encuentra en la pantalla de "¡Bienvenido!" y previamente ha marcado <checkbox_recordar>.
      When sus credenciales <email> y <pass> ya están cargadas en los campos correspondientes.
      And presiona el botón <boton_iniciar_submit>.
      And validar las credenciales, visualiza la pantalla de confirmación "¡Bienvenido a LeafIQ!"
      And visualiza un mensaje de confirmación que dice <mensaje_confirmacion>
      And le pregunta <pregunta_accion>, presentando las opciones <opcion_1>
      And <opcion_2> mediante botones.

      Examples: Variables de entrada
        | checkbox_recordar | email                   | pass       | boton_iniciar_submit |
        | "Recuérdame"      | "U202416274@upc.edu.pe" | "********" | "Iniciar sesion"     |

      Examples: Variables de salida
        | mensaje_confirmacion  | pregunta_accion               | opcion_1      | opcion_2              |
        | "Tu jardin te espera" | "¿Que quieres hacer primero?" | "Ver jardin"  | "Pantalla principal"  |

    Scenario Outline: Recuperación de cuenta por contraseña olvidada
      Given un usuario se encuentra en la pantalla de "¡Bienvenido!" y no recuerda su contraseña.
      When presiona el enlace <link_olvidada>.
      Then es redirigido a la pantalla para ingresar su email y solicitar un código de verificación.
      And tras ingresar el código correctamente, el sistema lo lleva a la pantalla "Cambio de contraseña".
      And al establecer una nueva contraseña, visualiza la pantalla de confirmación "¡Bienvenido a LeafIQ!"
      And visualiza un mensaje de confirmación que dice <mensaje_confirmacion>
      And le pregunta <pregunta_accion>, presentando las opciones <opcion_1>
      And <opcion_2> mediante botones.

      Examples: Variables de entrada
        | link_olvidada           |
        | "¿Contraseña olvidada?" |

      Examples: Variables de salida
        | mensaje_confirmacion                        | pregunta_accion               | opcion_1      | opcion_2              |
        | "La clave de tu jardín ha sido actualizada" | "¿Que quieres hacer primero?" | "Ver jardin"  | "Pantalla principal"  |