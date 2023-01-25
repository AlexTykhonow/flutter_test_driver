import 'package:flutter/material.dart';

enum RadioCharacter { radio_1, radio_2 }

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
class FieldsPage extends StatefulWidget{
  static String routeName = '/fields_page';

  const FieldsPage({super.key});
  @override
  State<FieldsPage> createState() => _FieldsPageState();
}

class _FieldsPageState extends State<FieldsPage> {
  static bool changedSwitch = false;
  static bool changedCheck = true;
  RadioCharacter? _character = RadioCharacter.radio_1;
  String dropdownValue = list.first;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fields'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Item find',
              key: Key('text_field'),
            ),
            IconButton(
              key: Key('icon_button'),
              icon: Icon(Icons.sailing),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Icon_button tap'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Elevated_button tap'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("elevated button"),
                key: Key('elevated_button')),
            TextFormField(
              key: Key('text_Form_button'),
              onChanged: (value){
                controller.text = value;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('change_tap $value'),
                    duration: Duration(seconds: 2),
                  ),
                );
                setState(() {});

              },
              onTap: (){
                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('tab_tap'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              onEditingComplete: (){
                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('edit_tap '),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              onSaved: (value){

                setState(() {controller.text = value!;});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('save_tap $value'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              onFieldSubmitted: (value){
                setState(() {controller.text = value;});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('subm_tap $value'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              controller: controller,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.deepPurpleAccent,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('drop_down_tap $value'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Switch(
                key: Key('switch_button'),
                value: changedSwitch,
                onChanged: (value) {
                  setState(() {
                    changedSwitch = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('switch_tap $value'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }),
            Radio(
                key: Key('radio_1_button'),
                value: RadioCharacter.radio_1,
                groupValue: _character,
                onChanged: (RadioCharacter? value) {
                  setState(() {
                    _character = value!;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('radio_tap $value'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }),
            Radio(
                key: Key('radio_2_button'),
                value: RadioCharacter.radio_2,
                groupValue: _character,
                onChanged: (RadioCharacter? value) {
                  setState(() {
                    _character = value!;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('radio_tap $value'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }),
            Checkbox(
                key: Key('check_box'),
                value: changedCheck,
                onChanged: (value) {
                  setState(() {
                    changedCheck = value!;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('chack_box_tap $value'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }),
            Icon(
              Icons.account_circle,
              key: Key('icon'),
            ),
          ],
        ),
      ),
    );
  }
}
