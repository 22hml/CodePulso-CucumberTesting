Feature: Proceso de Negocio - Visualizacion Mis Tickets

Background: 
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"

Scenario: Visualizar Historial de Mis Tickets
  And hacer click en el modulo del menu llamado Soporte "//*[@id='root']/div/nav/ul/a[3]/li"
	Then espero carga de datos mis tickets
	Then visualizo mis tickets
	
Scenario: Visualizar detalle de mi ticket
  And hacer click en el modulo del menu llamado Soporte "//*[@id='root']/div/nav/ul/a[3]/li"
	Then espero carga de datos mis tickets
	Then visualizo mis tickets
	Then hacer click el botón de editar del último ticket registrado "//*[@id='root']/div/main/section/div[2]/div[1]/table/tbody/tr/td[4]/button"
	Then visualizar detalle de mi ticket "//*[@id='root']/div/main/section/div[1]/div[2]"

Scenario: Visualizar y cerrar detalle de mi ticket
  And hacer click en el modulo del menu llamado Soporte "//*[@id='root']/div/nav/ul/a[3]/li"
	Then espero carga de datos mis tickets
	Then visualizo mis tickets
	Then hacer click el botón de editar del último ticket registrado "//*[@id='root']/div/main/section/div[2]/div[1]/table/tbody/tr/td[4]/button"
	Then visualizar detalle de mi ticket "//*[@id='root']/div/main/section/div[1]/div[2]"
	Then cerrar detalle de mi ticket "//*[@id='root']/div/main/section/div[1]/div[2]/button"

Scenario: Visualizar respuesta de mi ticket
  And hacer click en el modulo del menu llamado Soporte "//*[@id='root']/div/nav/ul/a[3]/li"
	Then espero carga de datos mis tickets
	Then visualizo mis tickets
	Then hacer click el botón de editar del último ticket registrado "//*[@id='root']/div/main/section/div[2]/div[1]/table/tbody/tr/td[4]/button"
	Then visualizar detalle de mi ticket "//*[@id='root']/div/main/section/div[1]/div[2]"
	Then hacer click en resolucion del ticket "//*[@id='pr_id_2']/div/div"

	