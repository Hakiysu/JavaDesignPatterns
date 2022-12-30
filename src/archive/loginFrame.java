package archive.main;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class loginFrame {
    private String driver;
    //url是数据库的服务地址
    private String url;
    private String user;
    private String password;
    //登入界面的GUI组件
    private JFrame jf = new JFrame("登入");
    private JTextField userField = new JTextField(20);
    private JTextField passwordField = new JTextField(20);
    private JButton loginButton = new JButton("登入");

    public void init() throws Exception {
        driver = "com.mysql.cj.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/javasjmsdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        user = "root";
        password = "hakiysu@MYSQLDB233";
        Connection conn = null;
        Statement stmt = null;
        //加载驱动
        Class.forName(driver);
        //为登入按钮添加事件监听器
        loginButton.addActionListener(e -> {
            //登入成功则显示"登入成功"
            if (validate(userField.getText(), passwordField.getText()) != 0) {
                JOptionPane.showMessageDialog(jf, "登入成功");
            }
            else {
                JOptionPane.showMessageDialog(jf, "登入失败");
            }
        });
        jf.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });
        jf.add(userField, BorderLayout.NORTH);
        jf.add(passwordField);
        jf.add(loginButton, BorderLayout.SOUTH);
        jf.pack();
        jf.setVisible(true);
    }

    private int validate(String userName, String userPass) {
        //执行查询SQL语句
        var sql = "select*from userdata " + "where username='" + userName + "' and passwd ='" + userPass + "'";
        System.out.println(sql);
        try (Connection conn = DriverManager.getConnection(url, user, password); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            //如果查询的ResultSet里有超过一条的记录，则登入成功
            if (rs.next()) {
                //0 not exist, 1 client, 2 factory, 3 admin
                return rs.getInt("accountLevel");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
