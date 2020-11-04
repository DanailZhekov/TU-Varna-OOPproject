

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class query {

    private Connection connection;
    private String make;
    private String model;
    private String classof;
    private int year;
    private String engine;
    private String category;

    public query(Connection connection) {
        this.connection = connection;
    }

    public query() {

    }

    public void print() {
        System.out.printf("%s %s %s %d %s %s",
                make,model,engine,year,classof,category);

    }
    public void freeCars() throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT make.make,\n" +
                "model.model,\n" +
                "model.year,\n" +
                "cars.engine,\n" +
                "class.class,\n" +
                "category.category\n" +
                "FROM rent \n" +
                "INNER JOIN cars ON rent.cars_id = cars.id\n" +
                "INNER JOIN model ON cars.model_id = model.id\n" +
                "INNER JOIN make ON model.make_id = make.id\n" +
                "INNER JOIN class ON model.class_id = class.id\n" +
                "INNER JOIN category ON model.category_id = category.id;\n");
        ResultSet result = preparedStatement.executeQuery();
        while(result.next()){
           make =  result.getString("make.make");
           model = result.getString("model.model");
           classof = result.getString("class.class");
           category = result.getString("category.category");
           engine = result.getString("cars.engine");
           year = result.getInt("model.year");

           print();
        }
    }


}
