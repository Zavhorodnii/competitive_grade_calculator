import 'package:flutter/material.dart';

import '../../../widgets/m_expansion_tile_data.dart';
import '../m_get_json_info.dart';
import 'calculation.dart';

class MasterResult extends StatefulWidget {
  const MasterResult({super.key, required this.selectedData});
  final Map selectedData;

  @override
  _MasterResultState createState() => _MasterResultState();
}

class _MasterResultState extends State<MasterResult> {
  List<ExpansionTileData> listwidgets = [];
  late Future<List<Coefficients>> futureCoefficients;

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
              p1: double.parse(widget.selectedData['eng']),
              p2: double.parse(widget.selectedData['logic']),
              p3: double.parse(widget.selectedData['spec']),
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
        title: const Text('Магістр'),
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
    );
  }
}
