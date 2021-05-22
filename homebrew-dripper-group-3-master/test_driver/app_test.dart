// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Happy Paths', () {
    /*
    Given I am on the Selection Screen 
    And I tap on “Sweet Maria’s”,
    And I see “22g - finely ground coffee”
    And I see “360g - water”
    And I see “total: 4:00”

    When I click start 
    And then I see “30”
    And I see “add 360g of water” 

    When I see "90"
    And then I see "Cover and wait"

    When I see "15"
    And then I see "Stir"

    When I see "75"
    And then I see "Cover and wait"

    When I see "15"
    And then I see "Stir"

    Then I should see “enjoy your amazing homemade coffee”
    */
    test("should give recommendation for Sweet Maria's", () async {
      // recipe selection screen
      final findCoffeeRecipeTxt = find.byValueKey('coffee-recipes');
      final pressRecipeBtn = find.byValueKey("recipe-Sweet Maria's");
      // recipe details screen
      final findRecipeTitle = find.byValueKey('recipe-title2');
      final pressStartBtn = find.byValueKey('start-button');
      // recipe step screen
      final currentStep = find.byValueKey('current-step');
      // done screen
      final getDoneTxt = find.byValueKey('done-key');
      final getDoneBtn = find.byValueKey('done-btn-key');

      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
      await driver.tap(pressRecipeBtn);
      expect(await driver.getText(findRecipeTitle), "Sweet Maria's");
      await driver.tap(pressStartBtn);

      expect(await driver.getText(currentStep), "Add 360g water");
      await Future.delayed(const Duration(seconds: 31), () {});
      expect(await driver.getText(currentStep), "Cover and wait");
      await Future.delayed(const Duration(seconds: 91), () {});
      expect(await driver.getText(currentStep), "Stir");
      await Future.delayed(const Duration(seconds: 16), () {});
      expect(await driver.getText(currentStep), "Cover and wait");
      await Future.delayed(const Duration(seconds: 76), () {});
      expect(await driver.getText(currentStep), "Stir");
      await Future.delayed(const Duration(seconds: 16), () {});
      expect(await driver.getText(getDoneTxt),
          'enjoy your amazing\n handmade coffee');
      await driver.tap(getDoneBtn);
    }, timeout: Timeout(Duration(minutes: 5)));

    test("should give recommendation for PTs Clever Dripper Recipe", () async {
      await driver.requestData('restart');

      // recipe selection screen
      final findCoffeeRecipeTxt = find.byValueKey('coffee-recipes');
      final pressRecipeBtn = find.byValueKey("recipe-PTs Clever Dripper");
      // recipe details screen
      final findRecipeTitle = find.byValueKey('recipe-title2');
      final pressStartBtn = find.byValueKey('start-button');
      // recipe step screen
      final currentStep = find.byValueKey('current-step');
      // done screen
      final getDoneTxt = find.byValueKey('done-key');
      final getDoneBtn = find.byValueKey('done-btn-key');

      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
      await driver.tap(pressRecipeBtn);
      expect(await driver.getText(findRecipeTitle), "PTs Clever Dripper");
      await driver.tap(pressStartBtn);

      expect(await driver.getText(currentStep), "Add 50g water");
      await Future.delayed(const Duration(seconds: 31), () {});
      expect(await driver.getText(currentStep), "Cover and wait");
      await Future.delayed(const Duration(seconds: 31), () {});
      expect(await driver.getText(currentStep), "Add 400g water");
      await Future.delayed(const Duration(seconds: 61), () {});
      expect(await driver.getText(currentStep), "Cover and wait");
      await Future.delayed(const Duration(seconds: 121), () {});
      expect(await driver.getText(getDoneTxt),
          'enjoy your amazing\n handmade coffee');
      await driver.tap(getDoneBtn);
    }, timeout: Timeout(Duration(minutes: 5)));
  });
  group('Sad Paths', () {
    //Given I am at the Selection Screen
    //When I don't press anything
    //Then I should still be at the Selection Screen
    //
    test("should not advance from choose recipe screen without a selection",
        () async {
      await driver.requestData('restart');

      final recipeTitleScreenText = find.byValueKey('coffee-recipes');
      await driver.tap(recipeTitleScreenText);
      expect(await driver.getText(recipeTitleScreenText), "Coffee Recipes");
    });

    //Given I am at the "Sweet Maria's" Recipe screen
    //when I don't tap start
    //then I should still be at the "Sweet Maria's" Screen
    test(
        "should not advance from PTs Recipe overview screen without pressing start",
        () async {
      await driver.requestData('restart');

      final recipeOptionButton = find.text("PTs Clever Dripper");
      await driver.tap(recipeOptionButton);

      final recipeTitleText = find.byValueKey('recipe-title2');
      expect(await driver.getText(recipeTitleText), "PTs Clever Dripper");

      final coffeeVolumeTextFinder = find.byValueKey('coffee-volume-text');
      await driver.tap(coffeeVolumeTextFinder);
    });

    //Given I am at the "PTs" Recipe screen
    //and I tap start
    //when the timer starts counting down for the at least the first step
    //and the timer is at 0 after 5s for all steps
    //then I should see the done message at the end
    test(
        "check that timer exists by checking the timer at certain time interval",
        () async {
      await driver.requestData('restart');

      // final recipeTitleText = find.byValueKey("recipe-PTs Clever Dripper");
      // expect(await driver.getText(recipeTitleText), "PTs Clever Dripper");
      final recipeOptionButton = find.text("PTs Clever Dripper");
      await driver.tap(recipeOptionButton);

      final startButton = find.byValueKey('start-button');
      await driver.tap(startButton);

      final currentStepTime = find.byValueKey('current-time');
      await Future.delayed(const Duration(seconds: 30), () {});

      expect(await driver.getText(currentStepTime), "1");

      //done text
      await Future.delayed(const Duration(seconds: 210), () {});
      final doneTextFinder = find.byValueKey('done-key');
      final getDoneBtn = find.byValueKey('done-btn-key');
      expect(await driver.getText(doneTextFinder),
          'enjoy your amazing\n handmade coffee');
      await driver.tap(getDoneBtn);
    }, timeout: Timeout(Duration(minutes: 5)));
  });
  group('Back Button', () {
    /*Given I am on the Recipe Selection Screen
      and I tap Sweet Marias Recipe
      when the correct recipe name is found
      and the back button exists
      then I should go back to the Recipe Selection Screen
      */
    test("checks recipe detail screen back button for Sweet Maria's Recipe",
        () async {
      //your code here
      final findCoffeeRecipeTxt = find.byValueKey('coffee-recipes');
      final findRecipeTitle = find.byValueKey('recipe-title2');
      final pressRecipeBtn = find.byValueKey("recipe-Sweet Maria's");
      final pressBackDetailButton = find.byValueKey('back-button-overview');

      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
      await driver.tap(pressRecipeBtn);
      expect(await driver.getText(findRecipeTitle), "Sweet Maria's");
      await driver.tap(pressBackDetailButton);
      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
    });

    /*Given I am on the Recipe Selection Screen
      and I tap PTs Clever Recipe
      when the correct recipe name is found
      and the back button exists
      then I should go back to the Recipe Selection Screen
      */
    test("checks recipe detail screen back button for PTs Clever Recipe",
        () async {
      //your code here
      final findCoffeeRecipeTxt = find.byValueKey('coffee-recipes');
      final findRecipeTitle = find.byValueKey('recipe-title2');
      final pressRecipeBtn = find.byValueKey("recipe-PTs Clever Dripper");
      final pressBackDetailButton = find.byValueKey('back-button-overview');

      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
      await driver.tap(pressRecipeBtn);
      expect(await driver.getText(findRecipeTitle), "PTs Clever Dripper");
      await driver.tap(pressBackDetailButton);
      expect(await driver.getText(findCoffeeRecipeTxt), 'Coffee Recipes');
    });
  });
}
