import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bachelor_result.dart';
import 'info_pages/formulas.dart';
import 'global_variables.dart';

Map selectedData = {
  'ukr': '100',
  'math': '100',
  'history': '100',
  'selected_sub': 'geo',
  'selected_sub_grade': '100',
  'is_creative_competition': false,
  'creative_competition': '100',
};

String dropsownValue = 'geo';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // print(lesson)
  final formKey = GlobalKey<FormState>();
  bool contest = false;

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(<WidgetStatesConstraint, Icon>{
    WidgetState.selected: Icon(Icons.check),
    WidgetState.any: Icon(Icons.close)
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> dropDownMenuItem = [];
    lessonsList.forEach(
      (key, value) {
        dropDownMenuItem.add(DropdownMenuItem(
          value: key,
          child: Text(value),
        ));
      },
    );
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Бакалавр'),
      ),
      body: Container(
        // child: Text('Bachelor'),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Розрахуй свій конкурсний бал на вступ до ХНТУ',
                    style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: allLessons['ukr']),
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
                      selectedData['ukr'] = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: allLessons['math']),
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
                      selectedData['math'] = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: allLessons['history']),
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
                      selectedData['history'] = value;
                    },
                  ),
                  DropdownButton(
                    value: dropsownValue,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color: Colors.black45,
                    ),
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                    icon: const Icon(CupertinoIcons.chevron_down),
                    onChanged: (value) {
                      setState(() {
                        dropsownValue = value!;
                      });
                      selectedData['selected_sub'] = value;
                    },
                    items: dropDownMenuItem,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Бали з предмету: $dropsownValue'),
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
                      selectedData['selected_sub_grade'] = value;
                    },
                  ),
                  SwitchListTile(
                    title: Text(
                      allLessons['con'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.blue),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    thumbIcon: thumbIcon,
                    value: contest,
                    onChanged: (bool value) {
                      setState(() {
                        contest = value;
                      });
                      selectedData['is_creative_competition'] = value;
                    },
                    secondary: const Icon(CupertinoIcons.pencil_outline),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Visibility(
                    visible: contest,
                    child: TextFormField(
                      enabled: contest,
                      decoration: InputDecoration(labelText: allLessons['con']),
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
                        selectedData['creative_competition'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(
                    child: FilledButton.tonal(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BachelorResult(
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
            )),
      ),
    );
  }
}
