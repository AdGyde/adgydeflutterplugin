import 'package:flutter/material.dart';
import 'package:adgydeflutterplugin/adgydeflutterplugin.dart';

class UserDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    Adgydeflutterplugin adgydesinstance = new Adgydeflutterplugin();
    // TODO: implement createState
    adgydesinstance.setCurrentScreen("UniquePage");
    return UserDetailsState();
  }
}

class UserDetailsState extends State<UserDetails> {
  Adgydeflutterplugin adgydesinstance = new Adgydeflutterplugin();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("User Details"),
        ),
        body: new Center(

            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onEmailId,
                  child: new Text("Email Id"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onPhoneNumber,
                  child: new Text("Phone Number"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onUserId,
                  child: new Text("User Id"),
                ),

              ],
            )
        )
    );
  }

/*
				 * Email Id
				 * =============
				 * In case Advertiser needs to store and relate Application analytics data with the users email id then advertiser
				 * can pass the same explicitly using adgydesinstance.getEmailId("sanugupta266@gmail.com"); function.
				 * Analytical data then can be shared along with email id
				 */

  void onEmailId() {
    adgydesinstance.getEmailId("sanugupta266@gmail.com");
  }

/*
				 * Phone Number
				 * =============
				 * In case Advertiser needs to store and relate Application analytics data with the users phone number then advertiser
				 * can pass the same explicitly using  adgydesinstance.getPhoneNumber(8130xxxxxx); function.
				 * Analytical data then can be shared along with phone number
				 */


  void onPhoneNumber() {
    adgydesinstance.getPhoneNumber(8130xxxxxx);
  }


  void onUserId() {
    adgydesinstance.getUserId("AdGy994949");
  }
}