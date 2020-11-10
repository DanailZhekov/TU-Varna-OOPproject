

import java.sql.*;

public class query {

    private Connection connection;
    private String make;
    private String model;
    private String classof;
    private Date year;
    private String engine;
    private String category;

    public query(Connection connection) {
        this.connection = connection;
    }

    public query() {

    }

    public void setConnection(Connection connection){
        this.connection = connection;
    }
    public void print() {
        System.out.printf("%s %s %s %tY %s %s \n",
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
                "INNER JOIN category ON model.category_id = category.id \n" +
                "WHERE cars.id NOT IN (SELECT rent.cars_id FROM rent) OR \n" +
                "SYSDATE NOT BETWEEN rent.daysfrom AND rent.daysto");
        ResultSet result = preparedStatement.executeQuery();
        while(result.next()){
            make =  result.getString("make");
            model = result.getString("model");
            classof = result.getString("class");
            category = result.getString("category");
            engine = result.getString("engine");
            year = result.getDate("year");

            print();

        }
    }


}
