package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import static org.junit.Assert.assertEquals;

public class PasosCambiodeIdiomaLogin {

    private WebDriver driver;

    @Before
    public void setUp() {
        DriverManager.initializeDriver();
        driver = DriverManager.getDriver();
    }

    @After
    public void tearDown() {
        DriverManager.quitDriver();
    }

    @When("hacer click en el campo de idioma ingles {string}")
    public void hacer_click_en_el_campo_idioma_ingles(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @When("hacer click en el campo de idioma español {string}")
    public void hacer_click_en_el_campo_idioma_espanol(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @Then("verificar que el texto de usuario es {string} {string}")
    public void verificar_texto_usuario(String textoEsperado, String xpath) {
        WebElement inputUsuario = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        String placeholder = inputUsuario.getAttribute("placeholder");
        assertEquals(textoEsperado, placeholder);
    }

    @Then("verificar que el texto de contraseña es {string} {string}")
    public void verificar_texto_contrasena(String textoEsperado, String xpath) {
        WebElement inputContrasena = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        String placeholder = inputContrasena.getAttribute("placeholder");
        assertEquals(textoEsperado, placeholder);
    }

    @When("verificar que el texto del boton de iniciar sesion es {string} {string}")
    public void verificar_texto_boton_inicio_sesion(String textoEsperado, String xpath) {
        WebElement botonIniciarSesion = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        String textoBoton = botonIniciarSesion.getText();
        assertEquals(textoEsperado, textoBoton);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
