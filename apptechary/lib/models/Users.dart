import 'dart:collection';

class User{
  HashMap<String, Object> fields;
  User(uid, name, address, phone){
    fields = HashMap();
  }
  void setUser(uid, name, email, address, phone){
    fields['User ID'] = uid;
    fields['Name'] = name;
    fields['Email'] = email;
    fields['Address'] = address;
    fields['Phone Number'] = phone;
  }

  HashMap<String, Object> getUser(){
    if(fields.isEmpty)
      return null;
    else
      return fields;
  }
}