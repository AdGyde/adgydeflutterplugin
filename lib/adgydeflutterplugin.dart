import 'dart:async';

import 'package:flutter/services.dart';

class Adgydeflutterplugin {
  static const MethodChannel instance = const MethodChannel('adgydeplugin');

  void init(String appkey,String channel) {
    instance.invokeMethod("init",<String, dynamic>{'appkey':appkey,'channel': channel});
  }

  void simpleEvent(String eventValue) {
    instance.invokeMethod("simpleEvent",eventValue);
  }

  void countingEvent(String eventId, Map eventValue) {
    instance.invokeMethod("countingEvent",<String, dynamic>{'eventId':eventId,'eventValue': eventValue});
  }

  void computingEvent(String eventId, Map eventValue) {
    instance.invokeMethod("computingEvent", <String, dynamic>{'eventId':eventId,'eventValue': eventValue});
  }

  void daliyUnique(String eventId, Map eventValue) {
    instance.invokeMethod("daliyUnique",<String, dynamic>{'eventId':eventId,'eventValue': eventValue});
  }

  void permanentUnique(String eventId, Map eventValue) {
    instance.invokeMethod("permanentUnique",<String, dynamic>{'eventId':eventId,'eventValue': eventValue});
  }

  void customUnique(String eventId, Map eventValue,int time) {
    instance.invokeMethod("customUnique",<String, dynamic>{'eventId':eventId,'eventValue': eventValue,'time': time});
  }
  void setCurrentScreen(String screenName) {
    instance.invokeMethod("setCurrentScreen",screenName);
  }

  void removeCurrentScreen(String screenName) {
    instance.invokeMethod("removeCurrentScreen",screenName);
  }

  void getEmailId(String emailId) {
    instance.invokeMethod("getEmailId",emailId);
  }

  void getPhoneNumber(int phoneno) {
    instance.invokeMethod("getPhoneNumber",phoneno);
  }

  void getUserId(String userid) {
    instance.invokeMethod("getUserId",userid);
  }

  void revenueEvent(int revenue) {
    instance.invokeMethod("revenueEvent",revenue);
  }

  void fcmToken(String token) {
    instance.invokeMethod("fcmToken",token);
  }

  void setAge(String age) {
    instance.invokeMethod("setAge",age);
  }

  void setGender(String gender) {
    instance.invokeMethod("setGender",gender);
  }

  bool setImeiPermission(bool imei) {
    instance.invokeMethod("setIMEIPermission",imei);
  }
}
