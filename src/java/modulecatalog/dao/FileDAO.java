/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import modulecatalog.dbutil.DBConnection;

/**
 *
 * @author HP
 */
public class FileDAO {
    public static String getNewId() throws SQLException {
        Connection conn = DBConnection.getConnection();
        Statement st = conn.createStatement();
        int id = 101;
        ResultSet rs = st.executeQuery("select count(*) from query");
        if(rs.next()) {
            id = id + rs.getInt(1);
        }
        return "Q" + id;
    }
}
