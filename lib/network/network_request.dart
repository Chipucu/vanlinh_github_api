import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:github_api_app/model/user_detail.dart';
import 'package:github_api_app/model/users.dart';
import 'package:github_api_app/screen/user_detail_screen.dart';
import 'package:github_api_app/screen/user_list_screen.dart';
import 'package:http/http.dart' as http;
class NetworkRequest {
  // request list of user from Github API
  static const String urlToGetUsers = "https://api.github.com/users";
  static List<Users> parseUsers(String responseBody){
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Users> users = list.map((model) => Users.fromJson(model)).toList();
    return users;
  }

  static Future<List<Users>> fetchUsers({int page=1}) async{
    final response = await http.get(Uri.parse(urlToGetUsers));
    if(response.statusCode==200){
      return compute(parseUsers,response.body);
    }
    else if (response.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get list of user");
  }



// // request user detail
//   static final String urlToGetDetail = _url;
//   static final String _url = "https://api.github.com/users/defunkt";
//   static List<UserDetail> parseUserDetail(String responseBody){
//     var detail = jsonDecode(responseBody) as List<dynamic>;
//     List<UserDetail> users_detail = detail.map((model2) => UserDetail.fromJson(model2)).toList();
//     return users_detail;
//   }
//   static Future<List<UserDetail>> fetchUserDetail(_url) async{
//     final response_detail = await http.get(Uri.parse(_url));
//     if(response_detail.statusCode==200){
//       return compute(parseUserDetail,"["+ response_detail.body + "]");
//     }
//     else if (response_detail.statusCode==404){
//       throw Exception("Not Found");
//     }
//     else throw Exception("Can't get detail of user");
//   }

}

