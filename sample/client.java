package sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class client {

        //private int id;
        private Connection connection;
        private String name;
        private String surname;
        private String phone;
        private String email;

        public client(){

        }
        public client(Connection connection){
            this.connection = connection;
        }

        public client(String name,String surname, String phone, String email) {
            this.name = name;
            this.phone = phone;
            this.email = email;
            this.surname = surname;
        }


        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public void setConnection(Connection connection) {
            this.connection = connection;
        }
/*
        public void insert() throws SQLException {
            Scanner scanner = new Scanner(System.in);//скенер за четене на запис
            System.out.println("name:");
            setName(scanner.nextLine());
            System.out.println("\nphone:");
            setPhone(scanner.nextLine());
            System.out.println("\nexperience:");
            System.out.println("\nemail:");
            setEmail(scanner.nextLine());


            PreparedStatement preparedStatement = connection.prepareStatement("SELECT NVL(MAX(id), 0) FROM client");
            ResultSet rs = preparedStatement.executeQuery();
            int id = rs.getInt("id");


            preparedStatement = connection.prepareStatement("INSERT INTO client(id, name, phone, experience, email) VALUES(?, ?, ?, ?)");
            preparedStatement.setInt(1,id + 1);
            preparedStatement.setString(2,getName());
            preparedStatement.setString(3,getPhone());
            preparedStatement.setString(4,getEmail());
            preparedStatement.execute();

        }
*/
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
}
