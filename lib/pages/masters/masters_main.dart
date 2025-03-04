import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global_variables.dart';
import 'info_pages/formulas.dart';
import 'result/master_result.dart';

Map selectedData = {
  'eng': '100',
  'logic': '100',
  'spec': '100',
};

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  // const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Магістр'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Розрахуй свій конкурсний бал на вступ у магістратуру до ХНТУ',
                  style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: allLessons['eng']),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: '100',
                  maxLength: 3,
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введіть коректний бал';
                    } else if (int.parse(value) < 100 ||
                        int.parse(value) > 200) {
                      return 'Не вірно введено значеня';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    selectedData['eng'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: allLessons['logic']),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: '100',
                  maxLength: 3,
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введіть коректний бал';
                    } else if (int.parse(value) < 100 ||
                        int.parse(value) > 200) {
                      return 'Не вірно введено значеня';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    selectedData['logic'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: allLessons['spec']),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: '100',
                  maxLength: 3,
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введіть коректний бал';
                    } else if (int.parse(value) < 100 ||
                        int.parse(value) > 200) {
                      return 'Не вірно введено значеня';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    selectedData['spec'] = value!;
                  },
                ),
                Center(
                  child: FilledButton.tonal(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MasterResult(
                              selectedData: selectedData,
                            );
                          }));
                        }
                        // print(selectedData);
                      },
                      child: Text('Розрахувати')),
                ),
                Center(
                  child: FilledButton.tonal(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Formulas();
                        }));
                      },
                      child: Text('Формула розрахунку')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
