Feature: Diagnóstico, escaneo y detección de problemas
  Como agricultor,
  Quiero escanear mi planta mediante imágenes,
  Para que el sistema pueda detectar signos visibles de plagas o enfermedades de manera automática.

  Scenario: Intento de diagnóstico
    Given el usuario está en la pantalla “Diagnóstico”
    When presiona el botón "Diagnosticar"
    Then lo redirige a la pantalla para escanear una planta
    And presenta botones de “Escaneo de planta”, “Pregunta a IA” y de selección de galería
    And presenta un botón de salida.

  Scenario Outline: Diagnóstico exitoso con condición buena
    Given el usuario se encuentra en la pantalla para diagnosticar
    When presiona el botón Escaneo de planta
    And el sistema procesa la imagen <imagen>
    Then el sistema presenta en <tiempo_respuesta_sano> segundos una tarjeta en la pantalla con datos del <nombre_planta>, una <foto_referencial_resultado>, y una <breve_descripcion_resultado>
    And presenta una <etiqueta_condicion> con el texto <condicion_buena>, un <icono_info> y un <boton_redirigir_sano> a la descripción de la planta escaneada.

    Examples: Variables de entrada
      | imagen |
      | imagen_Aeonium_arboreum_sano.jpg |

    Examples: Variables de salida
      | tiempo_respuesta_sano | nombre_planta    | foto_referencial_resultado    | breve_descripcion_resultado                                                                                                                         | etiqueta_condicion  | condicion_buena | icono_info | boton_redirigir_sano                     |
      | 3                     | Aeonium arboreum | (Foto de la planta escaneada) | Suculenta arborescente de las Islas Canarias, prefiere sol filtrado a pleno sol, sustrato muy drenante y riegos espaciados, dejando secar el suelo. | Etiqueta de estado  | Buena           | Icono 'i'  | Flecha a descripción de planta escaneada |

  Scenario Outline: Diagnóstico exitoso con condición mala
    Given el usuario se encuentra en la pantalla para escanear una planta
    When presiona el botón Escaneo de planta
    And el sistema procesa la imagen <imagen>
    Then el sistema presenta en <tiempo_respuesta_mala> segundos una tarjeta en la pantalla con datos del <nombre_planta>, una <foto_referencial_resultado>, y una <breve_descripcion_resultado>
    And presenta una <etiqueta_condicion> con el texto <condicion_mala>, un <icono_info> y un <boton_redirigir_mala> al diagnóstico general.

    Examples: Variables de entrada
      | imagen |
      | imagen_Aeonium_arboreum_enfermo.jpg |

    Examples: Variables de salida
      | tiempo_respuesta_mala | nombre_planta    | foto_referencial_resultado    | breve_descripcion_resultado                                                                                                                         | etiqueta_condicion  | condicion_mala | icono_info | boton_redirigir_mala         |
      | 5                     | Aeonium arboreum | (Foto de la planta escaneada) | Suculenta arborescente de las Islas Canarias, prefiere sol filtrado a pleno sol, sustrato muy drenante y riegos espaciados, dejando secar el suelo. | Etiqueta de estado  | Mala           | Icono 'i'  | Flecha a diagnóstico general |

      