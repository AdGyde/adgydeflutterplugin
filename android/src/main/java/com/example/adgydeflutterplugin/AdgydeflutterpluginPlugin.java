package com.example.adgydeflutterplugin;
import android.app.Activity;
import android.content.Context;

import com.adgyde.android.AdGyde;

import java.util.Map;
import androidx.annotation.NonNull;
import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AdgydeflutterpluginPlugin */
public class AdgydeflutterpluginPlugin extends FlutterActivity implements FlutterPlugin, MethodCallHandler,ActivityAware {
  public Context applicationContext;
  public Activity activity;
  private MethodChannel mMethodChannel;
  private String channel="adgydeplugin";
  static String TAG="AdGyde";

  public static void registerWith(Registrar registrar) {
    final AdgydeflutterpluginPlugin adgydeflutterpluginPlugin=new AdgydeflutterpluginPlugin();
    adgydeflutterpluginPlugin.onAttachedToEngine(registrar.context(), registrar.messenger());
  }

  private void onAttachedToEngine(Context context, BinaryMessenger messenger) {
    this.applicationContext = context;
    mMethodChannel = new MethodChannel(messenger,channel);
    mMethodChannel.setMethodCallHandler(this);

  }
  @Override
  public void onStart(){
    super.onStart();
    Log.d(TAG,"onStart CallPlugin");
  }

  @Override
  public void onPause(){
    super.onPause();
    Log.d(TAG,"onPause CallPlugin");
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    final String method = call.method;
    switch (method) {
      case "init":
        init(call, result);
        break;
      case "simpleEvent":
        simpleEvent(call, result);
        break;
      case "countingEvent":
        countingEvent(call, result);
        break;
      case "computingEvent":
        computingEvent(call, result);
        break;
      case "daliyUnique":
        dailyUnique(call, result);
        break;
      case "permanentUnique":
        permanentUnique(call, result);
        break;
      case "customUnique":
        customUnique(call, result);
        break;
      case "setCurrentScreen":
        setCurrentScreen(call, result);
        break;
      case "removeCurrentScreen":
        removeCurrentScreen(call, result);
        break;
      case "getEmailId":
        getEmailId(call, result);
        break;
      case "getPhoneNumber":
        getPhoneNumber(call, result);
        break;
      case "getUserId":
        getUserId(call, result);
        break;
      case "revenueEvent":
        revenueEvent(call, result);
        break;
      case "fcmToken":
        fcmToken(call, result);
        break;
      case "setAge":
        setAge(call, result);
        break;
      case "setGender":
        setGender(call, result);
        break;
      case "setIMEIPermission":
        getIMEIPermission(call,result);
      default:
        result.notImplemented();
        break;
    }
  }

  private void init(MethodCall call, Result result) {
    String app_key= call.argument("appkey");
    String channel= call.argument("channel");
    AdGyde.init(applicationContext,app_key,channel);
    AdGyde.callOnCreate(this);
  }

  /*AdGyde Events Calling*/
  private void simpleEvent(MethodCall call, MethodChannel.Result result) {
    String eventname= call.arguments.toString();
    AdGyde.onSimpleEvent(eventname);
  }

  private void countingEvent(MethodCall call, MethodChannel.Result result) {
    String eventId=call.argument("eventId");
    Map<String,String> param= (Map<String, String>) call.argument("eventValue");
    AdGyde.onComputingEvent(eventId,param);

  }

  private void computingEvent(MethodCall call, MethodChannel.Result result) {
    String eventId=call.argument("eventId");
    Map<String,String> param= (Map<String, String>) call.argument("eventValue");
    AdGyde.onComputingEvent(eventId,param);
  }

  private void customUnique(MethodCall call, MethodChannel.Result result) {
    String eventId=call.argument("eventId");
    int time= (int)call.argument("time");
    Map<String,String> param= (Map<String, String>) call.argument("eventValue");
    AdGyde.onCustomUnique(eventId,param,time);
  }

  private void permanentUnique(MethodCall call, MethodChannel.Result result) {
    String eventId=call.argument("eventId");
    Map<String,String> param= (Map<String, String>) call.argument("eventValue");
    AdGyde.onPermanentUnique(eventId,param);
  }

  private void dailyUnique(MethodCall call, MethodChannel.Result result) {
    String eventId=call.argument("eventId");
    Map<String,String> param= (Map<String, String>) call.argument("eventValue");
    AdGyde.onDailyUnique(eventId,param);
  }


  private void setGender(MethodCall call, MethodChannel.Result result) {
    String gender = call.arguments.toString();
    AdGyde.setGender(applicationContext ,gender);
  }

  private void setAge(MethodCall call, MethodChannel.Result result) {
    int age=(int)call.arguments;
    AdGyde.setAge(applicationContext,age);
  }

  private void fcmToken(MethodCall call, MethodChannel.Result result) {
    String token=call.arguments.toString();
    AdGyde.onTokenRefresh(token);
  }

  private void revenueEvent(MethodCall call, MethodChannel.Result result) {
    int revenue=(int) call.arguments;
    AdGyde.onRevenue(revenue);
  }

  private void getUserId(MethodCall call, MethodChannel.Result result) {
    String userId=call.arguments.toString();
    AdGyde.setClientUserId(userId);
  }

  private void getPhoneNumber(MethodCall call, MethodChannel.Result result) {
    String  phoneNumber=call.arguments.toString();
    AdGyde.setPhoneno(applicationContext,phoneNumber);
  }

  private void getEmailId(MethodCall call, MethodChannel.Result result) {
    String emailId=call.arguments.toString();
    AdGyde.setEmail(applicationContext,emailId);
  }

  private void setCurrentScreen(MethodCall call, MethodChannel.Result result) {
    String screenName=call.arguments.toString();
    AdGyde.setCustomScreen(activity,screenName);
  }

  private void removeCurrentScreen(MethodCall call, MethodChannel.Result result) {
    String screenName=call.arguments.toString();
    AdGyde.removeCustomScreen(activity,screenName);
  }

  private void getIMEIPermission(MethodCall call, Result result) {
    boolean value= (boolean) call.arguments;
    AdGyde.allowPermissionIMEI(activity,value);
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    applicationContext = binding.getActivity().getApplication();
    activity=binding.getActivity();
    Log.d(TAG,"onDetachedFromActivityForConfigChanges Call");
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    Log.d(TAG,"onDetachedFromActivityForConfigChanges Call");
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    Log.d(TAG,"onReattachedToActivityForConfigChanges Call");
  }

  @Override
  public void onDetachedFromActivity() {
    AdGyde. callOnDestroy(this);
    Log.d(TAG,"onDetachedFromActivity Call");
  }

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    onAttachedToEngine(binding.getApplicationContext(),binding.getBinaryMessenger());
    Log.d(TAG,"onAttachedToEngine Call");
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    applicationContext = null;
    mMethodChannel.setMethodCallHandler(null);
    Log.d(TAG,"onDetachedFromEngine Call");
  }


}

