package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;import javafx.scene.Scene;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main extends Application {

    static Stage mainStage;

    @Override
    public void start(Stage primaryStage) throws Exception, SQLException {
        connect.connectDB();
        mainStage = primaryStage;
        Parent root = FXMLLoader.load(getClass().getResource("../scenes/yes.fxml"));
        primaryStage.setTitle("Rent a Car");
        primaryStage.setScene(new Scene(root));
        primaryStage.show();


    }


    public static void main(String[] args) {
        launch(args);
    }
}
