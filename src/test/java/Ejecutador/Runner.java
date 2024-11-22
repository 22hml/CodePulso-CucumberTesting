package Ejecutador;

import org.junit.runner.RunWith;
import io.cucumber.junit.CucumberOptions;
import io.cucumber.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
    features = {"src/test/resources/Feature"},
    glue = {"DefinicionPasos"},
    plugin = { 
        "pretty", 
        "json:target/cucumber-reports/cucumber.json",
        "html:target/cucumber-reports/report.html",
        "junit:target/cucumber-results.xml" 
    },
    monochrome = true
)
public class Runner {
}
