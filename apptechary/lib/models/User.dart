class User{
  String _uid;
  String _name;
  String _email;
  String _address;
  String _phoneNumber;

  User(uid, name, email, address, phoneNumber){
    _uid = uid;
    _name = name;
    _email = email;
    _address = address;
    _phoneNumber = phoneNumber;
  }

  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'name': _name,
    'email': _email,
    'address': _address,
    'phoneNumber': _phoneNumber
  };
}