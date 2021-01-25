package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableArray;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class saleController extends functions {


    private final Connection connection = connect.connectDB();
    public DatePicker daysfrom;
    public DatePicker daysto;

    String id;
    String maintitle;
    Parent root;



    @FXML
    private Button back,insert;

    @FXML
    private TextField name,surname,phone,email;

    @FXML
    private ChoiceBox<String> experience;

    @FXML
    private RadioButton premium,normal;

    @FXML
    private Label rentlabel,price,errorlabel;

    public saleController() throws SQLException {
    }

    public String getId(){
        return this.id;
    }

    public void title(String title){
        maintitle = title;
    }

    public void transfer(String id){
        rentlabel.setText(id);
        this.id = id;
    }



    @FXML
    public void initialize() throws SQLException {
        premium.setTooltip(new Tooltip("premium insurance is better"));
        
        normal.setTooltip(new Tooltip("normal insurance sucks"));
        experience.setItems(FXCollections.observableArrayList("по-малко от 5 години", "над 5 години","над 10 години","над 15 години"));
    }





    public void setprice(String id) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT cars.price FROM cars INNER JOIN model ON cars.model_id = model.id WHERE model.model = ?");
        preparedStatement.setString(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
           price.setText(String.valueOf(resultSet.getInt("price")) + "лв");
        }
    }
    public void back(ActionEvent event) throws IOException {
        if(maintitle.equals("Rent a Car")) {
            root = FXMLLoader.load(getClass().getResource("../scenes/yes.fxml"));
            Main.mainStage.setScene(new Scene(root));
            Main.mainStage.setTitle(maintitle);
        }
        else if(maintitle.equals("Page 2")){
            root = FXMLLoader.load(getClass().getResource("../scenes/str2.fxml"));
            Main.mainStage.setScene(new Scene(root));
            Main.mainStage.setTitle(maintitle);


        }
        else {
            root = FXMLLoader.load(getClass().getResource("../scenes/str3.fxml"));
            Main.mainStage.setScene(new Scene(root));
            Main.mainStage.setTitle(maintitle);
        }


    }
    //after selecting a car checks if the client has rented before and then proceeds to insert the data accordingly
    public void inserttoDB(ActionEvent event) throws SQLException, IOException {


        int checkradio = 0;
        if(premium.isSelected()) checkradio = 2;
        else checkradio = 1;

        if(checkphone(phone.getText()) == 0) {
            insert(name.getText(), surname.getText(), phone.getText(), email.getText());
            rented(daysfrom,daysto,getId(),checkradio,clientid());
            popupdialog();
        }
        else if(checkphone(phone.getText()) == 1) error();
        else{

            rented(daysfrom,daysto,getId(),checkradio,checkphone(phone.getText()));
            popupdialog();
        }




    }



}

