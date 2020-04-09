import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  //Mercury: 0.38
  //Venus: 0.91
  //Earth: 1.00
  //Mars: 0.38
  //Jupiter: 2.34
  //Saturn: 1.06
  //Uranus: 0.92
  //Neptune: 1.19
  //Pluto: 0.06

  int radioValue;
  var a={
    0:0.06,
    1:0.38,
    2:1.06,
    3:2.34
  };
  double _weight=0.0;
  final TextEditingController _weightController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _size = 15.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),

      backgroundColor: Colors.blueGrey[600],

      body: Container(
         alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              height: 133,
              width: 200,
            ),

            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight on Earth",
                      hintText: "in Kgs",
                      icon: Icon(Icons.person)
                    ),
                    onChanged: weight,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              value: 0,
                              activeColor: Colors.green,
                              groupValue: radioValue,
                              onChanged: radioChanged,
                            ),
                            Text(
                                "Pluto",
                              style: TextStyle(
                                fontSize: _size,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              activeColor: Colors.green,
                              value: 1,
                              groupValue: radioValue,
                              onChanged: radioChanged,
                            ),
                            Text(
                                "Mars",
                              style: TextStyle(
                                fontSize: _size,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              activeColor: Colors.green,
                              value: 2,
                              groupValue: radioValue,
                              onChanged:  radioChanged,
                            ),
                            Text(
                                "Saturn",
                              style: TextStyle(
                                fontSize: _size,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              value: 3,
                              activeColor: Colors.green,
                              groupValue: radioValue,
                              onChanged: radioChanged,
                            ),
                            Text(
                              "Jupiter",
                              style: TextStyle(
                                fontSize: _size,
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: _weight == 0.0 ?Text(""):Text(
                        "You would weigh  ${_weight.toStringAsFixed(2)} Kgs"
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  void radioChanged(int value) {
    setState(() {
      radioValue=value;
    });
    changeWeight(_weightController.text,a[radioValue]);
    debugPrint(radioValue.toString());
    debugPrint(_weightController.text);
  }

  void changeWeight(String text, double a) {
    if(text.isNotEmpty && double.parse(text)>=0) {
      setState(() {
        _weight = double.parse(text)*a;
      });
    }
  }


  void weight(String value) {
    if(value.isNotEmpty){
      changeWeight(_weightController.text,a[radioValue]);
    }else{
      changeWeight(_weightController.text, 0.0);
    }
  }
}
