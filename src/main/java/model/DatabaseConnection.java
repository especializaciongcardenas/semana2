/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author gcardenas
 */
public class DatabaseConnection {

public static final String Server = "";
public static final String User = "";
public static final String Password = "";

public static Connection connect(){
    
    Connection conn = null;
        try {
            conn = DriverManager.getConnection(Server, User, Password);
            System.out.println("Connection to MySQL has been established.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
}   
}
