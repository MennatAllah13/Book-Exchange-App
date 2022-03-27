class User {
  String fullname;
  String email;
  String? age;
  String? locaion;
  String password;
  String username;
  String? gender;
  String? phone;

  User(
      {required this.fullname,
      required this.username,
      required this.email,
      this.age,
      this.locaion,
      required this.password,
      this.gender,
      this.phone});
}

List<User> users = [];
