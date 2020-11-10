import oracle.ucp.proxy.annotation.Pre;

import java.awt.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import static java.sql.Types.NULL;

public class Engine implements Runnable {


    private Connection connection;

    public Engine(Connection connection) {
        this.connection = connection;
    }




    @Override
    public void run() {
        Client client = new Client(connection);
        query query = new query(connection);


        try {
            this.finalprice();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        try {
            query.freeCars();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    public long getDates(int id) throws SQLException{ //пресмятаме за колко дена колата е наета
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

        PreparedStatement preparedStatement = connection.prepareStatement("SELECT rent.daysFrom, rent.daysTo FROM rent WHERE id = ?");
        preparedStatement.setInt(1,id);

        Date from = new Date(NULL);
        Date to = new Date(NULL);
        ResultSet result = preparedStatement.executeQuery();

        while (result.next()) {
            from = result.getDate("daysFrom");
            to = result.getDate("daysTo");

        }
        long rentalDays = to.getTime() - from.getTime();//пресмята милисекундите между двете дати и след това ги умножаваме за да ги превърнем в дни
        long days = ((rentalDays) / (1000*60*60*24));  //милисекунди * секунди * минути * часове


        return days;

    }


    public void finalprice() throws SQLException {
        Scanner scanner = new Scanner(System.in);//скенер за четене на запис
        //System.out.println("id:");
        //int id = scanner.nextInt();


        //инициализация на променливи
        int cars_id = 0,client_id = 0;
        double km = 0,price = 0,finalprice = 0;
        long days = getDates(1) + 1; //взимаме дните от горната ни функция


        //Id на самото отдаване и изминатите километри.
        Statement statement;
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT rent.kilometers FROM rent WHERE id = ?");
        preparedStatement.setInt(1,1);

        ResultSet result = preparedStatement.executeQuery();
        while (result.next()) {
            km = result.getDouble("kilometers");
        }


        //взимаме id-то на колата и цената на за ден която вече сме задали в базата
        preparedStatement = connection.prepareStatement("SELECT cars.price,cars.id FROM rent INNER JOIN cars ON rent.cars_id = cars.id WHERE rent.id = ?");
        preparedStatement.setInt(1,1);

        result = preparedStatement.executeQuery();
        while(result.next()){
            price = result.getDouble("price");
            cars_id = result.getInt("id");
        }
        double diff = 0;
        if((days * 100) < km){  //при изминаване на повече от **еди си** колко км на ден се прибавя по 0.05 към всеки следващ километър.
            diff = km - (days * 10);
            diff = diff * 0.05;
        }


        //Пресмятане на опита на клиент
        preparedStatement = connection.prepareStatement("SELECT client.experience,client.id FROM rent INNER JOIN client ON rent.client_id = client.id WHERE rent.id = ?");
        preparedStatement.setInt(1,1);
        int exp = 0;
        result = preparedStatement.executeQuery();
        while(result.next()){
            client_id = result.getInt("id");
            exp = result.getInt("experience");
        }
        double discount = 0;
        finalprice = (price * days) + diff;//оригинална финална цена
        if(exp > 5 && exp < 10){//при опит между 5 и 10 години 5% намаление.
            System.out.print("the discount is 5% !");
            discount = (finalprice * 5)/100;
            finalprice -= discount;
        }
        else if(exp > 10 && exp < 15){//при опит между 10 и 15 години 8% намаление.
            System.out.print("the discount is 8% !");
            discount = (finalprice * 8)/100;
            finalprice -= discount;
        }
        else if(exp > 15){//при опит над 15 години 12% намаление.
            System.out.print("the discount is 12% !");
            discount = (finalprice * 12)/100;
            finalprice -= discount;
        }
        else System.out.print("these is no discount");


        //записваме данните за плащането в таблицата в базата данни.
        int p_id = 0;
        p_id++;
        preparedStatement = connection.prepareStatement("INSERT INTO payment (id, finalprice, cars_id, rent_id, client_id, problem_id) VALUES( ?, ?, ?, ?, ?, ?)");
        preparedStatement.setInt(1,p_id);
        preparedStatement.setDouble(2,finalprice);
        preparedStatement.setInt(3,cars_id);
        preparedStatement.setInt(4,1);
        preparedStatement.setInt(5,client_id);
        preparedStatement.setInt(6,1);
        preparedStatement.execute();
    }

}

