import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/coffee_resource.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF3F3F3),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(87, 0, 87, 11),
            child: Text("Coffee Recipes",
                style: TextStyle(
                    color: Color(0xFF4C748B),
                    fontFamily: 'Kollektif',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.6),
                key: Key("coffee-recipes")),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(19, 0, 19, 35),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Color(0xFF4C748B)),
                ),
                child: RecipeList()),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(120, 0, 120, 16),
            child: Text(
              "Resources",
              style: TextStyle(
                  color: Color(0xFF4C748B),
                  fontFamily: 'Kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.6),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Color(0xFF4C748B)),
                ),
                child: ResourceList()),
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, i) =>
            Divider(height: 1, color: Colors.black),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: recipes.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(recipes[i].name,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    letterSpacing: 1.6,
                    color: Color(0xFF4C748B),
                    fontWeight: FontWeight.w500),
                key: Key('recipe-' + recipes[i].name)),
            trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(recipes[i])),
              );
            },
          );
        });
  }
}

class ResourceList extends StatelessWidget {
  final List<CoffeeResource> resources = ResourceData.loadResources();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, i) =>
            Divider(height: 1, color: Colors.black),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: resources.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(resources[i].title,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    letterSpacing: 1.6,
                    color: Color(0xFF4C748B),
                    fontWeight: FontWeight.w500),
                key: Key('recipe-' + resources[i].title)),
            trailing: Icon(Icons.chevron_right, color: Color(0xFF4C748B)),
            onTap: () {
              //TODO: ADD HTTPS REQUEST
              String url = 'https://www.homegrounds.co/coffee-recipes/';
              switch (resources[i].title) {
                case "Coffee":
                  {
                    launchURL(url);
                  }
                  break;

                case "Grinders":
                  {
                    url =
                        'https://www.homegrounds.co/best-hand-coffee-grinders/';
                    launchURL(url);
                  }
                  break;

                case "Kettles":
                  {
                    url =
                        'https://www.homegrounds.co/lp/best-pour-over-coffee-kettles-gooseneck-kettles-of-2020/';
                    launchURL(url);
                  }
                  break;

                case "Clever Dripper":
                  {
                    url = 'https://www.homegrounds.co/clever-dripper-recipe/';
                    launchURL(url);
                  }
                  break;
              }
            },
          );
        });
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
