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

public class PasosActualizacionCorreoTelefono {

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

    @Then("hacer click en el boton de editar correo {string}")
    public void hacer_click_en_el_boton_de_editar_correo(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @Then("colocar en el campo correo electronico nuevo {string} el correo {string}")
    public void colocar_en_el_campo_correo_nuevo(String xpath, String nuevoCorreo) {
        WebElement campoCorreo = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        campoCorreo.sendKeys(nuevoCorreo);
    }

    @Then("presionar boton confirmar {string}")
    public void presionar_boton_confirmar(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @Then("visualizar mensaje enviando en boton")
    public void visualizar_mensaje_enviando_en_boton() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Then("hacer click en el boton de editar telefono {string}")
    public void hacer_click_en_el_boton_de_editar_telefono(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @Then("colocar en el campo telefono nuevo {string} el telefono {string}")
    public void colocar_en_el_campo_telefono_nuevo(String xpath, String nuevoTelefono) {
        WebElement campoTelefono = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        campoTelefono.sendKeys(nuevoTelefono);
    }

    @Then("visualizar mensaje de error {string}")
    public void visualizar_mensaje_de_error(String xpath) {
        WebElement mensajeError = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        assertEquals("Este campo es requerido", mensajeError.getText());
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
