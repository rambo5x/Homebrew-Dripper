import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps; // list of steps per this recipe
  int totalTime;

  CoffeeRecipe({this.name, this.coffeeVolumeGrams, this.waterVolumeGrams,  this.grindSize,
  this.miscDetails, this.steps,  this.totalTime}) :
  assert(name.isNotEmpty, "Name cannot be an empty string."),
  assert(coffeeVolumeGrams > 0, "CoffeeGrams cannot be equal to, or less than 0."),
  assert(waterVolumeGrams > 0, "WaterGrams cannot be equal to, or less than 0."),
  assert(grindSize.isNotEmpty, "grindSize cannot be an empty string."),
  assert(miscDetails.isNotEmpty, "miscDetails cannot be an empty string."),
  assert(steps.length > 0, "List<RecipeStep> cannot be empty."),
  assert(totalTime > 0, "Recipe time cannot be equal to, or less than 0.");

}
