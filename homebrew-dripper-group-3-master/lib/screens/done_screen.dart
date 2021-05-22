import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 375),
            child: Text(
              'enjoy your amazing\n handmade coffee',
              key: Key("done-key"),
              style: new TextStyle(
                color: Color(0xFF4C748B),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: FlatButton(
                  key: Key("done-btn-key"),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => RecipeSelectionScreen()),
                        (route) => false);
                  },
                  color: Colors.transparent,
                  child: Text(
                    'done',
                    style: new TextStyle(
                      color: Color(0xFF4C748B),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ), //Your widget here,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
