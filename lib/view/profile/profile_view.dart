import 'package:flutter/material.dart';
import '../../view/profile/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, this.mediaUrlList}) : super(key: key);

  final List<String>? mediaUrlList;

  Widget buildGridView() {
    List<Widget> widgets = mediaUrlList!
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(1),
            child: Image.network(e),
          ),
        )
        .toList();
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: widgets,
    );
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
              padding: const EdgeInsets.only(top: 2), child: buildGridView()),
          Container(
            margin: const EdgeInsets.all(10),
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
