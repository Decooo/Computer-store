package runner;

import connections.ConnOracle;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Jakub on 17.03.2017.
 */
public class MainRunner {
    public static void main(String[] args) {
        ConnOracle connOracle = new ConnOracle();
        Connection conn = connOracle.getConn();
        if (conn != null) {
            try {
                conn.close();
                System.out.println("connection close!");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
