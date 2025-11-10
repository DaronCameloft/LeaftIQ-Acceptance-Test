Feature: Selección de idioma
  Como usuario,
  Quiero poder seleccionar el idioma de la interfaz de la aplicación,
  Para poder usarla en mi lengua materna o de preferencia y así entender toda la información fácilmente.

  Scenario Outline: Acceder a la pantalla de "Accesibilidad"
    Given que el usuario se encuentra en la pantalla "Cuenta"
    When el usuario presiona la opción de "Accesibilidad"
    Then el sistema carga la pantalla "Accesibilidad"
    And el usuario visualiza las opciones de <opcion_1>
    And <opcion_2>.

    Examples: Variables de salida
      | opcion_1         | opcion_2        |
      | "Cambiar idioma" | "Accesibilidad" |

  Scenario Outline: Visualizar la lista de idiomas disponibles
    Given que el usuario se encuentra en la pantalla "Accesibilidad"
    When el usuario presiona la opción "Cambiar idioma"
    Then el sistema carga la pantalla "Cambiar idioma"
    And el usuario visualiza una lista de idiomas disponibles para la aplicación, como <idioma>.
    
    Examples: Variables de salida
      | idioma    |
      | "Español" |
      | "Quechua" |
      | "Inglés"  |
      | "Japones" |