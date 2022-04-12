package com.cookchef.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cookchef.model.RecipeModel;

/**
 * @author Mrudul Tora (0801IT191049)
 * @author Preetam Pratyush Pal (0801IT191059)
 */
public class AddRecipeDao {
	private final static String jdbcURL = "jdbc:mysql://localhost:3306/cookchef";
	private final static String jdbcUsername = "root";
	private final static String jdbcPassword = "mrudul*123";

	private static final String SQL_INSERT_RECIPE = "INSERT INTO recipe_table (title, cooking_time, recipe, ingredients, image_name) VALUES (?,?,?,?,?)";
	private static final String SQL_SELECT_ALL_RECIPES = "SELECT * FROM recipe_table";
	private static final String SQL_DELETE_RECIPE = "DELETE FROM recipe_table where id = ?;";
	private static final String SQL_UPDATE_RECIPE = "UPDATE recipe_table SET title = ?, cooking_time= ?, recipe = ?, ingredients = ?, image_name = ? where id = ?;";

	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void insertRecipe(RecipeModel user) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_RECIPE);
			preparedStatement.setString(1, user.getTitle());
			preparedStatement.setInt(2, user.getCookingTime());
			preparedStatement.setString(3, user.getRecipe());
			preparedStatement.setString(4, user.getIngredients());
			preparedStatement.setString(5, user.getImageFileName());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public List<RecipeModel> getAllRecipes() {
		List<RecipeModel> users = new ArrayList<>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_RECIPES);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				int cookingTime = rs.getInt("cooking_time");
				String recipe = rs.getString("recipe");
				String ingredients = rs.getString("ingredients");
				String imageFileName = rs.getString("image_name");
				users.add(new RecipeModel(id, title, cookingTime, recipe, ingredients, imageFileName));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted = false;
		try {
			Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(SQL_DELETE_RECIPE);
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			printSQLException(e);
		}
		return rowDeleted;
	}

	public boolean updateUser(RecipeModel user) throws SQLException {
		boolean rowUpdated = false;
		try {
			Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_RECIPE);
			statement.setString(1, user.getTitle());
			statement.setInt(2, user.getCookingTime());
			statement.setString(3, user.getRecipe());
			statement.setString(4, user.getIngredients());
			statement.setString(5, user.getImageFileName());
			statement.setInt(6, user.getId());
			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			printSQLException(e);
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
