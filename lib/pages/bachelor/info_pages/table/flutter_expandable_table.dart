import 'package:flutter/material.dart';

import '../../get_json_info.dart';
import '../../global_variables.dart';

import 'package:flutter_expandable_table/flutter_expandable_table.dart';

const Color _primaryColor = Color(0xFF1e2f36); //corner
const Color _accentColor = Color(0xFF0d2026); //background
const TextStyle _textStyle = TextStyle(color: Colors.white);
ExpandableTableCell _buildCell(String content, {CellBuilder? builder}) =>
    ExpandableTableCell(
      child: builder != null
          ? null
          : _DefaultCellCard(
              child: Center(
                child: Text(
                  content,
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      builder: builder,
    );

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}

class _DefaultCellCard extends StatelessWidget {
  final Widget child;

  const _DefaultCellCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: _primaryColor,
        margin: const EdgeInsets.all(1),
        child: child,
      );
}

class _TablePageState extends State<TablePage> {
  late Future<List<Coefficients>> futureCoefficients;

  late List<ExpandableTableRow> rows = [];

  List<String> listRowTitles = [];
  // List<DataRow> listDataRow = [];

  @override
  void initState() {
    super.initState();
    futureCoefficients = fetchCoefficients();
    futureCoefficients.then(
      (value) {
        value.forEach(
          (element) {
            print('1');
            // listRowTitles.add(element.getCofByName('name'));
            List<ExpandableTableCell> tt = [];
            tableDataColumnTitle.forEach(
              (key, val) {
                if (key != 'name') {
                  print(key);
                  tt.add(_buildCell(element.getCofByName(key).toString()));
                  // listColumnTitles.add(val);
                }
              },
            );
            print(tt.length);
            rows.add(
              ExpandableTableRow(
                height: 70,
                firstCell: _buildCell(element.getCofByName('name')),
                cells: tt,
              ),
            );
            print(2);
          },
        );
        print(rows.length);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<ExpandableTableRow> rows;
    ExpandableTable _buildSimpleTable() {
      int columnsCount = tableDataColumnTitle.length;
      // const int rowsCount = 20;

      List<ExpandableTableHeader> headers = [];

      tableDataColumnTitle.forEach(
        (key, val) {
          if (key != 'name') {
            headers.add(
              ExpandableTableHeader(
                width: 100,
                cell: _buildCell(val),
              ),
            );
            // listColumnTitles.add(val);
          }
        },
      );

      //Creation rows
      // final List<ExpandableTableRow> rows = List.generate(
      //   rowsCount,
      //   (rowIndex) => ExpandableTableRow(
      //     height: rowIndex % 2 == 0 ? 50 : 70,
      //     firstCell: _buildCell('Row2 $rowIndex'),
      //     cells: List<ExpandableTableCell>.generate(
      //       columnsCount - 1,
      //       (columnIndex) => _buildCell('Cell $rowIndex:$columnIndex'),
      //     ),
      //   ),
      // );

      return ExpandableTable(
        firstHeaderCell: _buildCell('Спеціальність'),
        headers: headers,
        scrollShadowColor: _accentColor,
        rows: rows,
        visibleScrollbar: true,
        trackVisibilityScrollbar: true,
        thumbVisibilityScrollbar: true,
        headerHeight: 100,
      );
    }

// @override
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Table'),
        centerTitle: true,
      ),
      body: Container(
        color: _accentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildSimpleTable(),
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold();
  }
}
