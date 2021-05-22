import 'package:homebrew_dripper/models/coffee_resource.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadResources should give back the resources in my app', () {
    List<CoffeeResource> resources = ResourceData.loadResources();

    // add whatever tests help give you confidence
    expect(resources[0], isA<CoffeeResource>());
    expect(resources[0].title, "Coffee");
    expect(resources[0].link, '1');

    expect(resources[1], isA<CoffeeResource>());
    expect(resources[1].title, "Grinders");
    expect(resources[1].link, '2');

    expect(resources[2], isA<CoffeeResource>());
    expect(resources[2].title, "Kettles");
    expect(resources[2].link, '3');

    expect(resources[3], isA<CoffeeResource>());
    expect(resources[3].title, "Clever Dripper");
    expect(resources[3].link, '4');
  });
}