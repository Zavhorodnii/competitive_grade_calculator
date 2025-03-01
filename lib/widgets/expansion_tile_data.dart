import 'package:flutter/material.dart';

import '../pages/bachelor/calculation.dart';
import '../pages/bachelor/global_variables.dart';
import 'results_row.dart';

class ExpansionTileData extends StatefulWidget {
  const ExpansionTileData(
      {super.key, required this.resultsItem, required this.selectedData});
  final Results resultsItem;
  final Map selectedData;

  @override
  State<ExpansionTileData> createState() => _ExpansionTileDataState();
}

class _ExpansionTileDataState extends State<ExpansionTileData> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<ResultsRow> rowResults = [];
    // rowResults.add(ResultsRow(
    //     resultsItem: widget.resultsItem, selectedData: widget.selectedData));

    rowResults.add(ResultsRow(
      rowTitleKey: 'ukr',
      resultsItem: widget.resultsItem,
      selectedData: widget.selectedData,
      selectedLessonl: false,
    ));
    rowResults.add(ResultsRow(
      rowTitleKey: 'math',
      resultsItem: widget.resultsItem,
      selectedData: widget.selectedData,
      selectedLessonl: false,
    ));
    rowResults.add(ResultsRow(
      rowTitleKey: 'history',
      resultsItem: widget.resultsItem,
      selectedData: widget.selectedData,
      selectedLessonl: false,
    ));
    rowResults.add(ResultsRow(
      rowTitleKey: widget.selectedData['selected_sub'],
      resultsItem: widget.resultsItem,
      selectedData: widget.selectedData,
      selectedLessonl: true,
    ));
    if (widget.resultsItem.futureCoefficients.con != null &&
        widget.selectedData['is_creative_competition'] != false) {
      rowResults.add(ResultsRow(
        rowTitleKey: 'con',
        resultsItem: widget.resultsItem,
        selectedData: widget.selectedData,
        selectedLessonl: false,
      ));
    }
    if (widget.resultsItem.futureCoefficients.coef != null) {
      rowResults.add(ResultsRow(
        rowTitleKey: 'coef',
        resultsItem: widget.resultsItem,
        selectedData: widget.selectedData,
        selectedLessonl: false,
      ));
    }
    return ListTileTheme(
      contentPadding: const EdgeInsets.only(left: 20, right: 20),
      child: ExpansionTile(
        // title: Text(widget.title),

        collapsedBackgroundColor:
            widget.resultsItem.competitiveScore >= globalMinGrate
                ? const Color.fromARGB(255, 180, 221, 255)
                : Colors.white10,
        backgroundColor: widget.resultsItem.competitiveScore >= globalMinGrate
            ? const Color.fromARGB(255, 180, 221, 255)
            : Colors.white10,
        title: Row(
          children: [
            Expanded(
              child: Text(widget.resultsItem.futureCoefficients.name),
            ),
            // Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child:
                  Text(widget.resultsItem.competitiveScore.toStringAsFixed(2)),
            ),
          ],
        ),
        // subtitle: Text('Custom expansion arrow icon'),
        trailing: Icon(
          _customTileExpanded
              ? Icons.arrow_drop_down_circle
              : Icons.arrow_drop_down,
        ),
        // children: const <Widget>[ListTile(title: Text('This is tile number 2'))],
        children: <Widget>[
          ListTile(
            title: Column(children: rowResults),
          )
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      ),
    );
  }
}
