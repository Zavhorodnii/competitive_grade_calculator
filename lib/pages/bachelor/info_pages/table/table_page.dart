import 'package:flutter/material.dart';

import '../../get_json_info.dart';
import '../../global_variables.dart';
import 'data_column_page.dart';

import 'simple_table_page.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  final columns = 10;
  final rows = 20;

  List<List<String>> makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < columns; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('L$j : T$i');
      }
      output.add(row);
    }
    return output;
  }

  /// Simple generator for column title
  // List<String> makeTitleColumn() => List.generate(columns, (i) => 'Top $i');

  /// Simple generator for row title
  List<String> makeTitleRow() => List.generate(rows, (i) => 'Left $i');

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late Future<List<Coefficients>> futureCoefficients;

  List<String> listColumnTitles = [];
  List<DataRow> listDataRow = [];

  @override
  void initState() {
    super.initState();
    futureCoefficients = fetchCoefficients();
    tableDataColumnTitle.forEach(
      (key, val) {
        if (key != 'name') listColumnTitles.add(val);
      },
    );
    futureCoefficients.then(
      (value) {
        value.forEach(
          (element) {
            listDataRow.add(dataRowVal(element));
          },
        );
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(listColumnTitles.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Таблиця вагових коефіцієнтів',
            textDirection: TextDirection.ltr, softWrap: true),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          child: SimpleTablePage(
            titleColumn: listColumnTitles,
            titleRow: widget.makeTitleRow(),
            data: widget.makeData(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(),
            label: 'Base',
          ),
          BottomNavigationBarItem(
            icon: Container(),
            label: 'Tap',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
      // bottomSheet: Center(
      //   child: Text('ttttttt'),
      // ),
    );
  }
}
