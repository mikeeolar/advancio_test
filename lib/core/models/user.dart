class User {
  int? id;
  String? fullName;
  String? email;

  User(this.id, this.fullName, this.email);

  User.fromMap(dynamic obj) {
    id = obj['id'];
    fullName = obj['full_name'];
    email = obj['email'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data["full_name"] = fullName;
    data["email"] = email;
    return data;
  }
}
