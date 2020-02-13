class UserSession {
  String token;
  String username;
  String role;
  int userId;

  UserSession({this.token, this.username, this.userId, this.role});

  UserSession.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    userId = json['_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    '_id': userId,
    'role': role,
  };
}