Feature: Actualización de Correo/Teléfono


Scenario: Actualización de correo electrónico
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"
  And hacer click en perfil "//*[@id='root']/div/nav/div[2]/a"
	Then hacer click en el boton de editar correo "//*[@id='root']/div/main/section/div[2]/label[2]/div/button"
	And colocar en el campo correo electronico nuevo "//*[@id='root']/div/main/div/div[2]/div/form/input" el correo "test_test@gmail.com"
	Then presionar boton confirmar "//*[@id='root']/div/main/div/div[2]/div/form/button"
	Then visualizar mensaje enviando en boton

Scenario: Actualización de número de teléfono
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"
  And hacer click en perfil "//*[@id='root']/div/nav/div[2]/a"
	Then hacer click en el boton de editar telefono "//*[@id='root']/div/main/section/div[2]/label[3]/div/button"
	And colocar en el campo telefono nuevo "//*[@id='root']/div/main/div/div[2]/div/form/input" el telefono "943532222"
	Then presionar boton confirmar "//*[@id='root']/div/main/div/div[2]/div/form/button"
	Then visualizar mensaje enviando en boton

Scenario: Error al actualizar con un correo inválido
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"
  And hacer click en perfil "//*[@id='root']/div/nav/div[2]/a"
	Then hacer click en el boton de editar correo "//*[@id='root']/div/main/section/div[2]/label[2]/div/button"
	And colocar en el campo correo electronico nuevo "//*[@id='root']/div/main/div/div[2]/div/form/input" el correo "111111111111"
	Then presionar boton confirmar "//*[@id='root']/div/main/div/div[2]/div/form/button"
	Then visualizar mensaje de error "//*[@id='root']/div/main/div/div[2]/div/form/p"

Scenario: Error al actualizar con un número de teléfono vacío
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "test"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "test123"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"
  And hacer click en perfil "//*[@id='root']/div/nav/div[2]/a"
	Then hacer click en el boton de editar telefono "//*[@id='root']/div/main/section/div[2]/label[3]/div/button"
	And colocar en el campo telefono nuevo "//*[@id='root']/div/main/div/div[2]/div/form/input" el telefono ""
	Then presionar boton confirmar "//*[@id='root']/div/main/div/div[2]/div/form/button"
	Then visualizar mensaje de error "//*[@id='root']/div/main/div/div[2]/div/form/p"
