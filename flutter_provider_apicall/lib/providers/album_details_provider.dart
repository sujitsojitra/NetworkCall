import 'package:flutter/material.dart';
import 'package:flutter_provider_apicall/models/user_model.dart';
import 'package:flutter_provider_apicall/network_module/api_response.dart';
import 'package:flutter_provider_apicall/repositories/album_repo.dart';
class AlbumDetailsProvider with ChangeNotifier {
  AlbumRepository _albumRepository;

  ApiResponse<List<UserList>> userList;

  AlbumDetailsProvider() {
    _albumRepository = AlbumRepository();
    fetchUserList();
  }

  fetchUserList() async {
    userList = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      var userListinfo = await _albumRepository.fetchUserList();
      //print(userListinfo);
      userList = ApiResponse.completed(userListinfo);
      notifyListeners();
    } catch (e) {
      userList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}