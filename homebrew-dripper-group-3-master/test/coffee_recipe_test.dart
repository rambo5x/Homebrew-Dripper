import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Valid CoffeeRecipe(s):", () {
    test('Creates a recipe with valid parameters', () {

      List<RecipeStep> steps = [
        RecipeStep(text: "step 1", time: 1),
        RecipeStep(text: "step 2", time: 2),
        RecipeStep(text: "step 3", time: 3),
        RecipeStep(text: "step 4", time: 4),
      ];

      int time = 0;
      for (RecipeStep step in steps) {
        time += step.time;
      }

      CoffeeRecipe x = CoffeeRecipe(
          name: 'Test1',
          coffeeVolumeGrams: 30,
          waterVolumeGrams: 400,
          grindSize: "coarse ground coffee",
          miscDetails: "a very strong cup",
          steps: steps,
          totalTime: time);

      //check that it has the right data
      expect(x.name, 'Test1');
      expect(x.coffeeVolumeGrams, 30);
      expect(x.waterVolumeGrams, 400);
      expect(x.grindSize, "coarse ground coffee");
      expect(x.miscDetails, "a very strong cup");
      expect(x.steps.length, 4);
      expect(x.totalTime, 10);
    });
  });
  group("AssertionError on invalid CoffeeRecipe(s):", () {
    test('Recipe name is empty or NULL', () {
      expect(() { CoffeeRecipe(name: '');}, throwsAssertionError);
    });
    test('Recipe coffeeVolumeGrams is <= 0 or NULL', () {
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: 0);}, throwsAssertionError);
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: -1);}, throwsAssertionError);
    });
    test('Recipe waterVolumeGrams is <= 0 or NULL', () {
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: 1, waterVolumeGrams: 0);}, throwsAssertionError);
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: 1, waterVolumeGrams: -1);}, throwsAssertionError);
    });
    test('Recipe grindSize is empty or NULL', () {
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: 1, waterVolumeGrams: 1, grindSize: '');}, throwsAssertionError);
    });
    test('Recipe miscDetails is empty or NULL', () {
      expect(() { CoffeeRecipe(name: 'valid', coffeeVolumeGrams: 1, waterVolumeGrams: 1, grindSize: 'valid',miscDetails: '');}, throwsAssertionError);
    });
    test('Recipe steps.length is <= 0', () {
      List<RecipeStep> steps = [];
      expect(() { CoffeeRecipe(name: 'test', coffeeVolumeGrams: 1, waterVolumeGrams: 1, grindSize: 'valid', miscDetails: 'valid', steps: steps);}, throwsAssertionError); // steps == 0
    });

    test('Recipe totalTime is <= 0', (){
      // a valid list of steps 
      List<RecipeStep> steps = [RecipeStep(text: 'valid', time: 1)];

      // Assuming that a totalTime of '0' makes it past the RecipeStep Time Assertion Rule
      // Here, we are manually inputing '0' for the totalTime parameter, to check for error as a 2nd filter.
      expect(() { CoffeeRecipe(name: 'test', coffeeVolumeGrams: 1, waterVolumeGrams: 1, grindSize: 'valid', miscDetails: 'valid', steps: steps, totalTime: 0 );}, throwsAssertionError);
    });
  });
}
