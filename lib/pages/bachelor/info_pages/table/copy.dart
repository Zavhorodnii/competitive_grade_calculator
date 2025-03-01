import 'package:flutter/material.dart';

import '../../get_json_info.dart';
import '../../global_variables.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Таблиця вагових коефіцієнтів',
            textDirection: TextDirection.ltr, softWrap: true),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(bottom: 20),
              //   child: Text(
              //     'Таблиця вагових коефіцієнтів спеціальностей ХНТУ',
              //     style: TextStyle(fontSize: 30, color: Colors.lightBlue),
              //   ),
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: listDataColumn, rows: listDataRow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
