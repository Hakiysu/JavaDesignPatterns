package sqlconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class orderManager {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWD = "hakiysu@MYSQLDB233";
    Connection conn = null;
    Statement stmt = null;

    public void sqlExchangerInit() {
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

    public int getOrderNumber() {
        int orderNumber = 0;
        try {
            String sql = "SELECT * FROM orderstatus";
            stmt.executeUpdate(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                orderNumber = rs.getInt("orderNumber");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderNumber;
    }

    public int orderInsert(String username, String goods, String address, String getMethod) {
        int orderNumber = 0;
        try {
            String nowTime = String.valueOf(System.currentTimeMillis());
            orderNumber = getOrderNumber();
            String sql = "insert into orderstatus(orderID, orderMaker, orderReceiveFactory, orderItem, orderStatus,orderSendMethod) values('" + orderNumber + "','" + username + "','" + address + "','" + goods + "','0','" + getMethod + "')";
            stmt.executeUpdate(sql);
            logger.logRecord(username, nowTime, "0", sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderNumber;
    }

    public void orderDelete(String orderID) {
        try {
            String sql = "delete from orderstatus where orderID = '" + orderID + "'";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
