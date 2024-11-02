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

public class PasosCambioIdiomaConfiguracion {

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

    @When("hacer click en el modulo del menu llamado configuración {string}")
    public void hacer_click_en_el_modulo_configuracion(String xpath) {
        DriverManager.getWait().until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }

    @Then("verificar que el texto de configuracion es {string} {string}")
    public void verificar_texto_configuracion(String textoEsperado, String xpath) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        WebElement textoConfiguracion = DriverManager.getWait().until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
        assertEquals(textoEsperado, textoConfiguracion.getText());
    }

}
