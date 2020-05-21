import 'package:flutter/material.dart';
import 'package:adgydeflutterplugin/adgydeflutterplugin.dart';

class UniqueEvent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();
    // TODO: implement createState
    adgydesinstance.setCurrentScreen("UniquePage");
    return UniqueEventState();
  }
}
class UniqueEventState extends State<UniqueEvent>{
  Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Unique Events"),
        ),
        body: new Center(

            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onDailyUnique,
                  child: new Text("onDailyUnique"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onPermanentUnique,
                  child: new Text("onPermanentUnique"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onCustomUnique,
                  child: new Text("onCustomUnique"),
                ),

              ],
            )
        )
    );
  }

  /*
 * Unique Event
 * =============
 * Unique Event is useful to track event which needs to be tracked once in a time period.
 * AdGyde SDK provides Unique Events in three types:-
 *        onDailyUnique.
 *	  onPermanentUnique.
 *	  onCustomUnique.
 * You can implement these unique events as per your need.
 * This event is useful to track event which needs to be tracked once / Uniquely in a Day.
 * Multiple values Can be passed in the Event using multiple Parameters, but Uniqueness will be as per Event ID only
 *
 *
 * NOTE : Creating the Unique Event on Console with Event ID, Parameter is Compulsory
 *
 */

  /**
   * Daily Unique event allows to keep an event unique for current date
   * When user completes Game Stage
   */

  void onDailyUnique() {
    //The parameter being passed in unique event are in combination of ParameterName and Value
    var params={"stage":"stage1"};
    // Event is triggered with EventId and Parameters prepared above, the same are passed in this function
    adgydesinstance.daliyUnique("dailygamelevelcomplete", params);
  }

  /**
   * Permanent Unique event allows to keep an event unique for user lifetime
   */
  void onPermanentUnique() {
    //The parameter being passed in unique event are in combination of ParameterName and Value
    var params={"level":"level_1"};
    // Event is triggered with EventId and Parameters prepared above, the same are passed in this function
    adgydesinstance.permanentUnique("permanentgamelevelcomplete", params);
  }

  /**
   * Custom Unique event allows to keep an event unique for user defined time (hours)
   */
  void onCustomUnique() {
//The parameter being passed in unique event are in combination of ParameterName and Value
    var params={"level":"level_1"};
// Event is triggered with EventId and Parameters prepared above, the same are passed in this function
// The third parameter (3) specifies that the Event will not be counted again before 3 hours
    adgydesinstance.customUnique("customgamelevelcomplete", params, 3);

  }
}