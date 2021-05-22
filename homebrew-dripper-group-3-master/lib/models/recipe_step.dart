class RecipeStep {
  String text;
  int time;
  
  RecipeStep({this.text, this.time}) : assert(text.isNotEmpty, "RecipeStep text cannot be an empty string."), 
  assert(time > 0, "RecipeStep time cannot be equal to, or less than 0.");
}
