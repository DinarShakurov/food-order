package ru.itis.web_project.DAO;

import ru.itis.web_project.utils.ConnectionJDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDAO {
    private static final Connection connection = ConnectionJDBC.getConnection();

    public static String getNameById(Integer id) {
        String sqlQuery = "SELECT name FROM role WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sqlQuery)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
