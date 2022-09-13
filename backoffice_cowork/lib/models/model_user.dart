class User {
  String fname;
  String lname;
  String pseudo;
  String email;
  String phone;
  String id;

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
