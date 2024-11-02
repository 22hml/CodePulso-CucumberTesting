Feature: Cambio de Idioma Login

Scenario: Cambio de idioma a Ingles
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de idioma ingles "//*[@id='root']/section/div/div[1]/p"
  Then verificar que el texto de usuario es "Username" "//*[@id='root']/section/section/div[2]/form/input"
  Then verificar que el texto de contraseña es "Password" "//*[@id='root']/section/section/div[2]/form/div/input"
  When verificar que el texto del boton de iniciar sesion es "Login" "//*[@id='root']/section/section/div[2]/form/button"

Scenario: Cambio de idioma a Español
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de idioma ingles "//*[@id='root']/section/div/div[1]/p"
  When hacer click en el campo de idioma español "//*[@id='root']/section/div/div[2]/p"
  Then verificar que el texto de usuario es "Usuario" "//*[@id='root']/section/section/div[2]/form/input"
  Then verificar que el texto de contraseña es "Contraseña" "//*[@id='root']/section/section/div[2]/form/div/input"
  When verificar que el texto del boton de iniciar sesion es "Iniciar sesión" "//*[@id='root']/section/section/div[2]/form/button"
