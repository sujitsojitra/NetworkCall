import 'package:flutter/material.dart';
import 'package:flutter_provider_apicall/providers/album_details_provider.dart';
import 'package:flutter_provider_apicall/views/user_album_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_apicall/network_module/api_response.dart';

import '../constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Network Layer With Provider')),
        body: Container(
            padding: const EdgeInsets.all(10), child: userList(context)),
      ),
    );
  }

  Widget userList(BuildContext context) {
    return Consumer<AlbumDetailsProvider>(builder: (context, myModel, child) {
      if (myModel.userList.status == Status.COMPLETED) {
        return ListView.builder(
          itemCount: myModel.userList.data.length,
          itemBuilder: (context, index) {
            return Card(
              shape: Border(left: BorderSide(color: Colors.blue, width: 6),
                  right: BorderSide(color: Colors.blue, width: 6)),
              child: ListTile(
              title: Text('${ myModel.userList.data[index].email}'),
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>user_album_page(myModel.userList.data[index].id.toString())));
                },
              ),
            );
          },
        );
      } else if (myModel.userList.status == Status.ERROR) {
        return Text("Error : ${myModel.userList.message}");
      } else {
        return progress();
      }
    });
  }
}
