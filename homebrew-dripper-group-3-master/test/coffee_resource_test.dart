import 'package:homebrew_dripper/models/coffee_resource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Creates a valid CoffeeResource', () {
    CoffeeResource step = CoffeeResource(title: 'success', link: 'https:\\www.hello.com');
    expect(step.title, 'success');
    expect(step.link, 'https:\\www.hello.com');
  });

  //how do we test rejecting invalid recipe steps?
  test('AssertionError on invalid CoffeeResource(s)', (){
    // when title is empty or null
    expect(() { CoffeeResource(title: '');}, throwsAssertionError);
    // when web link is empty or null
    expect(() { CoffeeResource(title: 'valid', link: '');}, throwsAssertionError);
  });
}