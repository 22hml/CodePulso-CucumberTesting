package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.Assert.assertEquals;

public class PasosControlDeAcceso {

    private WebDriver driver;
    private int intentosFallidos = 0;

    @Before
    public void setUp() {
        DriverManager.initializeDriver();
        driver = DriverManager.getDriver();
    }

    @After
    public void tearDown() {
        DriverManager.quitDriver();
    }

    private void esperar(int segundos) {
        try {
            Thread.sleep(segundos * 1000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Given("al navegar hasta la url {string}")
    public void al_navegar_hasta_la_url(String url) {
        driver.get(url);
    }

    @Given("al navegar hasta la url interna {string}")
    public void al_navegar_hasta_la_url_interna(String url) {
        driver.get(url);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @When("hacer click en el campo de usuario {string}")
    public void hacer_click_en_el_campo_de_usuario(String input) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(input))).click();
    }

    @When("coloca en el campo usuario {string} el usuario {string}")
    public void coloca_en_el_campo_usuario_el_texto(String campoUsuario, String usuario) {
        driver.findElement(By.xpath(campoUsuario)).sendKeys(usuario);
    }

    @When("hacer click en el campo de contraseña {string}")
    public void hacer_click_en_el_campo_de_contraseña(String input) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(input))).click();
    }

    @When("coloca en el campo contraseña {string} la contraseña {string}")
    public void coloca_en_el_campo_pass_la_pass(String campoPassword, String password) {
        driver.findElement(By.xpath(campoPassword)).sendKeys(password);
    }

    @Then("apretar boton de inicio sesion {string}")
    public void apreta_el_boton(String boton) {
        driver.findElement(By.xpath(boton)).click();
    }

    @Then("esperar el inicio de sesion {string}")
    public void espera_la_sesion(String menu) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(menu)));
    }

    @Then("esperar el mensaje de error {string}")
    public void espera_el_error(String msg) {
        DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(msg)));
    }

    @Then("verificar mensaje de error {string}")
    public void verificar_mensaje_de_error(String mensajeEsperado) {
        WebElement mensajeError = driver.findElement(By.xpath("//*[@id='root']/section/section/div[2]/form/p"));
        DriverManager.getWait().until(ExpectedConditions.visibilityOf(mensajeError));
        assertEquals(mensajeEsperado, mensajeError.getText());
        
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Then("incrementar contador de intentos fallidos")
    public void incrementar_intentos_fallidos() {
        intentosFallidos++;
        esperar(1);
    }

    @Then("verificar bloqueo de cuenta {string}")
    public void verificar_bloqueo(String mensajeBloqueo) {
        if (intentosFallidos >= 3) {
            DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(mensajeBloqueo)));
        }
    }

    @When("hace click en el botón de inicio de sesión sin ingresar usuario")
    public void hace_click_sin_usuario() {
        driver.findElement(By.xpath("//*[@id='root']/section/section/div[2]/form/button")).click();
    }

    @Then("verificar que el campo usuario es necesario")
    public void verificar_campo_usuario_necesario() {
        WebElement mensajeError = driver.findElement(By.xpath("//*[@id='root']/section/section/div[1]/div/div/div[2]"));
        DriverManager.getWait().until(ExpectedConditions.visibilityOf(mensajeError));
        assertEquals("Este campo es necesario", mensajeError.getText());
    }

    @When("cerrar sesión en el sistema")
    public void cerrar_sesion() {
        WebElement botonCerrarSesion = DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath("//li[@class='logout flex']")));
        botonCerrarSesion.click();
    }

    @Then("verificar redirección_login {string}")
    public void verificar_redireccion_login(String url) {
        DriverManager.getWait().until(ExpectedConditions.urlToBe(url));
    }

    @When("hacer click en el botón cerrar sesión {string}")
    public void hacer_click_en_el_boton_cerrar_sesion(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
        
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Then("esperar {int} segundo")
    public void esperar_segundo(Integer segundos) {
        try {
            Thread.sleep(segundos * 1000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
