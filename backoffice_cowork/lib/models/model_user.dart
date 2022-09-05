class User {
  final String fname;
  final String lname;
  final String pseudo;
  final String email;
  final String phone;
  final String id;

  User(
    this.fname,
    this.lname,
    this.pseudo,
    this.email,
    this.phone,
    this.id,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["firstname"],
      json["lastname"],
      json["pseudo"],
      json["email"],
      json["phonenumber"],
      json["_id"],
    );
  }
}
