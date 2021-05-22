import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Creates a valid RecipeStep', () {
    RecipeStep step = RecipeStep(text: 'success', time: 1);
    expect(step.text, 'success');
    expect(step.time, 1);
  });

  //how do we test rejecting invalid recipe steps?
  test('AssertionError on invalid RecipeStep(s)', (){
    // when text is empty or null
    expect(() { RecipeStep(text: '');}, throwsAssertionError);
    // when time == 0
    expect(() { RecipeStep(text: 'valid', time: 0);}, throwsAssertionError);
    // when time < 0
    expect(() { RecipeStep(text: 'valid', time: -1);}, throwsAssertionError);
  });
}
