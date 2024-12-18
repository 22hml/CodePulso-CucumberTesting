Feature: Control de Acceso

Scenario: Login con datos correctos
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"

Scenario: Login con datos incorrectos
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "admin"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "admin"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"

Scenario: Login con múltiples intentos fallidos
    Given al navegar hasta la url "https://bridge.codepulso.com/"
    When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
    Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
    When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
    Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "wrong"
    Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
    Then incrementar contador de intentos fallidos
    Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"
    
    When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
    Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "wrong2"
    Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
    Then incrementar contador de intentos fallidos
    Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"
    
    When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
    Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "wrong3"
    Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
    Then incrementar contador de intentos fallidos
    Then verificar bloqueo de cuenta "//*[@id='root']/section/section/div[1]/div/div/div[2]"
	
Scenario: Login con usuario vacío
    Given al navegar hasta la url "https://bridge.codepulso.com/"
    When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
    Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test125"
    Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
    And verificar mensaje de error "Este campo es requerido"

Scenario: Login con correo electronico
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "correo@test.com"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "password"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"

Scenario: Login con usuario sensitivo a mayusculas
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "TeStUsEr"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "password123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"
  And esperar 1 segundo

Scenario: Redirección al login al intentar acceder sin autenticación
  Given al navegar hasta la url interna "https://bridge.codepulso.com/interna"

Scenario: Login con un usuario deshabilitado
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test2"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test2222"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el mensaje de error "//*[@id='root']/section/section/div[1]/div/div/div[2]"
  And esperar 1 segundo

Scenario: Cerrar sesión exitosamente
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  And esperar 1 segundo
  When hacer click en el botón cerrar sesión "//*[@id='root']/div/nav/ul/div/li/p"
