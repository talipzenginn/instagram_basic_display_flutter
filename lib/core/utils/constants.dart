import 'secret_constants.dart';

class AppConstant {
  static const String redirectUri = 'https://httpstat.us/200';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  static const List<String> userFields = ['id', 'username', 'media'];
  final String authUrl =
      'https://api.instagram.com/oauth/authorize?client_id=${SecretConstant.clientID}&redirect_uri=$redirectUri&scope=user_profile,user_media&response_type=$responseType';
}
