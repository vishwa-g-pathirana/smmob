class adduserModel {
  String? age;

  String? firstname;
  String? gender;
  String? email;
  String? size;

  adduserModel({
    this.age,
    this.firstname,
    this.gender,
    this.size,
    this.email,
  });
  factory adduserModel.fromMap(map) {
    return adduserModel(
      age: map['age'],
      firstname: map['firstname'],
      gender: map['gender'],
      size: map['size'],
      email:map['email']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'email':email,
      'age': age,
      'firstname': firstname,
      'gender': gender,
      'size': size,
    };
  }
}
