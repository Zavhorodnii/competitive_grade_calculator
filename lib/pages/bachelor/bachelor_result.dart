import 'package:flutter/material.dart';
import 'dart:async';

import '../../widgets/expansion_tile_data.dart';
import 'calculation.dart';
import 'get_json_info.dart';

// late final Map selectedData;
// const Map? selectedData;

class BachelorResult extends StatefulWidget {
  const BachelorResult({super.key, required this.selectedData});
  final Map selectedData;
  // super.selectedData = selectedData;

  @override
  _BachelorResultState createState() => _BachelorResultState();
}

class _BachelorResultState extends State<BachelorResult> {
  List<ExpansionTileData> listwidgets = [];
  late Future<List<Coefficients>> futureCoefficients;
  // late var futureCoefficients;

  @override
  void initState() {
    super.initState();
    futureCoefficients = fetchCoefficients();
    List<Results> results = [];
    futureCoefficients.then(
      (value) {
        value.forEach(
          (element) {
            results.add(Results(futureCoefficients: element).calculate(
              k4: widget.selectedData['selected_sub'],
              p1: double.parse(widget.selectedData['ukr']),
              p2: double.parse(widget.selectedData['math']),
              p3: double.parse(widget.selectedData['history']),
              p4: double.parse(widget.selectedData['selected_sub_grade']),
              selectedTk: widget.selectedData['is_creative_competition'],
              tk: double.parse(widget.selectedData['creative_competition']),
            ));
          },
        );
        results
            .sort((a, b) => b.competitiveScore.compareTo(a.competitiveScore));
        results.forEach((item) {
          listwidgets.add(ExpansionTileData(
              resultsItem: item, selectedData: widget.selectedData));
        });
        setState(() {});
      },
    );
    // print(results.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Бакалавр'),
      ),
      body: Container(
        // padding: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: listwidgets,
          ),
        ),
      ),
      // ignore: avoid_print
    );
  }
}
