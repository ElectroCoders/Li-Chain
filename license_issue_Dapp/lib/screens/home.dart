import 'package:flutter/material.dart';
import 'package:trial_police/screens/widgets.dart';
import 'package:http/http.dart' as http;
import 'dialogs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool writtenTest, trialTest;

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
  }

  void _request(String number) {
    Dialogs.showLoadingDialog('Updating data..', context);
    print(trialTest.toString() + writtenTest.toString());
    http.post('http://35.175.19.196:3000/setStatus', headers: {}, body: {
      "trialpass": trialTest.toString(),
      "writtenpass": writtenTest.toString(),
      "id": number
    }).then((res) {
      print(res.body);
      if (res.statusCode == 200) {
        Navigator.pop(context);
        Dialogs.showErrorDialog('Sucessfully updated.', context);
      } else {
        Navigator.pop(context);
        Dialogs.showErrorDialog(
            'Oops! seems like something went wrong.', context);
      }
    }).catchError((err) {
      Navigator.pop(context);
      Dialogs.showErrorDialog(err, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Trial Check'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the ID.';
                    }
                    return '';
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'ID',
                    hintText: 'Enter the ID.',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Text(
                'Written Test',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RowButtons(
                onSeleected: (value) {
                  (value == 0) ? writtenTest = true : writtenTest = false;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.blue,
                ),
              ),
              Text(
                'Trial Test',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RowButtons(
                onSeleected: (value) {
                  (value == 0) ? trialTest = true : trialTest = false;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.blue,
                ),
              ),
              CustomButton(
                text: 'Submit',
                color: Colors.purple,
                onTap: () {
                  if (!_formKey.currentState.validate() &&
                      writtenTest != null &&
                      trialTest != null) {
                    _request(idController.text.toString());
                  } else {
                    print('K vayo esto');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowButtons extends StatefulWidget {
  final Function(int) onSeleected;

  RowButtons({Key key, this.onSeleected}) : super(key: key);
  @override
  _RowButtonsState createState() => _RowButtonsState();
}

class _RowButtonsState extends State<RowButtons> {
  int selected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(
            text: 'Pass',
            color: selected == 0 ? Colors.green : Colors.blue,
            icon: selected == 0
                ? Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : null,
            onTap: () {
              setState(() {
                selected = 0;
              });
              widget.onSeleected(0);
            },
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Fail',
            color: selected == 1 ? Colors.red : Colors.blue,
            icon: selected == 1
                ? Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                : null,
            onTap: () {
              setState(() {
                selected = 1;
              });
              widget.onSeleected(1);
            },
          ),
        ),
      ],
    );
  }
}
