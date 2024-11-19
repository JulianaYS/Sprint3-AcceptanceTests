Feature: Integración de datos del collar al historial médico
    Como veterinario,
    Quiero acceder a los datos de salud registrados por el collar IoT,
    Para complementar el historial médico de la mascota y dar un mejor seguimiento a su salud.

  Scenario: Integración exitosa de los datos
    Given el collar está conectado
    When se registran los signos vitales (ritmo cardiaco y temperatura)
    Then estos datos se almacenan automáticamente en el historial médico de la mascota con la fecha y hora correspondientes

    Examples:
        | Mascota | Ritmo cardiaco | Temperatura | Fecha y hora       |
        | Luna    | 80 bpm         | 38°C        | 2021-09-15 10:00   |
        | Toby    | 70 bpm         | 37°C        | 2021-09-15 10:30   |

  Scenario: Fallo en la sincronización de datos
    Given el collar tiene problemas para transmitir los datos
    When se intenta sincronizar los signos vitales con el historial médico
    Then la aplicación muestra un mensaje de error indicando que los datos no pudieron ser sincronizados 

    Examples:
        | Mensaje de error                               |
        | 'No se pudo sincronizar los datos del collar.' |
 
  Scenario: Visualización de datos en el historial médico
    Given los datos han sido sincronizados
    When el veterinario accede al historial médico de la mascota
    Then puede visualizar las métricas de salud del collar junto con otros datos clínicos, como vacunas y consultas previas

    Examples:
        | Mascota | Ritmo cardiaco | Temperatura | Fecha y hora       | Vacunas | Consultas |
        | Luna    | 80 bpm         | 38°C        | 2021-09-15 10:00   | Sí      | Sí        |
        | Toby    | 70 bpm         | 37°C        | 2021-09-15 10:30   | Sí      | No        |
