Feature: Mostrar tu ubicación actual
    Como propietario/a autenticado/a y suscrito/a a un plan,
    Quiero poder visualizar mi ubicación,
    Para buscar centros de atención cerca de mi ubicación.

  Scenario: Mostrar ubicación actual del usuario con éxito
    Given el usuario está autenticado como propietario/a en la versión gratuita o suscrito en la aplicación
    When selecciona la opción para mostrar su ubicación actual con el propósito de buscar centros
    Then la aplicación accede a la ubicación actual del usuario y la muestra en el mapa de manera precisa

  Examples:
    | Usuario   | Ubicación   |
    | María     | Lima, Perú  |
    | Carlos    | Cusco, Perú |


  Scenario: Imposibilidad de obtener la ubicación actual del usuario"
    Given el usuario está autenticado como propietario/a en la versión gratuita o suscrito en la aplicación
    When intenta acceder a la opción mostrar su ubicación actual
    And la aplicación intenta obtener la ubicación actual del usuario, pero hay una falla en el dispositivo o el usuario ha desactivado su GPS
    Then la aplicación muestra un mensaje de error indicando que no se pudo obtener la ubicación y sugiere que active la función de ubicación en su dispositivo 
  
  Examples:
    | Mensaje de error                                  |
    | 'No se pudo obtener su ubicación. Active el GPS.' |
