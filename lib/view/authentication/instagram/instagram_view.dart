import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/utils/constants.dart';
import '../../../view/authentication/instagram/instagram_model.dart';
import '../../../view/authentication/instagram/instagram_viewmodel.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({Key? key}) : super(key: key);

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  final InstagramViewmodel instagramViewmodel = InstagramViewmodel(
    instagramModel: InstagramModel(),
  );

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return webview;
    });
  }

  Scaffold get webview => Scaffold(
        appBar: appBar,
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: AppConstant().authUrl,
          onWebViewCreated: instagramViewmodel.onWebViewCreated,
          navigationDelegate: instagramViewmodel.navigationDelegate,
        ),
      );

  AppBar get appBar => AppBar(
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
