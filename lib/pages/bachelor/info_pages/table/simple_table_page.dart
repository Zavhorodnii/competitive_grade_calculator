import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class SimpleTablePage extends StatelessWidget {
  SimpleTablePage({
    required this.data,
    required this.titleColumn,
    required this.titleRow,
  });

  final List<List<String>> data;
  final List<String> titleColumn;
  final List<String> titleRow;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StickyHeadersTable(
        columnsLength: titleColumn.length,
        rowsLength: titleRow.length,
        columnsTitleBuilder: (i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(titleColumn[i],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        // columnsTitleBuilder: (i) => Text(titleColumn[i]),
        rowsTitleBuilder: (i) => Text(titleRow[i]),
        contentCellBuilder: (i, j) => Text(data[i][j]),
        legendCell: Text('Спеціальність',
            style: TextStyle(fontWeight: FontWeight.bold)),
        cellAlignments: CellAlignments.fixed(
          contentCellAlignment: Alignment.topCenter,
          stickyColumnAlignment: Alignment.topLeft,
          stickyRowAlignment: Alignment.center,
          stickyLegendAlignment: Alignment.center,
        ),
        cellDimensions: CellDimensions.fixed(
          contentCellWidth: 110,
          contentCellHeight: 60,
          stickyLegendWidth: 200,
          stickyLegendHeight: 60,
        ),
        // initialScrollOffsetY: 0,
        showHorizontalScrollbar: false,
        showVerticalScrollbar: false,
      ),
    );
  }
} // TODO Implement this library.
