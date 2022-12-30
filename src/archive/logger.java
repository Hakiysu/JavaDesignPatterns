package archive.sqlconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class logger {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/javasjmslog?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWD = "hakiysu@MYSQLDB233";
    static Connection conn = null;
    static Statement stmt = null;

    public static void sqlExchangerInit() {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASSWD);
            stmt = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sqlExchangerClose() {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //send sql log to db
    public static void logRecord(String username, String sendTime, String accountLevel, String sqlCommand) {
        try {
            sqlExchangerInit();
            String sql = "INSERT INTO log(username,sendTime,accountLevel,sqlCommand) VALUES ('" + username + "','" + sendTime + "','" + accountLevel + "','" + sqlCommand + "')";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}