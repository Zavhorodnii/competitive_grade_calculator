import 'package:flutter/material.dart';

import '../../global_variables.dart';
import '../../m_get_json_info.dart';
import 'data_column_page.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late Future<List<Coefficients>> futureCoefficients;

  List<DataColumn> listDataColumn = [];

  List<DataRow> listDataRow = [];
  @override
  void initState() {
    super.initState();
    futureCoefficients = fetchCoefficients();
    tableDataColumnTitle.forEach(
      (key, val) {
        listDataColumn.add(dataColumnTitle(val));
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
    final appBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Таблиця вагових коефіцієнтів',
          textDirection: TextDirection.ltr, softWrap: true),
    );

    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = appBar.preferredSize.height;
    double bodyHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(columns: listDataColumn, rows: []),
              // Container(
              // child:
              Container(
                height: bodyHeight - 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingRowHeight: 0.0,
                    dataRowMaxHeight: double.infinity, // Code to be changed.
                    dataRowMinHeight: 50,
                    columns: listDataColumn,
                    rows: listDataRow,
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
