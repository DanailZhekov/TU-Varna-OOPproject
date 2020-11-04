import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connect {
    public static void main(String[] args) throws SQLException {
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

        //връзка с базата данни
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "CHOX", "pass");

        Engine engine = new Engine(connection);
        engine.run();
    }
}
