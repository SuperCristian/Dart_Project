import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(Uri.parse('https://api.thedogapi.com/v1/breeds'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    for (var breed in jsonData) {
      print('Breed: ${breed['name']}');
      print('Breed Group: ${breed['breed_group']}');
      print('Life Span: ${breed['life_span']}');
      print('Temperament: ${breed['temperament']}');
      print('--------------------------------------');
    }
  } else {
    print('Failed to load breeds');
  }
}