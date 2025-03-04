import '../m_get_json_info.dart';

class Results {
  final Coefficients futureCoefficients;
  late double competitiveScore;

  Results({required this.futureCoefficients});

  Results calculate({
    required double p1,
    required double p2,
    required double p3,
  }) {
    competitiveScore = futureCoefficients.eng! * p1 +
        futureCoefficients.logic! * p2 +
        futureCoefficients.spec! * p3;
    if (futureCoefficients.coef != null) {
      competitiveScore = double.parse(
          (competitiveScore * futureCoefficients.coef!).toStringAsFixed(2));
    }

    return this;
  }
}
