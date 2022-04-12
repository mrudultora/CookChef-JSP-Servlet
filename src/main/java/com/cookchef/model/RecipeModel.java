package com.cookchef.model;

/**
 * @author Mrudul Tora (0801IT191049)
 * @author Preetam Pratyush Pal (0801IT191059)
 */
public class RecipeModel {
	private int id;
	private String title;
	private int cookingTime;
	private String recipe;
	private String ingredients;
	private String imageFileName;

	public RecipeModel(String title, int cookingTime, String recipe, String ingredients, String imageFileName) {
		this.title = title;
		this.cookingTime = cookingTime;
		this.recipe = recipe;
		this.ingredients = ingredients;
		this.imageFileName = imageFileName;
	}

	public RecipeModel(int id, String title, int cookingTime, String recipe, String ingredients,
			String imageFileName) {
		this.id = id;
		this.title = title;
		this.cookingTime = cookingTime;
		this.recipe = recipe;
		this.ingredients = ingredients;
		this.imageFileName = imageFileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

}
