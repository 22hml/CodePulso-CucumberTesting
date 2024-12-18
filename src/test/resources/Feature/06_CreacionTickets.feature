Feature: Creación de Tickets

Background: 
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "noblock"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "noblock1"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"
	

Scenario: Creación de ticket con imagen adjunta
  And hacer click en soporte "//*[@id='root']/div/nav/ul/a[2]"
  Then hacer click en boton de crear ticket "//*[@id='root']/div/main/section/div[1]/div/button[1]"
  Then escribir algo en el input de titulo "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[2]/input"
  Then escribir algo en la desc "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/textarea"
  Then subir imagen en el file "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[3]/div/input"
  And esperar preview "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/div/div"
  Then hacer click boton "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/button"
  And refrescar tickets "//*[@id='root']/div/main/section/div[1]/div/button[2]"
  Then ver detalle de ticket
  Then comprobar imagen "//*[@id='root']/div/main/section/div[1]/div[2]/div/section[1]"
  
Scenario: Creación de ticket sin titulo
  And hacer click en soporte "//*[@id='root']/div/nav/ul/a[2]"
  Then hacer click en boton de crear ticket "//*[@id='root']/div/main/section/div[1]/div/button[1]"
  Then escribir algo en la desc "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/textarea"
  Then hacer click boton "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/button"
  Then no deja crear ticket
  
Scenario: Creación de ticket sin descripción
  And hacer click en soporte "//*[@id='root']/div/nav/ul/a[2]"
  Then hacer click en boton de crear ticket "//*[@id='root']/div/main/section/div[1]/div/button[1]"
  Then escribir algo en el input de titulo "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[2]/input"
  Then hacer click boton "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/button"
  Then ver mensaje de error "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/p"
  
Scenario: Error al subir una imagen muy grande en un ticket
  And hacer click en soporte "//*[@id='root']/div/nav/ul/a[2]"
  Then hacer click en boton de crear ticket "//*[@id='root']/div/main/section/div[1]/div/button[1]"
  Then escribir algo en el input de titulo "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[2]/input"
  Then escribir algo en la desc "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/textarea"
  Then subir imagen grande en el file "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[3]/div/input"
  Then ver mensaje de error imagen "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/p"

Scenario: Creación de ticket con prioridad alta
  And hacer click en soporte "//*[@id='root']/div/nav/ul/a[2]"
  Then hacer click en boton de crear ticket "//*[@id='root']/div/main/section/div[1]/div/button[1]"
  And seleccionar la opción "Alta" en el select "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[1]/select"
  Then escribir algo en el input de titulo "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/label[2]/input"
	Then escribir algo en la desc "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/textarea"
	Then hacer click boton "//*[@id='root']/div/main/section/div[1]/div[2]/div/form/button"
	And refrescar tickets "//*[@id='root']/div/main/section/div[1]/div/button[2]"
	Then checkear ultimo ticket prioridad alta
