import 'package:flutter/material.dart';
import 'package:adgydeflutterplugin/adgydeflutterplugin.dart';
import 'main.dart';

class CountingEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountingEventState();
  }
}

class CountingEventState extends State<CountingEvent> {
  Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();

  @override
  void initState() {
    adgydesinstance.setCurrentScreen("CountingEvent");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Counting Events"),
        ),
        body: new Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onLocalNews,
                  child: new Text("Local News"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onNationalNews,
                  child: new Text("National News"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onInternationalNews,
                  child: new Text("International News"),
                ),
              ],
            )
        )
    );
  }


  void onLocalNews() {
    var params={"news":"local"};
    adgydesinstance.countingEvent("counting_news", params);

  }
  void onNationalNews() {
    var params={"news":"national"};
    adgydesinstance.countingEvent("counting_national", params);
  }

  void onInternationalNews() {
    var params={"news":"international"};
    adgydesinstance.countingEvent("counting_international", params);

  }
}