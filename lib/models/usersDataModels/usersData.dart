class UsersData {
  late String userName;
  late String email;
  late String phoneNumber;


  UsersData(
      {required this.userName, required this.email, required this.phoneNumber });

  UsersData.fromMap(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];

  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
