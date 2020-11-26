package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

import java.io.IOException;

public class backController {

    Parent root;

    @FXML
    private Label price_day;

    public void setPrice_day(String price_day){
        this.price_day.setText(price_day + "лв");
    }
    public void back(ActionEvent event) throws IOException {
        if(Main.mainStage.getTitle().equals("Rent a Car")) {
            root = FXMLLoader.load(getClass().getResource("../scenes/yes.fxml"));
            Main.mainStage.setScene(new Scene(root));
        }
        else if(Main.mainStage.getTitle().equals("Page 2")){
            root = FXMLLoader.load(getClass().getResource("../scenes/str2.fxml"));
            Main.mainStage.setScene(new Scene(root));
        }
        else {
            root = FXMLLoader.load(getClass().getResource("../scenes/str3.fxml"));
            Main.mainStage.setScene(new Scene(root));
        }


    }
}
