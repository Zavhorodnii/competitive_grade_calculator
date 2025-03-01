import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Coefficients>> fetchCoefficients() async {
  final response = await http.get(Uri.parse(
      'https://lyohha.github.io/KhNTU-Competitive-Grade-Calculator/coef.json'));

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
  final double? ukr;
  final double? math;
  final double? history;
  final double? geo;
  final double? eng;
  final double? chem;
  final double? phis;
  final double? bio;
  final double? lit;
  final double? coef;
  final double? con;

  const Coefficients({
    required this.name,
    required this.ukr,
    required this.math,
    required this.history,
    required this.geo,
    required this.eng,
    required this.chem,
    required this.phis,
    required this.bio,
    required this.lit,
    required this.coef,
    required this.con,
  });

  getCofByName(String name) {
    switch (name) {
      case 'name':
        return this.name;
      case 'ukr':
        return ukr;
      case 'math':
        return math;
      case 'history':
        return history;
      case 'geo':
        return geo;
      case 'eng':
        return eng;
      case 'chem':
        return chem;
      case 'phis':
        return phis;
      case 'bio':
        return bio;
      case 'lit':
        return lit;
      case 'coef':
        return coef;
      case 'con':
        return con;
      default:
        return 0;
    }
  }

  factory Coefficients.fromJson(Map<String, dynamic> json) {
    return Coefficients(
      name: json['name'],
      ukr: json['ukr'] as double?,
      math: json['math'] as double?,
      history: json['history'] as double?,
      geo: json['geo'] as double?,
      eng: json['eng'] as double?,
      chem: json['chem'] as double?,
      phis: json['phis'] as double?,
      bio: json['bio'] as double?,
      lit: json['lit'] as double?,
      coef: json['coef'] as double?,
      con: json['con'] as double?,
    );
  }
}
