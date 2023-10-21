class User {
  String? fullName;
  String? email;
  String? password;
  String? mobileNumber;
  String? address;

  User({this.fullName, this.email, this.password, this.mobileNumber});

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'full_name': fullName,
      'email': email,
      'password': password,
      'mobile_number': mobileNumber,
      'address': 'address'
    };
    return map;
  }

  // Convert a Map object into a User object
  User.fromMap(Map<String, dynamic> map) {
    fullName = map['full_name'];
    email = map['email'];
    password = map['password'];
    mobileNumber = map['mobile_number'];
    address = map['address'];
  }
}
