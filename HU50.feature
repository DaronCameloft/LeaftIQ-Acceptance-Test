Feature: Gestionar la seguridad de acceso a mi cuenta
  Como agricultor usuario de LeafIQ,
  Quiero gestionar las opciones de seguridad de mi cuenta, como la autenticación biométrica, la verificación en dos pasos (2FA) y el cambio de contraseña,
  Para proteger mi información y sentir que mis datos personales están seguros.

  Scenario Outline: Visualizar las opciones de seguridad de la cuenta
    Given que el usuario ha navegado a la pantalla "Cuenta y Seguridad"
    When el usuario visualiza la pantalla
    Then el sistema muestra una sección para gestionar métodos de autenticación con interruptores (<metodo_auth_1>, <metodo_auth_2>, <metodo_auth_3>, <metodo_auth_4>)
    And el sistema muestra opciones navegables para <opcion_nav_1> y <opcion_nav_2>
    And el sistema muestra opciones navegables para <opcion_nav_3> y <opcion_nav_4>, cada una con una <descripcion_3> y <descripcion_4> de la acción.

    Examples: Variables de salida
      | metodo_auth_1 | metodo_auth_2   | metodo_auth_3      | metodo_auth_4         | opcion_nav_1         | opcion_nav_2              | opcion_nav_3        | descripcion_3                                                                  | opcion_nav_4      | descripcion_4                                                            |
      | "Rostro ID"   | "Biometria ID"  | "Autenticador SMS" | "Autenticador Google" | "Cambiar contraseña" | "Gestión de Dispositivos" | "Desactivar Cuenta" | "Desactiva tu cuenta temporalmente. Reactívala fácilmente cuando estés listo." | "Eliminar Cuenta" | "Elimina permanentemente tu cuenta y tus datos. Procede con precaución." |