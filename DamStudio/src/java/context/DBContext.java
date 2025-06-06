/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "root"; // Your MySQL username

            String pass = "sa123"; // Your MySQL password

            String url = "jdbc:mysql://localhost:3306/damstudio"; // MySQL URL format - your schema name
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL driver class
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Driver class not found", e);
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public Connection getConnection() {
        return connection;
    }

    // Method to close the connection if needed
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Failed to close the connection", e);
            }
        }
    }

    public static void main(String[] args) {
    }
}
