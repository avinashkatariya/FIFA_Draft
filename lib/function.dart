import 'dart:convert';
import 'package:http/http.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


savePrimaryToken(String token) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("primary_token", token );
}

saveEmail(String email) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("email", email );
}

getEmail() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("email");
}

saveRefreshToken(String token) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("refresh_token", token);
}

Future<bool> isUserLogged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dynamic datum = prefs.getBool("logged");
  if(datum!=null){
    if(datum==true)
    return true;
  }
  return false;
}

saveUserLogged() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("logged", true);
}

logoutUser() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("logged", false);
}

getPrimaryToken() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.getString("primary_token");
}

getRefreshToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.getString("refresh_token");
}

getData(String url) async{
  List data;
  try {
      Response resp = await get(
          Uri.encodeFull(url),
          headers: {
            'Authorization': await getPrimaryToken(),
            "Accept": "application/json"
          }).timeout(Duration(seconds: 30));
      print(resp.statusCode);
      if (resp.statusCode == 200) {
        data = json.decode(resp.body);
        if(data[0]["responseCode"]==1){
          getNewToken();
          data=getData(url);
        }
        return data;
      }
    } on TimeoutException catch (_) {
      return null;
    }
}

getNewToken() async{
  List data;
  String url ="";
  Map<String, String> headers = {"Content-type": "application/json"};
  String rToken = await getRefreshToken();
  String body ="{'refresh_token':"+rToken+"}";
  Response response = await post(url,headers: headers,body: body);
  if(response.statusCode==200){
    data = json.decode(response.body);
    await savePrimaryToken(data[0]["tokken"]);
  }
}