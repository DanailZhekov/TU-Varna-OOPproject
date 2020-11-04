import java.sql.Connection;

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
}
