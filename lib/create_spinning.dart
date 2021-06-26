import 'package:flutter/material.dart';
import 'spinning_page.dart';
import 'const.dart';

class CreateSpinning extends StatefulWidget {
  @override
  _CreateSpinningState createState() => _CreateSpinningState();
}

class _CreateSpinningState extends State<CreateSpinning> {

  TextEditingController _controller = new TextEditingController();
  String selectedNumPro = '2';
  String proValue;
  int num = 1;
  final Map<String, String> _probabilities = {};

  void _addProbability(int index, String probability) {
    setState(() {
      _probabilities[index.toString()] = probability;
      //_probabilities.add(probability);
    });
    print(_probabilities);
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < numberProbabilities.length; i++) {
      String numberPro = numberProbabilities[i];
      var newItem = DropdownMenuItem(
        child: Text(numberPro),
        value: numberPro,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  Widget _buildProTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(labelText: 'Enter probabilitie'),
      onChanged: (String value) {
        // we do not need setState here anymore
        setState(() {
          proValue = value;
        });
      },
    );
  }

  void _buildAddButton() {
    final String probability = proValue;
    _addProbability(num ,probability);
    if (num < int.parse(selectedNumPro)) {
      num++;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SpinningPage(int.parse(selectedNumPro), _probabilities)),
      );
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: DropdownButton<String>(
                value: selectedNumPro,
                items: getDropDownItems(),
                onChanged: (value) {
                  setState(() {
                    selectedNumPro = value;
                    print(selectedNumPro);
                  });
                },
              ),
            ),
            _buildProTextField(),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Add'),
              onPressed: _buildAddButton,
            )
          ],
        ),
      ),
    );
  }
}