import 'package:flutter/material.dart';

import 'package:github_api_app/network/network_request.dart';
import 'package:github_api_app/screen/user_detail_screen.dart';

import '../model/users.dart';
class UserList extends StatefulWidget {
   const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Users> userDataList=  [];
  @override
  initState() {
    super.initState();
    NetworkRequest.fetchUsers().then((dataFromServer) => setState((){
      userDataList = dataFromServer;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github User List"),
        ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: userDataList.length,
                  itemBuilder: (context,index){
                    Users singleUser = userDataList[index];
                    return GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailScreen(singleuser: singleUser)));
                        print("taped to ${userDataList[index].login}");
                        print("value of url at user_list${singleUser.url}");
                      } ,
                      //het card moi
                      child:Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0.05),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        '${userDataList[index].avatarUrl}',
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                          child: Text(
                                            "${userDataList[index].login}",
                                            style: const TextStyle(
                                              color: Colors.grey
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                          child:  Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8FA2F7),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 2, 0, 2),
                                            child: Text(
                                                '${userDataList[index].siteAdmin}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )

                                            ),
                                          ),
                                        ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ))
        ],
      )
    );
  }
}
