import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:adgydeflutterplugin/adgydeflutterplugin.dart';
import 'package:adgydeflutterplugin_example/countingevent.dart';
import 'package:adgydeflutterplugin_example/uniqueevent.dart';
import 'package:adgydeflutterplugin_example/UserDetails.dart';
import 'package:adgydeflutterplugin_example/UserProfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();

  @override
  void initState() {

    // AdGyde Initialise
    // Initialize AdGyde SDK with appkey & default channel id "Organic".
    // When applictaion is installed from Google Play Store without any campaign the Channel will be Organic as specified in Init Function
    // In case the applictaion is installed through a campaign link then the Default channel will be overriden and value from the campaign link will be passed.
    // By Calling the below "adgydesinstance.setCurrentScreen("HomePage");" you can able to add user flow and this user flow will reflect on AdGyde Dashboard.
    adgydesinstance.init("Your_App_key","Organic");
    // Custom User Flow
    adgydesinstance.setCurrentScreen("HomePage");
    //Permission for Colllecting IMEI
    adgydesinstance.setImeiPermission(true);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    int number=0;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("AdGyde Sdk Example"),
        ),
        body:
        new Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _simpleButtonClick,
                  child: new Text("SimpleEvent"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => CountingEvent()),);
                  print("onPressCounting");},
                  child: new Text("CountingEvent"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed:_computingButtonClick,
                  child: new Text("ComputingEvent"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => UniqueEvent()),);
                  print("onPressUnique");},
                  child: new Text("Unique Event"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed:_revenueButtonClick,
                  child: new Text("Revenue"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed:_AddScreen1,
                  child: new Text("AddScreen1"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed:_removeScreen1,
                  child: new Text("RemoveScreen1"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails()),);},
                  child: new Text("UserDetail"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),);},
                  child: new Text("UserProfile"),
                ),
              ],
            )
        )
    );
  }

/*
 * Simple Event
 * =============
 * The below code is the example to pass a simple event to the AdGyde SDK.
 * This event requires only 1 Parameter which is the Event ID.
 *
 * NOTE : Creating the Simple Event on Console with Event ID is Compulsory
 *
 */
  void _simpleButtonClick(){
    adgydesinstance.simpleEvent("registration");

  }

  /*
 * Computing Event
 * =============
 * The below code is the example to pass a Computing event to the AdGyde SDK.
 * This event is used to get Sub-Category counting as per weightage of the Sub-Category
 * Multiple values Can be passed for getting the computed values
 * When user passes multiple values, the console shows the computed values of each value relatively
 *
 * NOTE : Creating the Computing Event on Console with Event ID, Parameter is Compulsory
 *
 */
  void _computingButtonClick(){
    Map map =Map<String, dynamic>();
// First parameter is event name and second is value name which will be accumulated.
    map={"offerlist":"50%Off"};
// Second parameter is the value for its value name. Value must be integer type.
    map={"50%off":"1000rs"};
// Trigger event where first parameter is event_id
    adgydesinstance.computingEvent("computing_event", map);

  }


  /*
 * Revenue Event
 * =============
 * The below code is the example to pass a Revenue event to the AdGyde SDK.
 * This event is useful to track revenue generated by the user in-app.
 * Unit of the currency need not be passed, by default revenue is calculated in INR (Indian Rupees)
 *
 * NOTE : There is no Need to create the Revenue Event on Console
 *
 */

  void _revenueButtonClick(){
    adgydesinstance.revenueEvent(70);
  }

  void _AddScreen1() {
    adgydesinstance.setCurrentScreen("AddScreen1");
  }

  void _removeScreen1(){
    adgydesinstance.removeCurrentScreen("AddScreen1");
  }



}






