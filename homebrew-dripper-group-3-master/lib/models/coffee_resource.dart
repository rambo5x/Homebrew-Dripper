class CoffeeResource {
  String title, link;
  
  CoffeeResource({this.title, this.link}) : assert(title.isNotEmpty, "CoffeeResource cannot be an empty string."), 
  assert(link.isNotEmpty, "CoffeeResource link cannot be an empty string.");
}