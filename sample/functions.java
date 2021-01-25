package sample;

import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;
import oracle.sql.DATE;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;
import java.util.Random;

public class functions {

    private final Connection connection = connect.connectDB();
    Parent root;

    public functions() throws SQLException {
    }

    @FXML
    private Label error;




    public int clientid() throws SQLException {
        int client_id = 0;
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT NVL(MAX(id), 0) FROM client");
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next())
         client_id = rs.getInt(1);
        return client_id;
    }

    public int rentid() throws SQLException {
        int rent_id = 0;
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT NVL(MAX(id), 0) FROM rent");
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next())
            rent_id = rs.getInt(1);
        return rent_id;
    }

    public void getCars(String model) throws SQLException {
        int id = 0;
        int km;
        PreparedStatement preparedStatement = connection.prepareStatement("Select cars.id, cars.kilometers INNER JOIN model ON cars.model_id = model.id WHERE model.model = ?");
        preparedStatement.setString(1,model);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
            id = rs.getInt("id");
            km = rs.getInt("kilometes");
        }


    }

    //unvalid number
    public void error(){
        error.setText("please input a viable phone number");
        error.setTextFill(Color.web("FF0000",0.8));
    }
    //checks if the user has rented a car before
    public int checkphone(String phone) throws SQLException {
        if(phone.length() != 10){
            return 1;
        }
        String checkphone;
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT client.phone, client.id FROM client");
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()){
            checkphone = rs.getString("phone");
            if(phone.equals(checkphone)) return rs.getInt("id");
        }
        return 0;
    }


    //inserts clients into the database
    public void insert(String name,String surname, String phone, String email) throws SQLException {

        client client = new client(name, surname , phone, email);
        String wholename = client.getName() + " " + client.getSurname();

        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO client(id, name, phone, email) VALUES(?, ?, ?, ?)");
        preparedStatement.setInt(1,clientid() + 1);
        preparedStatement.setString(2,wholename);
        preparedStatement.setString(3,client.getPhone());
        preparedStatement.setString(4,client.getEmail());
        preparedStatement.execute();


    }

    //creates a popup dailog to show up after renting a car
    public void popupdialog() throws IOException {
        //root = FXMLLoader.load(getClass().getResource("../scenes/popup.fxml"));
        final Stage dialog = new Stage();
        Text dialogtext = new Text("Thank you for chosing us!");
        dialogtext.setStyle("-fx-font-size:24px;");
        Button dialongButton = new Button("Close");
        dialongButton.setPrefWidth(70);
        dialongButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                try {
                    root = FXMLLoader.load(getClass().getResource("../scenes/yes.fxml"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Main.mainStage.setScene(new Scene(root));
                dialog.close();
            }
        });
        dialog.initModality(Modality.APPLICATION_MODAL);
        dialog.initOwner(Main.mainStage);
        VBox dialogVbox= new VBox(15);
        dialogVbox.getChildren().add(dialogtext);
        dialogVbox.getChildren().add(dialongButton);
        dialogVbox.setAlignment(Pos.CENTER);
        Scene dialogScene = new Scene(dialogVbox, 300,150);
        dialog.setScene(dialogScene);
        dialog.setTitle("rented");
        dialog.show();

    }
    //inserts into rent
    public void rented(DatePicker from, DatePicker to, String model, int radbutton,int client) throws SQLException {
        Date sqldate = Date.valueOf(from.valueProperty().get());
        Date sqldate1 = Date.valueOf(to.valueProperty().get());
        Random random = new Random();
        int km = 0,id = 0,rand;
        PreparedStatement preparedStatement = connection.prepareStatement("Select cars.id, cars.kilometers from cars INNER JOIN model ON cars.model_id = model.id WHERE model.model = ?");
        preparedStatement.setString(1,model);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()){
            id = rs.getInt("id");
            km = rs.getInt("kilometes");
        }

        rand = random.nextInt(3);

        preparedStatement = connection.prepareStatement("INSERT INTO rent(id, daysfrom, daysto, operator_id, client_id,cars_id, insurance_id, kilometers) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
        preparedStatement.setInt(1,rentid() + 1);
        preparedStatement.setDate(2,sqldate);
        preparedStatement.setDate(3,sqldate1);
        preparedStatement.setInt(4,rand);
        preparedStatement.setInt(5,client);
        preparedStatement.setInt(6,id);
        preparedStatement.setInt(7,radbutton);
        preparedStatement.setInt(8,km);
        preparedStatement.execute();

    }

    public void change(ImageView kola) throws IOException {

        File file = new File("OOPproject.jpg");
        BufferedImage bufferedImage = ImageIO.read(file);
        Image image = SwingFXUtils.toFXImage(bufferedImage,null);
        kola.setImage(image);

    }
}
