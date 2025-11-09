Feature: Análisis de patrones en mis registros
  Como usuario,
  Quiero que la aplicación identifique patrones en mis actividades y resultados,
  Para aprender de mi experiencia y tomar mejores decisiones en futuras campañas.

  Scenario Outline: Visualizar los patrones identificados por la aplicación
    Given que el usuario tiene un historial de al menos dos campañas registradas en la bitácora
    When el usuario navega a la sección de "Análisis y Reportes"
    Then el sistema carga una pantalla con una lista de tarjetas, donde cada una representa un patrón o conclusión generada automáticamente
    And cada tarjeta muestra un <titulo> que resume el patrón encontrado, una <descripcion> con los datos que sustentan la conclusión, el nivel de <confianza> del análisis
    And la <base_datos> utilizada.

    Examples: Variables de salida
      | titulo                                         | descripcion                                                                                                                                    | confianza           | base_datos          |
      | "Mayor rendimiento con sombra 35% + riego AM"  | "Entre 2024 y 2025 el rendimiento subió +11.2% y el descarte bajó -4 pp cuando se instaló malla 35% y se movió el riego a la mañana."          | "CONFIANZA: 72%"    | "BASE: 2 CAMPAÑAS"  |
      | "Terracota reduce pérdidas por pudrición"      | "El cambio de macetas plásticas -> terracota disminuyó incidentes de pudrición de 9% a 3% en 3 meses."                                         | "CONFIANZA: 68%"    | "BASE: 2 PERIODOS"  |
      | "Menos riegos, mejor calidad"                  | "Al espaciar riegos (solo sustrato seco), el % clase A subió de 76% a 84% y la merma bajó -2.1 pp."                                            | "CONFIANZA: 64%"    | "BASE: 2 CAMPAÑAS"  |