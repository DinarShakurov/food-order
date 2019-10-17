package ru.itis.web_project.DAO;

import ru.itis.web_project.models.DishCategory;
import ru.itis.web_project.utils.ConnectionJDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DishCategoryDAO {
    private static final Connection connection = ConnectionJDBC.getConnection();

    public static void insertCategory(DishCategory dishCategory) {
        String sqlQuery = "INSERT INTO dish_category (categ_name) VALUE ?";
        try (PreparedStatement ps = connection.prepareStatement(sqlQuery)) {
            ps.setString(1, dishCategory.getCateg_name());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
