import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];
    String MSFormat(int secs) {
      var x = Duration(seconds: secs);
      String minSec =
          "${x.inMinutes.remainder(60).toString().padLeft(2, '0')}:${x.inSeconds.remainder(60).toString().padLeft(2, '0')}";
      return minSec;
    }

    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(40.0),
                ),
                Text(
                  "$stepTimeRemaining",
                  key: Key("current-time"),
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'Kollektif',
                      color: Colors.white,
                      fontSize: 96,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                ),
                Text(
                  "${currentRecipeStep.text}",
                  key: Key("current-step"),
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'Kollektif',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              Text(
                "Steps",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    letterSpacing: 1.6,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(115, 15, 125, 15),
              ),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: remainingSteps.length,
              itemBuilder: (context, i) {
                return Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        width: 390,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color:
                                    i == 0 ? Colors.white : Colors.transparent,
                                width: 2.5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                              ),
                              Text(
                                remainingSteps[i].text,
                                style: TextStyle(
                                    fontFamily: 'Kollektif',
                                    fontSize: 12,
                                    letterSpacing: 1.6,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(
                                flex: 20,
                              ),
                              Text(
                                MSFormat(remainingSteps[i].time),
                                style: TextStyle(
                                    fontFamily: 'Kollektif',
                                    fontSize: 12,
                                    letterSpacing: 1.6,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ])));
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
