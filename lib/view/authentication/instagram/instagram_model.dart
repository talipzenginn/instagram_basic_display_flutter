class InstagramModel {
  InstagramModel({
    this.userID,
    this.username,
    this.authorizationCode,
    this.accessToken,
    this.mediaUrlList,
    this.medias,
  });
  
   String? authorizationCode;
   String? accessToken;
   String? userID;
   String? username;
   List? medias;
   List<String>? mediaUrlList;
}