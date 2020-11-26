package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableArray;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class saleController {

    private final Connection connection = connect.connectDB();
    public DatePicker daysfrom;
    public DatePicker daysto;

    String id;
    String maintitle;
    int client_id;


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

    @FXML
    public void initialize() throws SQLException {
        premium.setTooltip(new Tooltip("premium insurance is better"));
        normal.setTooltip(new Tooltip("normal insurance sucks"));
        experience.setItems(FXCollections.observableArrayList("по-малко от 5 години", "над 5 години","над 10 години","над 15 години"));
    }

    Parent root;
    public void transfer(String id){
        rentlabel.setText(id);
        this.id = id;
    }

    public void title(String title){
        maintitle = title;
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
    public int clientid() throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT NVL(MAX(id), 0) FROM client");
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next())
        client_id = rs.getInt(1);
        return client_id;

    }

    public void insertclient(ActionEvent event) throws SQLException {

        System.out.println(clientid());
       String wholeName = name.getText() + " " + surname.getText();

        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO client(id, name, phone, experience, email) VALUES(?, ?, ?, ?)");
        preparedStatement.setInt(1,clientid() + 1);
        preparedStatement.setString(2,wholeName);
        preparedStatement.setString(3,phone.getText());
        preparedStatement.setString(4,email.getText());
        preparedStatement.execute();

    }



}

