import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../../../core/utils/constants.dart';
import '../../../view/authentication/instagram/instagram_model.dart';
import '../../../view/authentication/instagram/instagram_viewmodel.dart';

class InstagramView extends StatelessWidget {
  const InstagramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final webview = FlutterWebviewPlugin();
      final InstagramViewmodel instagramViewmodel = InstagramViewmodel(
        instagramModel: InstagramModel(),
      );

      instagramViewmodel.buildRedirectToHome(
        webview,
      );

      return WebviewScaffold(
        url: AppConstant().authUrl,
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
      );
    });
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Instagram Login',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      );
}
