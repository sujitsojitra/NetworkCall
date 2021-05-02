import 'package:flutter/material.dart';
import 'package:flutter_provider_apicall/models/user_album.dart';
import 'package:flutter_provider_apicall/models/user_model.dart';
import 'package:flutter_provider_apicall/network_module/api_response.dart';
import 'package:flutter_provider_apicall/repositories/album_repo.dart';
class UserAlbumListProvider with ChangeNotifier {
  AlbumRepository _albumRepository;

  ApiResponse<List<UserAlbum>> userAlbumList;

  String id;
  UserAlbumListProvider() {
    _albumRepository = AlbumRepository();
  }

  fetchUserAlbumList(id) async {
    userAlbumList = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      var data = await _albumRepository.fetchUserAlbumList(id);
      userAlbumList = ApiResponse.completed(data);
      notifyListeners();
    } catch (e) {
      userAlbumList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}