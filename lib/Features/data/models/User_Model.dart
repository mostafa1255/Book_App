class userModel {
  String? name;
  String? email;
  String? id;

  userModel(
      {required this.email,
      required this.id,
      required this.name});

  userModel.fromJcon({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    id = data['userid'];
  }

  Map<String, dynamic> toJcon() {
    return {
      'name': name,
      'email': email,
      'userid': id,
    };
  }
}
