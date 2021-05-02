import 'package:flutter/material.dart';
import 'package:flutter_provider_apicall/providers/user_album_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_apicall/network_module/api_response.dart';

import '../constant.dart';

class user_album_page extends StatefulWidget{
  String id;
  user_album_page(this.id);

  @override
  State<StatefulWidget> createState() {
    return user_album_state_page();
  }
}

class user_album_state_page extends State<user_album_page>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserAlbumListProvider>(context, listen: false)
        .fetchUserAlbumList(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Album List"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10), child: userAlbumList(context)),
    );
  }

  Widget userAlbumList(BuildContext context) {
    return Consumer<UserAlbumListProvider>(builder: (context, myModel, child) {
      // if(myModel.userAlbumList==null)
      //   myModel.fetchUserAlbumList(widget.id);
      if (myModel.userAlbumList.status == Status.COMPLETED) {
        return ListView.builder(
          itemCount: myModel.userAlbumList.data.length,
          itemBuilder: (context, index) {
            return Stack(children: [
              Container(height: 60,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.orange[400],
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  margin: EdgeInsets.all(15),
                  color: Colors.green[50],
                  child:  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                    title: Text('${ myModel.userAlbumList.data[index].title}',textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ],
            );
          },
        );
      } else if (myModel.userAlbumList.status == Status.ERROR) {
        return Text("Error : ${myModel.userAlbumList.message}");
      } else {
        return progress();
      }
    });
  }
}