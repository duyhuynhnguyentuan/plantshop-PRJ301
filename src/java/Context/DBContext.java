/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 */
public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            //Change the username password and url to connect your own database
            String IP = "localhost";
            String instanceName = "LAPTOP-OMA268JV\\SQLEXPRESS";
            String port = "1433";
            String uid = "sa";
            String pwd = "12345";
            String db = "MyShop";
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                    + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
            Class.forName(driver);
            connection = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}