Feature: Calculadora de Agua
  Como usuario,
  Quiero utilizar una calculadora de agua para mis plantas, seleccionando el tipo de planta y las condiciones ambientales,
  Para obtener una recomendación de riego precisa y mantener mis plantas saludables.

  Scenario Outline: Acceder a la Calculadora de Agua
    Given el usuario se encuentra en la pantalla principal de la aplicación
    When presiona la tarjeta de "Calculadora de Agua" dentro de la sección "Herramientas"
    Then es redirigido a la pantalla de la "Calculadora de Agua"
    And la pantalla muestra el título <titulo> y el campo <campo_planta>.

    Examples: Variables de salida
      | titulo                             | campo_planta                       |
      | "¿Cuánta agua necesita tu planta?" | "Mi Planta: Selecciona una planta" |

  Scenario Outline: Seleccionar una planta de la lista
    Given el usuario está en la pantalla de "Calculadora de Agua"
    When presiona el campo <campo_planta>
    Then se despliega una lista de plantas guardadas o sugeridas
    And el usuario puede seleccionar una planta, como <nombre_planta>.

    Examples: Variables de entrada
      | campo_planta                       |
      | "Mi Planta: Selecciona una planta" |

    Examples: Variables de salida
      | nombre_planta | nombre_cientifico      |
      | "Suculenta"   | "Aeonium arboreum"     |
      | "Tomate"      | "Solanum lycopersicum" |
      | "Lechuga"     | "Lactuca sativa"       |

  Scenario Outline: Obtener recomendación de riego para una planta
    Given el usuario ha seleccionado una planta, por ejemplo <planta_seleccionada>.
    When interactúa con el deslizador para indicar el nivel de humedad de la tierra (<nivel_min> a <nivel_max>).
    And selecciona la <temperatura> ambiental actual
    And escoge la <epoca> del año
    And presiona el botón <boton_calcular>
    Then el sistema muestra una <recomendacion> y un <detalle> explicativo.

    Examples: Variables de entrada
      | planta_seleccionada            | nivel_min | nivel_max | temperatura | epoca       | boton_calcular  |
      | "Suculenta (Aeonium arboreum)" | "Seco"    | "Húmedo"  | "17 °C"     | "Primavera" | "Calcular agua" |

    Examples: Variables de salida
      | recomendacion     | detalle                                                                                                                                                                                                    |
      | "Muy poca o Nula" | "El riego debe ser mínimo para evitar la pudrición de la raíz. Simplemente humedece un poco la superficie si las hojas se ven arrugadas, pero generalmente no necesita riego activo durante este período." |