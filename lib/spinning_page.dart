import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'roulette_score.dart';


class SpinningPage extends StatefulWidget {
  final int selectedNumPro;
  final Map<String, String> probabilities;
  SpinningPage(this.selectedNumPro, this.probabilities);

  @override
  _SpinningPageState createState() => _SpinningPageState(selectedNumPro,probabilities);
}


class _SpinningPageState extends State<SpinningPage> {

  final int selectedNumPro;
  final Map<String, String> probabilities;
  _SpinningPageState(this.selectedNumPro, this.probabilities);

  final StreamController _dividerController = StreamController<int>();
  final _wheelNotifier = StreamController<double>();
  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lets Do it',
          style: TextStyle(fontFamily: 'Oswald'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/circle.png'),
              width: 300,
              height: 300,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.6,
              canInteractWhileSpinning: false,
              dividers: selectedNumPro,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage: Image.asset('assets/secondimage.png'),
              secondaryImageHeight: 70,
              secondaryImageWidth: 70,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (BuildContext context, snapshot) => snapshot.hasData
                  ? RouletteScore(snapshot.data, probabilities)
                  : Container(),
            ),
            SizedBox(height: 30),
            RaisedButton(
              child: Text("Start"),
              onPressed: () {
                setState(() {
                  _wheelNotifier.sink.add(_generateRandomVelocity());
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 15000) + 3000;
  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}
