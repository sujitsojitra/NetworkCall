import 'package:flutter/material.dart';
import 'package:flutter_provider_apicall/providers/album_details_provider.dart';
import 'package:flutter_provider_apicall/providers/user_album_list_provider.dart';
import 'package:flutter_provider_apicall/views/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(                                 
      providers: [
        ChangeNotifierProvider<AlbumDetailsProvider>(create: (context) => AlbumDetailsProvider()),
        ChangeNotifierProvider<UserAlbumListProvider>(create: (context) => UserAlbumListProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          home: HomePage()),
    );
  }
}