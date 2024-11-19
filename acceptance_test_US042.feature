Feature: Mostrar veterinarias cercanas
    Como propietario/a autenticado/a y suscrito/a a un plan,
    Quiero visualizar las veterinarias alrededor de mi zona,
    Para elegir una y atender a mi mascota.
  
  Scenario: Mostrar lista de veterinarias cercanas con éxito
    Given el usuario está autenticado, suscrito a un plan, tiene la ubicación activada en su dispositivo y hay veterinarias registradas en la zona del usuario
    When abre la aplicación y selecciona la opción 'Mostrar veterinarias cercanas'
    Then la aplicación muestra una lista de veterinarias cercanas a la ubicación del usuario

  Examples:
    | Veterinaria          | Distancia |
    | Clínica VetSalud     | 1.2 km    |
    | Centro Mascotas Feliz| 2.5 km    |
    | Clínica AnimalCare   | 3.0 km    |        

  Scenario: No se encuentran veterinarias cercanas
    Given el usuario está autenticado, suscrito a un plan, tiene la ubicación activada en su dispositivo y no hay veterinarias registradas en la zona del usuario
    When intenta acceder a la opción 'Mostrar veterinarias cercanas'
    Then la aplicación muestra un mensaje de error indicando que no encuentra veterinarias cercanas

  Examples:
    | Mensaje de error                                  |
    | No se encuentran veterinarias cercanas en su zona |
    
