package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connect {

    public static Connection connectDB() throws SQLException {
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
        //връзка с базата данни
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "CHOX", "pass");
        return connection;
    }

}
