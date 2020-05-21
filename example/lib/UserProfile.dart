import 'package:flutter/material.dart';
import 'package:adgydeflutterplugin/adgydeflutterplugin.dart';

class UserProfile  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();
    // TODO: implement createState
    adgydesinstance.setCurrentScreen("UniquePage");
    return UserProfileState();
  }
}

  class UserProfileState extends State<UserProfile>{
    Adgydeflutterplugin adgydesinstance= new Adgydeflutterplugin();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("User Profile"),
        ),
        body: new Center(

            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onUserAge,
                  child: new Text("UserAge"),
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onUserGender,
                  child: new Text("UserGender"),
                ),
               /* new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  //padding: const EdgeInsets.all(8.0),
                  onPressed: onCustomUnique,
                  child: new Text("onCustomUnique"),
                ),*/

              ],
            )
        )
    );
  }

    /*
		 * AdGyde demography data provides details of Age and Gender wise segregation of Users.
         * This data needs to be passed by Applictaion to show the same in the console
		 */


    /*
				 * Age data can be passed to SDK by following 2 functions which are shown in below code:-
				 *
				 * Syntax Type :- adgydesinstance.setAge("27");
				 *
				 */

    void onUserAge() {
    adgydesinstance.setAge("27");
  }

    /* Gender value can be passed to the SDK using the below function.
				 * Only the below 3 Values can be passed to the function for Gender
				 * Male (M)
				 * Female (F)
				 * Others (O)
				 *
				 * Syntax :- adgydesinstance.setGender("M");
				 *
				 */

  void onUserGender() {
    adgydesinstance.setGender("M");
  }

}