import 'package:chitchat/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel({
    String name,
    String email,
    String phoneNumber,
    bool isOnline,
    String uid,
    String status,
    String profileUrl,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          profileUrl: profileUrl,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: (snapshot.data() as Map)['name'],
      email: (snapshot.data() as Map)['email'],
      phoneNumber: (snapshot.data() as Map)['phoneNumber'],
      uid: (snapshot.data() as Map)['uid'],
      isOnline: (snapshot.data() as Map)['isOnline'],
      profileUrl: (snapshot.data() as Map)['profileUrl'],
      status: (snapshot.data() as Map)['status'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
