import 'package:shopping_app/model/movies.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future getData() async {
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var reponse = await http.get(uri);
    if (reponse.statusCode == 200) {
      var json = reponse.body;
      return productsFromJson(json);
    }
  }
}
