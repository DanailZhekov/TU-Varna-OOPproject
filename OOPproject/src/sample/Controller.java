package sample;

import javafx.event.ActionEvent;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;

public class Controller {
    public Label helloWorld;
    public Pane pane1;


    public void sayHelloWorld(ActionEvent actionEvent) {
        helloWorld.setText("HelloWorld");
    }
}
