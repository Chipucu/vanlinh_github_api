import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_api_app/model/user_detail.dart';
import 'package:github_api_app/network/network_request.dart';
import 'package:github_api_app/model/users.dart';
import 'package:github_api_app/screen/user_list_screen.dart';
import 'package:http/http.dart' as http;

//////////new class 2
class UserDetailScreen extends StatelessWidget {
  final Users singleuser;

  UserDetailScreen({Key? key, required this.singleuser}) : super(key: key);
  // Future<UserDetail> userDetail = fetchUserDetail();

  @override
  // fetch api
  @override
  initState() {
    // print(UserDetailScreen.singleuser.url);
    initState();
    UserDetail userDetailData;
    fetchUserDetail().then((dataFromServer2) => userDetailData = dataFromServer2);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is user detail",
          style: TextStyle(color: Colors.amber),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0, 40, 0, 0),
            child: Container(
              width: 190,
              height: 190,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                '${singleuser.avatarUrl}',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0, 10, 0, 10),
            child: Text(
              '${singleuser.url}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0, 0, 0, 20),
            child: Text(
              '${singleuser.id}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          ),
          Divider(
            height: 3,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                30, 20, 0, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${singleuser.login}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF617AF8),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Text(
                        '${singleuser.type}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                30, 10, 0, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                Text(
                  '${singleuser.htmlUrl}',
                  style:
                  TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                30, 10, 0, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                  child: Icon(
                    Icons.link_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                Text(
                  '${singleuser.receivedEventsUrl}',
                  style:
                  TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF617AF8),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //fetch API

  UserDetail parseUserDetail(String responseBody){
    var detail = jsonDecode(responseBody) as dynamic;
    UserDetail users_detail = detail.map((model2) => UserDetail.fromJson(model2));
    return users_detail;
  }
  Future<UserDetail> fetchUserDetail() async{
    final response_detail = await http.get(Uri.parse(singleuser.url));
    if(response_detail.statusCode==200){
      return compute(parseUserDetail,"["+ response_detail.body + "]");
    }
    else if (response_detail.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get detail of user");
  }
//end
}
//end new class 2

// old class

//
// class UserDetailScreen extends StatefulWidget {
//   final Users singleuser;
//   UserDetailScreen({Key? key, required this.singleuser}) : super(key: key);
//   @override
//   State<UserDetailScreen> createState() => _UserDetailScreenState();
// }
//
// class _UserDetailScreenState extends State<UserDetailScreen> {
//   Future<UserDetail> futureUserDetail= UserDetail() as Future<UserDetail>;
//   @override
//   void initState() {
//     super.initState();
//     futureUserDetail = fetchUserDetail();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("This is user detail",
//           style: TextStyle(color: Colors.amber),),
//       ),
//       body:Center(
//         child: FutureBuilder< UserDetail>(
//           future: futureUserDetail,
//           builder: (context,snapshot) {
//             return Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       0, 40, 0, 0),
//                   child: Container(
//                     width: 190,
//                     height: 190,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                     ),
//                     child: Image.network(
//                       '${futureUserDetail.}',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       0, 10, 0, 10),
//                   child: Text(
//                     '${singleuser.url}',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       0, 0, 0, 20),
//                   child: Text(
//                     '${singleuser.login}',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   height: 3,
//                   thickness: 2,
//                   indent: 20,
//                   endIndent: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       30, 20, 0, 20),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding:
//                         EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.black,
//                           size: 35,
//                         ),
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           // Text(
//                           //   '${userDetailData[index].login}',
//                           //   style: TextStyle(
//                           //     fontFamily: 'Poppins',
//                           //     fontWeight: FontWeight.w500,
//                           //   ),
//                           // ),
//                           Container(
//                             width: 80,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               color: Color(0xFF617AF8),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             // child: Text(
//                             //   '${userDetailData[index].siteAdmin}',
//                             //   textAlign: TextAlign.center,
//                             //   style: TextStyle(
//                             //     fontFamily: 'Poppins',
//                             //     color: Colors.white,
//                             //     fontSize: 16,
//                             //   ),
//                             // ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       30, 10, 0, 20),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding:
//                         EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                         child: Icon(
//                           Icons.location_on,
//                           color: Colors.black,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         '${singleuser.siteAdmin}',
//                         style:
//                         TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                       30, 10, 0, 20),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding:
//                         EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                         child: Icon(
//                           Icons.link_rounded,
//                           color: Colors.black,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         '${singleuser.receivedEventsUrl}',
//                         style:
//                         TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFF617AF8),
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       )
//     );
//   }
//
// // fetch api
//
//  UserDetail parseUserDetail(String responseBody){
// var detail = jsonDecode(responseBody) as dynamic;
// UserDetail users_detail = detail.map((model2) => UserDetail.fromJson(model2));
// return users_detail;
// }
//  Future<UserDetail> fetchUserDetail() async{
// final response_detail = await http.get(Uri.parse(singleuser.url));
// if(response_detail.statusCode==200){
// return compute(parseUserDetail,"["+ response_detail.body + "]");
// }
// else if (response_detail.statusCode==404){
// throw Exception("Not Found");

//
// }
// else throw Exception("Can't get detail of user");
// }
// }

//hihi
// class UserDetailScreen extends StatefulWidget {
//   final Users singleuser;
//   UserDetailScreen({Key? key, required this.singleuser}) : super(key: key);
//
//   @override
//   State<UserDetailScreen> createState() => _UserDetailScreenState();
// }
//
// class _UserDetailScreenState extends State<UserDetailScreen> {
//
//  List<UserDetail> userDetailData= [];
//   @override
//   initState() {
//     super.initState();
//     fetchUserDetail().then((dataFromServer2) => setState((){
//       userDetailData = dataFromServer2 as List<UserDetail> ;
//     }));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("This is user detail",
//           style: TextStyle(color: Colors.amber),),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//             padding: EdgeInsets.all(10),
//             itemCount: 1,
//             itemBuilder:(context, index) {
//               return Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         0, 40, 0, 0),
//                     child: Container(
//                       width: 190,
//                       height: 190,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Image.network(
//                         '${userDetailData[index].avatarUrl}',
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         0, 10, 0, 10),
//                     child: Text(
//                       '${userDetailData[index].name}',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         0, 0, 0, 20),
//                     child: Text(
//                       '${userDetailData[index].bio}',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Divider(
//                     height: 3,
//                     thickness: 2,
//                     indent: 20,
//                     endIndent: 20,
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         30, 20, 0, 20),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding:
//                           EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                           child: Icon(
//                             Icons.person,
//                             color: Colors.black,
//                             size: 35,
//                           ),
//                         ),
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             // Text(
//                             //   '${userDetailData[index].login}',
//                             //   style: TextStyle(
//                             //     fontFamily: 'Poppins',
//                             //     fontWeight: FontWeight.w500,
//                             //   ),
//                             // ),
//                             Container(
//                               width: 80,
//                               height: 30,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFF617AF8),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               // child: Text(
//                               //   '${userDetailData[index].siteAdmin}',
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //     fontFamily: 'Poppins',
//                               //     color: Colors.white,
//                               //     fontSize: 16,
//                               //   ),
//                               // ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         30, 10, 0, 20),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding:
//                           EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                           child: Icon(
//                             Icons.location_on,
//                             color: Colors.black,
//                             size: 35,
//                           ),
//                         ),
//                         Text(
//                           '${""}',
//                           style:
//                           TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                         30, 10, 0, 20),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding:
//                           EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
//                           child: Icon(
//                             Icons.link_rounded,
//                             color: Colors.black,
//                             size: 35,
//                           ),
//                         ),
//                         Text(
//                           '${""}',
//                           style:
//                           TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Color(0xFF617AF8),
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             } ,
//           )
//         ],
//       )
//     );
//   }
//
// // fetch api
// UserDetail parseUserDetail(String responseBody){
// var detail = jsonDecode(responseBody) as dynamic;
// UserDetail users_detail = detail.map((model2) => UserDetail.fromJson(model2));
// return users_detail;
// }
//  Future<UserDetail> fetchUserDetail() async{
// final response_detail = await http.get(Uri.parse("https://api.github.com/users/mojombo"));
// if(response_detail.statusCode==200){
// return compute(parseUserDetail,"["+ response_detail.body + "]");
// }
// else if (response_detail.statusCode==404){
// throw Exception("Not Found");
// }
// else throw Exception("Can't get detail of user");
// }
// }
//