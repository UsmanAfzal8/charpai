// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'numbers_detail.dart';

class AppUser {
  final String uid;
  String? name;
  String? imageURL;
  final NumberDetails phoneNumber;
  final String? email;
  String? usertype;
  AppUser({
    required this.uid,
    this.name,
    this.imageURL,
    required this.phoneNumber,
    this.email,
    this.usertype,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'display_name': name ?? '',
      'number_details': phoneNumber.toMap(),
      'image_url': imageURL ?? '',
      'email': email ?? '',
      'user_type': usertype ?? '',
    };
  }

  factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return AppUser(
      uid: doc.data()?['uid'] ?? '',
      phoneNumber: NumberDetails.fromMap(
          doc.data()?['number_details'] ?? <String, dynamic>{}),
      name: doc.data()?['display_name'] ?? '',
      imageURL: doc.data()?['image_url'] ?? '',
      email: doc.data()?['email'] ?? '',
      usertype: doc.data()?['user_type'] ?? '',
    );
  }
}
