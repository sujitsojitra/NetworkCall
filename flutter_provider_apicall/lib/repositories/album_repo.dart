
import 'package:flutter_provider_apicall/models/album_model.dart';
import 'package:flutter_provider_apicall/models/user_album.dart';
import 'package:flutter_provider_apicall/models/user_model.dart';
import 'package:flutter_provider_apicall/network_module/api_path.dart';
import 'package:flutter_provider_apicall/network_module/http_client.dart';

class AlbumRepository {
  Future<Album> fetchAlbumDetails() async {
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_album));
    //print("Response - $response");
    return Album.fromJson(response);
  }

  Future<List<UserList>> fetchUserList() async {
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_user));
    final jsonData = response as List;
    List<UserList> responses = jsonData.map((tagJson) => UserList.fromJson(tagJson)).toList();
    //print("Response - $response");
    return responses;
  }

  Future<List<UserAlbum>> fetchUserAlbumList(String id) async {
    final response = await HttpClient.instance.fetchData("/albums?userId="+id);
    final jsonData = response as List;
    List<UserAlbum> responses = jsonData.map((tagJson) => UserAlbum.fromJson(tagJson)).toList();
    return responses;
  }

}