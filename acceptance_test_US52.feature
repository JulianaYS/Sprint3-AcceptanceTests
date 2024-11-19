Feature: Monitoreo de ubicación en tiempo real
    Como propietario de mascota,
    Quiero recibir la ubicación en tiempo real de mi mascota desde el collar con GPS,
    Para mantenerla localizada y poder actuar rápidamente en caso de pérdida o robo.
  
  Scenario: Ubicación exitosa
    Given el collar está conectado y tiene señal GPS
    When accedo a la opción de localización en la aplicación
    Then puedo ver la ubicación actual de mi mascota en el mapa en tiempo real, actualizada cada 30 segundos

    Examples:
        | Mascota | Ubicación   |
        | Luna    | Lima, Perú  |
        | Toby    | Cusco, Perú |
  
  Scenario: Ubicación fuera de rango GPS
    Given el collar está fuera de la cobertura GPS
    When intento ver la ubicación de la mascota
    Then recibo una notificación indicando que no se puede obtener la ubicación en este momento, con la última posición conocida del GPS

    Examples:
        | Mensaje de error                                   |
        | 'No se pudo obtener la ubicación en este momento.' |

  Scenario: Desconexión del collar
    Given el collar se ha desconectado o apagado
    When intento acceder a la ubicación
    Then la aplicación muestra un mensaje de error indicando que el dispositivo está desconectado, con opciones de solución como verificar la batería o la conexión

    Examples:
        | Mensaje de error                                                        |
        | 'El dispositivo está desconectado. Verifique la batería o la conexión.' |