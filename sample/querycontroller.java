package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;

import javax.swing.text.Element;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class querycontroller extends functions{

    private final Connection connection = connect.connectDB();


    @FXML
    private Label trylabel;

    @FXML
    private AnchorPane hide;

    @FXML
    private ImageView kola;



    String original;
    Parent root;

   PreparedStatement preparedStatement;
    String label,model,make,id,maintitle;


    @FXML
    public void initialize() throws SQLException, IOException {


            preparedStatement = connection.prepareStatement("SELECT model.model FROM cars INNER JOIN model ON cars.model_id = model.id WHERE cars.id = ?");
            preparedStatement.setInt(1, 2);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next())
                label = rs.getString("model");
          //  change(kola);
    }


    public querycontroller() throws SQLException, FileNotFoundException {
    }

    public void changinglabel(MouseEvent event){
        original = trylabel.getText();
        trylabel.setText(label);
    }

    public void adminLogin(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("../scenes/Login.fxml"));
        Main.mainStage.setScene(new Scene(root));
        maintitle = Main.mainStage.getTitle();
        Main.mainStage.setTitle("Login");

    }
    public void changeback(MouseEvent event){
        trylabel.setText(original);
    }

    public void nextpage(ActionEvent actionEvent) throws IOException, SQLException {
            root = FXMLLoader.load(getClass().getResource("../scenes/str2.fxml"));
            Main.mainStage.setScene(new Scene(root));
            Main.mainStage.setTitle("Page 2");

    }
    public void showpics(ActionEvent event) throws IOException, SQLException {
        final Node node = (Node)event.getSource();
        String id = node.getId();
        int price = 0;
        preparedStatement = connection.prepareStatement("SELECT cars.price FROM cars INNER JOIN model ON cars.model_id = model.id WHERE model.model = ?");
        preparedStatement.setString(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) price = resultSet.getInt("price");
        backController backController;
        switch (id){
            case "Civic": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/CivicPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
            case "Passat": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/PassatPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));

                break;
            }
            case "S500": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/MercS500Pictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
            case "Micra": {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../scenes/MicraPictures.fxml"));
                root = loader.load();
                backController = loader.getController();
                backController.setPrice_day(String.valueOf(price));
                Main.mainStage.setScene(new Scene(root));
                break;
            }
        }
    }




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

    @FXML
    private Label Car_category,Make,year,consumption,kilometers,engine;
    @FXML
    private ImageView Car_pic,Car_pic2;
    @FXML
    private Button pictures,rent;

    public void testing(ActionEvent event) throws SQLException, FileNotFoundException {
        preparedStatement = connection.prepareStatement("SELECT category.category,class.class,make.make,model.year,cars.kilometers,cars.engine FROM cars INNER JOIN model ON cars.model_id = model.id INNER JOIN make ON model.make_id = make.id INNER JOIN category ON model.category_id = category.id INNER JOIN class ON model.class_id = class.id WHERE cars.id = 1");
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()){
            Car_category.setText(rs.getString("category") + rs.getString("class"));
            Make.setText(rs.getString("make"));
            year.setText(rs.getString("year"));
            kilometers.setText(rs.getString("kilometers"));
            engine.setText(rs.getString("engine"));
            pictures.setId(rs.getString("category"));
        }
        rent.setId(pictures.getId());
        System.out.println(rent.getId() + pictures.getId());

    }



}
