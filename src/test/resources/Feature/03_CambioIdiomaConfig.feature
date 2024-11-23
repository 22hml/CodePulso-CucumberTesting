Feature: Cambio de Idioma Configuración

Background: 
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"

Scenario: Cambio de idioma a Ingles
	And hacer click en el modulo del menu llamado configuración "//*[@id='root']/div/nav/ul/a[4]/li/p"
  When hacer click en el campo de idioma ingles "//*[@id='root']/div/main/div[2]/div/label[2]/p"
  Then verificar que el texto de configuracion es "Settings" "//*[@id='root']/div/nav/ul/a[4]/li/p"

Scenario: Cambio de idioma a Español
	And hacer click en el modulo del menu llamado configuración "//*[@id='root']/div/nav/ul/a[4]/li/p"
	When hacer click en el campo de idioma ingles "//*[@id='root']/div/main/div[2]/div/label[2]/p"
  When hacer click en el campo de idioma español "//*[@id='root']/div/main/div[2]/div/label[1]/p" 
  Then verificar que el texto de configuracion es "Configuración" "//*[@id='root']/div/nav/ul/a[4]/li/p"
