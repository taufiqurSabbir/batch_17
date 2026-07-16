
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';
import '../data/model/api_response.dart';
import '../data/model/user_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoading = false;
  String ? errorMessage;

  void setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }


  Future<bool>signIn(String email,String password) async {

    final ApiResponse response = await ApiCaller.PostRequest(url: TMUrls.SignInURL,
        body: {
          "email":email,
          "password":password
        }

    );


    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);

      String accessToken = response.responseData['token'];
      AuthController.saveUserData(model, accessToken);

     return true;


    }else{
    return false;

    }
  }
}