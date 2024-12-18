Feature: Menú Principal

Background: 
  Given al navegar hasta la url "https://bridge.codepulso.com/"
  When hacer click en el campo de usuario "//*[@id='root']/section/section/div[2]/form/input"
  Then coloca en el campo usuario "//*[@id='root']/section/section/div[2]/form/input" el usuario "noblock"
  When hacer click en el campo de contraseña "//*[@id='root']/section/section/div[2]/form/div/input"
  Then coloca en el campo contraseña "//*[@id='root']/section/section/div[2]/form/div/input" la contraseña "noblock1"
  Then apretar boton de inicio sesion "//*[@id='root']/section/section/div[2]/form/button"
  Then esperar el inicio de sesion "//*[@id='root']/div/nav/ul/a[1]"

Scenario: Acceso al menú principal sin problemas
  Then verificar correcta visualizacion "//*[@id='root']/div/nav/ul"

Scenario: Navegación a la sección de soporte
  Then verificar correcta visualizacion "//*[@id='root']/div/nav/ul"
  Then navegar a seccion "//*[@id='root']/div/nav/ul/a[2]"
  Then verificar seccion "//*[@id='root']/div/main/section/div[1]/h2" con texto "Mis Tickets"
  
Scenario: Navegación a la sección de configuracion
  Then verificar correcta visualizacion "//*[@id='root']/div/nav/ul"
  Then navegar a seccion "//*[@id='root']/div/nav/ul/a[3]"
  Then verificar seccion "//*[@id='root']/div/main/div[2]/h3" con texto "Cambiar Idioma"
  
Scenario: Acceso a una sección restringida
  Then verificar correcta visualizacion "//*[@id='root']/div/nav/ul"
  Given al navegar hasta la url "https://bridge.codepulso.com/Admin"
  Then verificar seccion "//*[@id='root']/div/main/h1" con texto "Inicio"
  
Scenario: Acceso a una apliacion registrada
  Then verificar correcta visualizacion "//*[@id='root']/div/nav/ul"
  Then esperar visualizacion de app "//*[@id='root']/div/main/section/div"
  Then ingresar a app disponible "//*[@id='root']/div/main/section/div/button"