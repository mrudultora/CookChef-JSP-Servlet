package com.cookchef.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Mrudul Tora (0801IT191049)
 * @author Preetam Pratyush Pal (0801IT191059)
 */
public class LoginSignUpDao {
	private final static String jdbcURL = "jdbc:mysql://localhost:3306/cookchef";
	private final static String jdbcUsername = "root";
	private final static String jdbcPassword = "mrudul*123";

	private final static String SQL_CHECK_IF_USER_EXISTS = "SELECT * FROM recipe_users where username = ? or email = ?";
	private final static String SQL_ADD_USER = "INSERT INTO recipe_users(username, email, password) VALUES (?,?,?)";
	private final static String SQL_FETCH_USER = "SELECT * FROM recipe_users where username = ? and password = ?";

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

	public boolean signUpNewUser(String username, String email, String password) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_CHECK_IF_USER_EXISTS);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, email);
			ResultSet rs = preparedStatement.executeQuery();
			rs.last();
			int rowCount = rs.getRow();
			if (rowCount > 0) {
				return false;
			}
			preparedStatement = connection.prepareStatement(SQL_ADD_USER);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, password);
			int rows = preparedStatement.executeUpdate();
			System.out.println("Rows: " + rows);
			return true;
		} catch (SQLException e) {
			printSQLException(e);
		}
		return false;
	}

	public boolean validateUser(String username, String password) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SQL_FETCH_USER);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();
			rs.last();
			int rowCount = rs.getRow();
			if (rowCount > 0) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			printSQLException(e);
		}
		return false;
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
