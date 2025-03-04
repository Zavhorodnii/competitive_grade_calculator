import 'package:flutter/material.dart';

import '../pages/masters/global_variables.dart';
import '../pages/masters/result/calculation.dart';

class ResultsRow extends StatefulWidget {
  const ResultsRow({
    super.key,
    required this.rowTitleKey,
    required this.resultsItem,
    required this.selectedData,
  });
  final String rowTitleKey;
  final Results resultsItem;
  final Map selectedData;

  @override
  _ResultsRowState createState() => _ResultsRowState();
}

class _ResultsRowState extends State<ResultsRow> {
  @override
  Widget build(BuildContext context) {
    double a = 0;
    if (widget.rowTitleKey != 'coef')
      a = double.parse(widget.selectedData[widget.rowTitleKey]);

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
