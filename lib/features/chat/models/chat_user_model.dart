class ChatUserModel {
  late final String id;
  late final String name;
  late final String email;
  late final String about;
  late final String image;
  late final String createdAt;
  late final String lastActive;
  late final bool isOnline;
  late final String pushToken;

  ChatUserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.about,
      required this.image,
      required this.createdAt,
      required this.lastActive,
      required this.isOnline,
      required this.pushToken});

  ChatUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    about = json['about'] ?? '';
    image = json['image'] ?? '';
    createdAt = json['created_at'] ?? '';
    lastActive = json['last_active'] ?? '';
    isOnline = json['is_online'] ?? '';
    pushToken = json['push_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['about'] = about;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['last_active'] = lastActive;
    data['is_online'] = isOnline;
    data['push_token'] = pushToken;
    return data;
  }
}
