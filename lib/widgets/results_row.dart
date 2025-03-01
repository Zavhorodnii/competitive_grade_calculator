import 'package:flutter/material.dart';

import '../pages/bachelor/global_variables.dart';
import '../pages/bachelor/calculation.dart';

class ResultsRow extends StatefulWidget {
  const ResultsRow({
    super.key,
    required this.rowTitleKey,
    required this.resultsItem,
    required this.selectedData,
    required this.selectedLessonl,
  });
  final String rowTitleKey;
  final Results resultsItem;
  final Map selectedData;
  final bool selectedLessonl;

  @override
  _ResultsRowState createState() => _ResultsRowState();
}

class _ResultsRowState extends State<ResultsRow> {
  @override
  Widget build(BuildContext context) {
    double a = 0;
    if (widget.rowTitleKey == 'coef') {
    } else if (widget.selectedLessonl) {
      a = double.parse(widget.selectedData['selected_sub_grade']);
    } else if (widget.rowTitleKey == 'con') {
      a = double.parse(widget.selectedData['creative_competition']);
    } else {
      a = double.parse(widget.selectedData[widget.rowTitleKey]);
    }
    var b = widget.resultsItem.futureCoefficients
        .getCofByName(widget.rowTitleKey)
        .toString();
    var res = a * double.parse(b);
    return Row(
      children: [
        Text(allLessons[widget.rowTitleKey]),
        Spacer(),
        Text(
          a != 0
              ? (a.toString() +
                  ' * ' +
                  b.toString() +
                  ' = ' +
                  res.toStringAsFixed(2))
              : b.toString(),
        ),
      ],
    );
  }
}
