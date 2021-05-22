import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    //get total time
    var total = Duration(seconds: recipe.totalTime);
    //convert total time into a mm:ss format
    String sTotal =
        "${total.inMinutes.remainder(60).toString().padLeft(2, '0')}:${total.inSeconds.remainder(60).toString().padLeft(2, '0')}";
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Align(
            //call the back button classs
            child: BackButton(),
            alignment: Alignment(-1.0, 1.0),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
            //call recipe overview class
            child: RecipeOverview(recipe),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              //step and total text widgets
              Text(
                "Steps",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    letterSpacing: 1.6,
                    color: Color(0xff4c748b),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(115, 15, 125, 15),
              ),
              Text(
                "Total: ${sTotal}",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    letterSpacing: 1.6,
                    color: Color(0xff4c748b),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          //call step list class
          StepList(recipe),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 30, 18, 140),
            //start button class call
            child: StartButton(recipe),
          ),
        ],
      ),
    );
  }
}

class RecipeOverview extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeOverview(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 387,
        height: 210,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff4c748b),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                recipe.name,
                style: TextStyle(
                    letterSpacing: 1.6,
                    fontFamily: 'Kollektif',
                    color: Color(0xff4c748b),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                key: Key("recipe-title2"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                height: 1.0,
                color: Color(0xff4c748b),
                thickness: 1.5,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(
                "${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}",
                key: Key("coffee-volume-text"),
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    letterSpacing: 1.6,
                    color: Color(0xff4c748b),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "${recipe.waterVolumeGrams}g - water",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    letterSpacing: 1.6,
                    color: Color(0xff4c748b),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(
                "${recipe.miscDetails}",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.6,
                    color: Color(0xff4c748b),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepList extends StatelessWidget {
  CoffeeRecipe recipe;

  StepList(this.recipe);

  @override
  Widget build(BuildContext context) {
    List<RecipeStep> step = recipe.steps;
    //Function to convert current step seconds to mm:ss format
    String MSFormat(int secs) {
      var x = Duration(seconds: secs);
      String minSec =
          "${x.inMinutes.remainder(60).toString().padLeft(2, '0')}:${x.inSeconds.remainder(60).toString().padLeft(2, '0')}";
      return minSec;
    }

    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: step.length,
            itemBuilder: (context, i) {
              return Center(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: 390,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: Color(0xFF4C748B), width: 2.5)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                            ),
                            Text(
                              step[i].text,
                              style: TextStyle(
                                  fontFamily: 'Kollektif',
                                  fontSize: 12,
                                  letterSpacing: 1.6,
                                  color: Color(0xFF4C748B),
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(
                              flex: 20,
                            ),
                            Text(
                              MSFormat(step[i].time),
                              style: TextStyle(
                                  fontFamily: 'Kollektif',
                                  fontSize: 12,
                                  letterSpacing: 1.6,
                                  color: Color(0xFF4C748B),
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ])));
            }),
      ],
    );
  }
}

//Decorated Back Button
class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            key: Key('back-button-overview'),
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff4c748b)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}

//Decorated Start Button
class StartButton extends StatelessWidget {
  CoffeeRecipe recipe;

  StartButton(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              primary: Color(0xff4c748b),
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
              textStyle: TextStyle(
                  fontSize: 14, fontFamily: 'Montserrat', letterSpacing: 1.2)),
          child: Text("Start", key: Key('start-button')),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeStepsScreen(recipe)),
            );
          },
        )),
      ],
    );
  }
}
