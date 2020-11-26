package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class controller3 {

    private final Connection connection = connect.connectDB();
    PreparedStatement preparedStatement;


    Parent root;

    public controller3() throws SQLException {
    }

    public void carPictures(ActionEvent event) throws IOException, SQLException {
        final Node node = (Node) event.getSource();
        String id = node.getId();
        int price = 0;
        preparedStatement = connection.prepareStatement("SELECT cars.price FROM cars INNER JOIN model ON cars.model_id = model.id WHERE model.model = ?");
        preparedStatement.setString(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) price = resultSet.getInt("price");
        backController backController;
        switch (id) {
            case "530d": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/BMW530dPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
            case "A4": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/AudiA4Pictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
            case "Accord": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/AccordPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
            case "Exeo":
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/SeatPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
        }
    }

    public void prevpage(ActionEvent event) throws IOException {
            root = FXMLLoader.load(getClass().getResource("../scenes/str2.fxml"));
            Scene page2 = new Scene(root);
            Main.mainStage.setScene(page2);
            Main.mainStage.setTitle("Page 2");
        }

    String make,model,id;
    public String getcar(String id) throws SQLException {
        preparedStatement = connection.prepareStatement("SELECT make.make, model.model FROM cars INNER JOIN model ON cars.model_id = model.id INNER JOIN make ON model.make_id = make.id WHERE model.model = ?");
        preparedStatement.setString(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            make = rs.getString("make");
            model = rs.getString("model");
        }
        return make + " " + model;
    }

    public void rent(ActionEvent event) throws IOException, SQLException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/ForPurchase.fxml"));
        root = loader.load();
        final Node node = (Node)event.getSource();
        id = node.getId();
        saleController saleController = loader.getController();
        saleController.transfer(getcar(id));
        saleController.setprice(id);
        saleController.title(Main.mainStage.getTitle());
        Main.mainStage.setScene(new Scene(root));
        Main.mainStage.setTitle("Rent");

    }

    }



