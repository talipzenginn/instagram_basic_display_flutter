import 'package:flutter/material.dart';
import '../../../view/authentication/login/login_viewmodel.dart';
import '../../../core/utils/images.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const double _buttonCornerRadius = 4;
  static const double _logoSize = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.instagramLogoTransparent,
              height: _logoSize,
              width: _logoSize,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Instagram Basic Display API',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  _buttonCornerRadius,
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: TextButton.icon(
                onPressed: LoginViewmodel.onPressed,
                icon: const Icon(
                  Icons.login,
                ),
                label: const Text(
                  'Login to Instagram',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
