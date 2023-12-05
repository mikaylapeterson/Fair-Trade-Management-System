class User {
  final int? usrId;
  final String usrName;
  final String usrPassword;

  User({
    this.usrId,
    required this.usrName,
    required this.usrPassword,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    usrId: json["usrId"],
    usrName: json["usrName"],
    usrPassword: json["usrPassword"],);
  
  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "usrName": usrName,
    "usrPassword": usrPassword,
  };
}