import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ig_basic_display/core/utils/secret_constants.dart';
import '../../../core/utils/routes.gr.dart';
import '../../../main.dart';
import '../../../view/profile/profile_viewmodel.dart';
import '../../../core/utils/constants.dart';
import 'instagram_model.dart';

class InstagramViewmodel extends ChangeNotifier {
  InstagramViewmodel({required this.instagramModel});

  final InstagramModel instagramModel;

  Future<void> buildRedirectToHome(
    FlutterWebviewPlugin webview,
  ) async {
    webview.onUrlChanged.listen(
      (String url) async {
        if (url.contains(AppConstant.redirectUri)) {
          getAuthorizationCode(url);
          await getTokenAndUserID().then(
            (isDone) async {
              if (isDone) {
                ProfileViewmodel(instagramModel).getUserProfile().then(
                  (mediaUrlList) async {
                    await webview.close();
                    print('${instagramModel.username} logged in!');
                    router.pop();
                    router.push(
                      ProfileRoute(
                        mediaUrlList: mediaUrlList,
                      ),
                    );
                  },
                );
              }
            },
          );
        }
      },
    );
  }

  void getAuthorizationCode(String url) {
    instagramModel.authorizationCode = url
        .replaceAll('${AppConstant.redirectUri}?code=', '')
        .replaceAll('#_', '');
  }

  Future<bool> getTokenAndUserID() async {
    Uri url = Uri.parse('https://api.instagram.com/oauth/access_token');
    final response = await http.post(url, body: {
      'client_id': SecretConstant.clientID,
      'redirect_uri': AppConstant.redirectUri,
      'client_secret': SecretConstant.appSecret,
      'code': instagramModel.authorizationCode,
      'grant_type': 'authorization_code'
    });
    instagramModel.accessToken = json.decode(response.body)['access_token'];
    instagramModel.userID = json.decode(response.body)['user_id'].toString();
    print(
        '**************************${instagramModel.accessToken}****${instagramModel.userID}');
    return (instagramModel.accessToken != null && instagramModel.userID != null)
        ? true
        : false;
  }
}
