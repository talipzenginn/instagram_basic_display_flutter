import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/utils/secret_constants.dart';
import '../../../core/utils/routes.gr.dart';
import '../../../main.dart';
import '../../../view/profile/profile_viewmodel.dart';
import '../../../core/utils/constants.dart';
import 'instagram_model.dart';

class InstagramViewmodel extends ChangeNotifier {
  InstagramViewmodel({required this.instagramModel});

  final InstagramModel instagramModel;

  Completer<WebViewController> controller = Completer<WebViewController>();

  void buildRedirectToHome(NavigationRequest navigation) async {
    final host = Uri.parse(navigation.url).toString();

    if (host.contains(Uri.parse(AppConstant.redirectUri).host)) {
      print(host);
      getAuthorizationCode(host);
      await getTokenAndUserID().then(
        (isDone) async {
          if (isDone) {
            ProfileViewmodel(instagramModel).getUserProfile().then(
              (mediaUrlList) {
                router.push(
                  ProfileRoute(
                    mediaUrlList: mediaUrlList,
                  ),
                );
                print('${instagramModel.username} logged in!');
              },
            );
          }
        },
      );
    }
  }

  void getAuthorizationCode(String url) {
    instagramModel.authorizationCode = url
        .replaceAll('${AppConstant.redirectUri}?code=', '')
        .replaceAll('#_', '');
    print("Replaced state" + instagramModel.authorizationCode.toString());
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

  void onWebViewCreated(WebViewController c) {
    controller.complete(c);
  }

  NavigationDecision navigationDelegate(NavigationRequest navigation) {
    buildRedirectToHome(navigation);
    return NavigationDecision.navigate;
  }
}
