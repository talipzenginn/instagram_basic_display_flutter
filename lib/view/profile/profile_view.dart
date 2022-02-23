import 'package:flutter/material.dart';
import '../../view/profile/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, this.mediaUrlList}) : super(key: key);

  final List<String>? mediaUrlList;

  List<Widget> setWidgets(BuildContext context) {
    List<Widget> widgets = [];
    List<String>? urlList = mediaUrlList;
    for (int i = 0; i < urlList!.length; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(1),
          child: Image.network(
            urlList[i],
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: setWidgets(context),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4,
              ),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: TextButton.icon(
              onPressed: ProfileViewmodel.logout,
              icon: const Icon(
                Icons.login,
              ),
              label: const Text(
                'Logout from Instagram',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
