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
public class RecipeDao {
	private final static String jdbcURL = "jdbc:mysql://localhost:3306/cookchef";
	private final static String jdbcUsername = "root";
	private final static String jdbcPassword = "mrudul*123";

	private static final String SQL_INSERT_RECIPE = "INSERT INTO recipe_table (title, cooking_time, recipe, ingredients, image_name, userid) VALUES (?,?,?,?,?,?)";
	private static final String SQL_SELECT_ALL_RECIPES = "SELECT * FROM recipe_table";
	private static final String SQL_DELETE_RECIPE = "DELETE FROM recipe_table where id = ?";
	private static final String SQL_UPDATE_RECIPE = "UPDATE recipe_table SET title = ?, cooking_time= ?, recipe = ?, ingredients = ?, image_name = ? where id = ?";
	private static final String SQL_GET_RECIPE = "SELECT * FROM recipe_table where id = ?";

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

	public void insertRecipe(RecipeModel recipeModel) {
		// try-with-resource statement will auto close the connection.
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_RECIPE);
			preparedStatement.setString(1, recipeModel.getTitle());
			preparedStatement.setInt(2, recipeModel.getCookingTime());
			preparedStatement.setString(3, recipeModel.getRecipe());
			preparedStatement.setString(4, recipeModel.getIngredients());
			preparedStatement.setString(5, recipeModel.getImageFileName());
			preparedStatement.setInt(6, recipeModel.getUserId());
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
				int userId = rs.getInt("userid");
				users.add(new RecipeModel(id, title, cookingTime, recipe, ingredients, imageFileName, userId));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteRecipe(int id) {
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

	public boolean updateRecipe(RecipeModel recipeModel, int id) {
		boolean rowUpdated = false;
		try {
			Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_RECIPE);
			statement.setString(1, recipeModel.getTitle());
			statement.setInt(2, recipeModel.getCookingTime());
			statement.setString(3, recipeModel.getRecipe());
			statement.setString(4, recipeModel.getIngredients());
			statement.setString(5, recipeModel.getImageFileName());
			statement.setInt(6, id);
			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			printSQLException(e);
		}
		return rowUpdated;
	}

	public RecipeModel getRecipe(int id) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_RECIPE);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String title = rs.getString("title");
				int cookingTime = rs.getInt("cooking_time");
				String recipe = rs.getString("recipe");
				String ingredients = rs.getString("ingredients");
				String imageFileName = rs.getString("image_name");
				int userId = rs.getInt("userid");
				RecipeModel recipeModel = new RecipeModel(id, title, cookingTime, recipe, ingredients, imageFileName,
						userId);
				return recipeModel;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return null;
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
