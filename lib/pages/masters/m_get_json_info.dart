import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Coefficients>> fetchCoefficients() async {
  final response = await http.get(Uri.parse(
      'https://lyohha.github.io/KhNTU-Competitive-Grade-Calculator/master/coef.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonDecodeAll = jsonDecode(response.body);
    List<Coefficients> ress = [];
    for (var element in jsonDecodeAll) {
      // print('element');
      // print(element);
      ress.add(Coefficients.fromJson(element as Map<String, dynamic>));
    }

    // var res = Coefficients.fromJson(
    //     // (jsonDecode(response.body) as List).?Map<String, dynamic>>());
    //     jsonDecode(response.body)[0] as Map<String, dynamic>);

    return ress;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Coefficients {
  final String name;
  final double? eng;
  final double? logic;
  final double? spec;
  final double? coef;

  const Coefficients({
    required this.name,
    required this.eng,
    required this.logic,
    required this.spec,
    required this.coef,
  });

  getCofByName(String name) {
    switch (name) {
      case 'name':
        return this.name;
      case 'eng':
        return eng;
      case 'logic':
        return logic;
      case 'spec':
        return spec;
      case 'coef':
        return coef;
      default:
        return 0;
    }
  }

  factory Coefficients.fromJson(Map<String, dynamic> json) {
    return Coefficients(
      name: json['name'],
      eng: json['eng'] as double?,
      logic: json['logic'] as double?,
      spec: json['spec'] as double?,
      coef: json['coef'] as double?,
    );
  }
}
