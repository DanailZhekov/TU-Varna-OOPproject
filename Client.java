import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Client {
    //private int id;
    private Connection connection;
    private String name;
    private String phone;
    private int experience;
    private String email;

    public Client(){

    }
    public Client(Connection connection){
        this.connection = connection;
    }

    public Client(String name, String phone, int experience, String email) {
        this.name = name;
        this.phone = phone;
        this.experience = experience;
        this.email = email;
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

    public int getExperience() {
        return experience;
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

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public void insert() throws SQLException {
        Scanner scanner = new Scanner(System.in);//скенер за четене на запис
        System.out.println("name:");
        setName(scanner.nextLine());
        System.out.println("\nphone:");
        setPhone(scanner.nextLine());
        System.out.println("\nexperience:");
        setExperience(Integer.parseInt(scanner.nextLine()));
        System.out.println("\nemail:");
        setEmail(scanner.nextLine());


        PreparedStatement preparedStatement = connection.prepareStatement("SELECT NVL(MAX(id), 0) FROM client");
        ResultSet rs = preparedStatement.executeQuery();
        int id = rs.getInt("id");


        preparedStatement = connection.prepareStatement("INSERT INTO client(id, name, phone, experience, email) VALUES(?, ?, ?, ?, ?)");
        preparedStatement.setInt(1,id + 1);
        preparedStatement.setString(2,getName());
        preparedStatement.setString(3,getPhone());
        preparedStatement.setInt(4,getExperience());
        preparedStatement.setString(5,getEmail());
        preparedStatement.execute();

    }
}
