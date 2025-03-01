import 'package:flutter/material.dart';

import '../../get_json_info.dart';
import '../../global_variables.dart';

DataColumn dataColumnTitle(String title) {
  return DataColumn(
    label: Expanded(
      child: Text(title,
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
    ),
  );
}

DataRow dataRowVal(Coefficients coefficients) {
  List<DataCell> dataCellVal = [];
  tableDataColumnTitle.forEach((key, val) {
    val = coefficients.getCofByName(key);
    dataCellVal.add(
      DataCell(
        Container(
            width: key == 'name' ? 250 : 100, //SET width
            child: Text((val != null ? val : '').toString())),

        // Text((val != null ? val : '').toString())
      ),
    );
  });

  return DataRow(
    cells: dataCellVal,
  );
}
