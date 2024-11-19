Feature: Alertas de salud anormal
    Como propietario de mascota o veterinario,
    Quiero recibir una notificación si los signos vitales de mi mascota o paciente muestran valores anormales,
    Para poder actuar rápidamente en caso de emergencia.

  Scenario: Ritmo cardiaco y temperatura normales
    Given el collar está monitoreando los signos vitales
    When los valores están dentro de los rangos normales establecidos
    Then la aplicación no envía ninguna alerta y los datos se actualizan cada 5 minutos

    Examples:
        | Mascota | Ritmo cardiaco | Temperatura |
        | Luna    | 80 bpm         | 38°C        |
        | Toby    | 70 bpm         | 37°C        |
 
  Scenario: Ritmo cardiaco elevado o baja temperatura
    Given el ritmo cardiaco supera 120 bpm o la temperatura es menor a 35°C
    When se detecta un valor fuera del rango
    Then la aplicación envía una alerta al propietario y al veterinario con un reporte detallado de los signos vitales

    Examples:
        | Mascota | Ritmo cardiaco | Temperatura | Alerta enviada al propietario | Alerta enviada al veterinario |
        | Luna    | 130 bpm        | 34°C        | Sí                            | Sí                            |
        | Toby    | 140 bpm        | 33°C        | Sí                            | Sí                            |

  Scenario: Fallo en la lectura de los signos vitales
    Given el collar tiene problemas para medir el ritmo cardiaco o la temperatura
    When se intenta hacer una lectura y el dispositivo falla
    Then la aplicación notifica al propietario sobre el fallo del dispositivo y sugiere revisar el collar

    Examples:
        | Mensaje de error                                   |
        | 'No se pudo obtener los signos vitales. Revise el collar.' |