package _comm.javabean;


public class RecipeReply {
	private String id;
	private int recipe_code;
	private int recipe_re_seq;
	private String recipe_re_content;
	private String recipe_re_date;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRecipe_code() {
		return recipe_code;
	}

	public void setRecipe_code(int recipe_code) {
		this.recipe_code = recipe_code;
	}

	public int getRecipe_re_seq() {
		return recipe_re_seq;
	}

	public void setRecipe_re_seq(int recipe_re_seq) {
		this.recipe_re_seq = recipe_re_seq;
	}

	public String getRecipe_re_content() {
		return recipe_re_content;
	}

	public void setRecipe_re_content(String recipe_re_content) {
		this.recipe_re_content = recipe_re_content;
	}

	public String getRecipe_re_date() {
		return recipe_re_date;
	}

	public void setRecipe_re_date(String recipe_re_date) {
		this.recipe_re_date = recipe_re_date;
	}

	public RecipeReply() {
		
	}
}
