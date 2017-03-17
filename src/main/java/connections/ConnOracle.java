package connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Jakub on 17.03.2017.
 */
public class ConnOracle {

    public Connection getConn() {

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("OracleDriver not found");
            e.printStackTrace();
            return null;
        }

        Connection connection;

        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:database", "jakub", "oracle");
        } catch (SQLException e) {
            System.out.println("Connection failed! Check output console");
            e.printStackTrace();
            return null;
        }

        if (connection != null) {
            System.out.println("CONNECTION SUCCESS");
            return connection;
        } else {
            System.out.println("Connection Failed");
            return null;
        }
    }

}
