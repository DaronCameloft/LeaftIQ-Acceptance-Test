Feature: Visualización y edición de perfil
  Como usuario registrado,
  Quiero poder ver y editar la información de mi perfil, como mi ubicación, género y fecha de nacimiento,
  Para mantener mis datos actualizados y permitir que la aplicación me ofrezca recomendaciones más personalizadas.

  Scenario Outline: Carga y visualización de la pantalla "Mi perfil"
    Given que el usuario se encuentra en la pantalla principal de la aplicación
    When el usuario presiona la opción para ver "Mi perfil"
    Then el sistema carga la pantalla "Mi perfil"
    And el usuario visualiza los campos de su perfil, como <campo_nombre> y <campo_email>; campos para añadir como <campo_telefono> y <campo_ubicacion>;
    And un selector para <selector_genero> y <campo_fecha_nacimiento>.

    Examples: Variables de salida
      | campo_nombre    | campo_email             | campo_telefono              | campo_ubicacion     | selector_genero | campo_fecha_nacimiento |
      | "DaronCameloft" | "U202416274@upc.edu.pe" | "Añadir número de teléfono" | "Añadir ubicación"  | "Indefinido"    | "06/12/2006"           |

  Scenario Outline: Editar y completar la información del perfil exitosamente
    Given que el usuario se encuentra en la pantalla "Mi perfil"
    When el usuario añade su <valor_telefono>, <valor_ubicacion> y selecciona su <valor_genero>
    And presiona un botón para guardar los cambios
    Then el sistema actualiza la información del perfil del usuario

    Examples: Variables de entrada
      | valor_telefono        | valor_ubicacion           | valor_genero |
      | "+51 933 855 712"     | "Yadara los palos, Tacna" | "Hombre"     |