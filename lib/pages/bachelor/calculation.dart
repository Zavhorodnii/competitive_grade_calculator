import 'b_get_json_info.dart';

class Results {
  final Coefficients futureCoefficients;
  late double competitiveScore;

  Results({required this.futureCoefficients});

  Results calculate({
    required String k4,
    required double p1,
    required double p2,
    required double p3,
    required double p4,
    required bool selectedTk,
    required double tk,
  }) {
    var dividend = futureCoefficients.ukr! * p1 +
        futureCoefficients.math! * p2 +
        futureCoefficients.history! * p3 +
        futureCoefficients.getCofByName(k4) * p4;
    var divisor = futureCoefficients.ukr! +
        futureCoefficients.math! +
        futureCoefficients.history! +
        futureCoefficients.getCofByName(k4);
    if (futureCoefficients.con != null && selectedTk != false) {
      dividend = dividend + futureCoefficients.con! * tk;
      divisor = divisor + futureCoefficients.con!;
    }
    competitiveScore = double.parse((dividend / divisor).toStringAsFixed(2));
    if (futureCoefficients.coef != null) {
      competitiveScore = double.parse(
          (competitiveScore * futureCoefficients.coef!).toStringAsFixed(2));
    }
    return this;
  }
}
