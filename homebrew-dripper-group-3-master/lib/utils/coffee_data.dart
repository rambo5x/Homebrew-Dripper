import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/models/coffee_resource.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep(text: "Add 360g water", time: 30),
    RecipeStep(text: "Cover and wait", time: 90),
    RecipeStep(text: "Stir", time: 15),
    RecipeStep(text: "Cover and wait", time: 75),
    RecipeStep(text: "Stir", time: 15),
  ];

  int time = 0;
  for (RecipeStep step in steps) {
    time += step.time;
  }

  CoffeeRecipe recipe = CoffeeRecipe(
      name: "Sweet Maria's",
      coffeeVolumeGrams: 22,
      waterVolumeGrams: 360,
      grindSize: "finely ground coffee",
      miscDetails: "The original recipe: makes one delicious cup",
      steps: steps,
      totalTime: time);
  return recipe;
}

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep(text: "Add 50g water", time: 30),
    RecipeStep(text: "Cover and wait", time: 30),
    RecipeStep(text: "Add 400g water", time: 60),
    RecipeStep(text: "Cover and wait", time: 120),
  ];

  int time = 0;
  for (RecipeStep step in steps) {
    time += step.time;
  }

  CoffeeRecipe recipe = CoffeeRecipe(
      name: "PTs Clever Dripper",
      coffeeVolumeGrams: 25,
      waterVolumeGrams: 450,
      grindSize: "medium-coarse ground coffee",
      miscDetails: "Frenchie, drip, best of both worlds.",
      steps: steps,
      totalTime: time);
  return recipe;
}

CoffeeRecipe makeTCSrecipe() {
  List<RecipeStep> steps = [
    RecipeStep(text: "Vigorously add 100g water", time: 30),
    RecipeStep(text: "Cover and wait", time: 30),
    RecipeStep(text: "Slowly add 240g water", time: 90),
    RecipeStep(text: "Begin draining", time: 90),
  ];

  int time = 0;
  for (RecipeStep step in steps) {
    time += step.time;
  }

  CoffeeRecipe recipe = CoffeeRecipe(
      name: "Texas Coffee School",
      coffeeVolumeGrams: 24,
      waterVolumeGrams: 340,
      grindSize: "coarse ground coffee",
      miscDetails: "The better tasting clever dripper coffee.",
      steps: steps,
      totalTime: time);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep(text: "Add 50g water", time: 30),
    RecipeStep(text: "Cover and wait", time: 30),
    RecipeStep(text: "Add 295g water", time: 60),
    RecipeStep(text: "Stir, Cover, and wait", time: 20),
    RecipeStep(text: "Begin draining", time: 75),
  ];

  int time = 0;
  for (RecipeStep step in steps) {
    time += step.time;
  }

  CoffeeRecipe recipe = CoffeeRecipe(
      name: "Homegrounds",
      coffeeVolumeGrams: 23,
      waterVolumeGrams: 345,
      grindSize: "medium-coarse ground coffee",
      miscDetails: "A full-bodied cup with exceptional clarity.",
      steps: steps,
      totalTime: time);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [makeSweetMariasRecipe(), makePTsRecipe(), makeTCSrecipe(), makeHomegroundsRecipe()];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}

// Resources GETTER for the Homebrew App
List<CoffeeResource> getAllResources() {
  return [
    CoffeeResource(title: "Coffee", link: '1'),
    CoffeeResource(title: "Grinders", link: '2'),
    CoffeeResource(title: "Kettles", link: '3'),
    CoffeeResource(title: "Clever Dripper", link: '4'),
  ];
}

// Class/Object to be called + created
class ResourceData {
  static List<CoffeeResource> loadResources(){
    return getAllResources();
  }
}