Feature: Identificación de planta mediante escaneo
  Como usuario,
  Quiero identificar plantas escaneándolas con la cámara o seleccionando una imagen de mi galería,
  Para obtener información detallada sobre ellas.

  Scenario Outline: Iniciar proceso de identificación
    Given el usuario se encuentra en la pantalla principal de la aplicación
    When presiona el ícono de la cámara en la barra de navegación inferior
    Then el sistema activa la cámara y muestra una interfaz de "Identificar planta" con un recuadro de escaneo
    And en la parte inferior, se presentan las opciones <opcion_principal> (botón principal), <opcion_ia> y un <icono_galeria> para acceder a la galería
    And en la barra superior se visualiza un <icono_diagnostico> para cambiar a la cámara de diagnóstico.

    Examples: Variables de salida
      | opcion_principal     | opcion_ia       | icono_galeria      | icono_diagnostico |
      | "Identificar planta" | "Pregunta a IA" | "icono de galería" | "icono de corazón"  |

  Scenario Outline: Identificación de planta sin éxito
    Given el usuario ha tomado una foto o seleccionado una imagen que no puede ser identificada.
    When el sistema procesa la imagen.
    Then se muestra una pantalla con el mensaje <mensaje_titulo> y <mensaje_detalle>.
    And se sugiere <sugerencia> y se presenta un botón <boton_reintentar>.

    Examples: Variables de salida
      | mensaje_titulo  | mensaje_detalle                    | sugerencia                                           | boton_reintentar    |
      | "¡Lo sentimos!" | "No podemos identificar tu planta" | "Intenta la foto de nuevo desde un ángulo diferente" | "Intentar de nuevo" |

  Scenario Outline: Identificación de planta exitosa y visualización de información
    Given el usuario ha tomado una foto o seleccionado una imagen de una planta
    When el sistema la identifica correctamente
    Then se muestra una pantalla detallada con el <nombre_planta>, su imagen principal y <origen>, <habito>, <floracion>
    And el usuario puede ver una <seccion_galeria>, una <seccion_descripcion> y una <seccion_distribucion> geográfica de la planta.
    And se muestra un <icono_ojo> para ver la galería de imágenes de la planta y otro <boton_agregar_jardin> para agregarlo a “Mi jardín”
    And visualiza secciones adicionales como "Condiciones" (<temperatura>, <luz_solar>, <riego>), <seccion_plagas>, <seccion_caracteristicas>, <seccion_usos> y <seccion_dato_curioso>.
    And se muestra un mensaje para <chat_titulo> si tiene más dudas, con un botón para iniciar una conversación con el <chat_boton>
    And al final, un botón <boton_anadir_final> permite guardar la planta.

    Examples: Variables de salida
      | nombre_planta      | origen                    | habito                        | floracion             | seccion_galeria    | seccion_descripcion | seccion_distribucion | icono_ojo      | boton_agregar_jardin | temperatura  | luz_solar | riego            | seccion_plagas   | seccion_caracteristicas      | seccion_usos | seccion_dato_curioso | chat_titulo            | chat_boton           | boton_anadir_final   |
      | "Aeonium arboreum" | "Origen: Islas Canarias." | "Hábito: 0.5–1.5 m exterior." | "Floracion: amarilla" | "Galería de fotos" | "Descripcion"       | "Distribucion"       | "icono de ojo" | "icono de planta"    | "20 - 38 °C" | "Directo" | "Cada 3 semanas" | "Plagas comunes" | "Características especiales" | "Usos"       | "Dato curioso"       | "Habla con un experto" | "Hablar con experto" | "Añadir a mi jardín" |