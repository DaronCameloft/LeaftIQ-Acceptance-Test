Feature: Lista de guías y artículos de sostenibilidad
  Como agricultor interesado en la ecología,
  Quiero poder acceder a una lista de guías y artículos sobre sostenibilidad,
  Para aprender sobre temas clave como compostaje, consumo responsable y gestión del agua.

	Scenario Outline: Visualizar las secciones de guías e impacto sostenible
		Given que el usuario se encuentra en la pantalla principal de la aplicación
		When el usuario presiona la opción para ver la sección de "Sostenibilidad"
		Then el sistema carga la pantalla "Sostenibilidad"
		And el usuario visualiza la lista de <titulo_lista_guias> con opciones como <opcion_guia_1>, <opcion_guia_2>, <opcion_guia_3>, <opcion_guia_4>, <opcion_guia_5>
		And el usuario también visualiza la lista de <titulo_lista_impacto> con métricas como <metrica_1>, <metrica_2>
		And <metrica_3>.

		Examples: Variables de salida
			| titulo_lista_guias                    | opcion_guia_1        | opcion_guia_2         | opcion_guia_3         | opcion_guia_4               | opcion_guia_5                   | titulo_lista_impacto     | metrica_1                                 | metrica_2                  | metrica_3           |
			| "Guías y artículos de sostenibilidad" | "Guía de compostaje" | "Energías renovables" | "Consumo responsable" | "Arquitectura bioclimática" | "Gestión sostenible del agua"   | "Mi impacto Sostenible"  | "Kilos de residuos orgánicos compostados" | "Litros de agua ahorrada"  | "Buenas prácticas"  |