Feature: Visualización AR de síntomas en la planta
  Como usuario,
  Quiero activar un modo de Realidad Aumentada que resalte directamente sobre la planta las zonas afectadas detectadas por la IA,
  Para confirmar visualmente el problema y entender qué parte de mi cultivo está dañada.


  Scenario Outline: Activar el modo AR desde la pantalla de diagnóstico
    Given que el usuario está en la pantalla “Resultado del diagnóstico”,
    And el sistema ya procesó la imagen y detectó posibles síntomas,
    When el usuario selecciona la opción <opcion_ar>,
    Then el sistema debe abrir la cámara en modo AR,
    And debe mostrarse un mensaje inicial <mensaje_inicial>.

    Examples: Variables de entrada
      | opcion_ar   |
      | “Ver en AR” |

    Examples: Variables de salida
      | mensaje_inicial      |
      | “Detectando planta…” |

  Scenario Outline: Superponer marcadores en las zonas afectadas
      Given que la cámara está activa en modo AR,
      And el sistema identificó la posición aproximada de la planta,
      When el tracking se estabiliza,
      Then la aplicación debe mostrar marcadores visuales <tipo_marcadores> sobre las zonas afectadas detectadas por la IA,
      And estos marcadores deben permanecer alineados a la planta incluso si el usuario mueve ligeramente el celular

    Examples: Variables de entrada
      | estado_tracking |
      | "Estable"       |

    Examples: Variables de salida
      | tipo_marcadores       |
      | "(círculos o iconos)" |