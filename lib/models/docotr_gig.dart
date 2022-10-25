import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorGig {
  final String did;
  final int amount;
  final String doctorname;
  final String description;
  final int timestamp;
  final String phonenumber;
   final String location;
   final String imageurl;
  DoctorGig({
    required this.did,
    required this.amount,
    required this.doctorname,
    required this.description,
    required this.timestamp,
    required this.phonenumber,
     required this.location,
     required this.imageurl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pid': did,
      'amount': amount,
      'description': description,
      'timestamp': timestamp,
      'phone_number': phonenumber,
      'doctor_name': doctorname,
      'location': location,
      'image_url': imageurl
    };
  }

  factory DoctorGig.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return DoctorGig(
      location: doc.data()?['location'] ?? '',
        did: doc.data()?['pid'] ?? '',
        amount: doc.data()?['amount'] ?? 0,
        description: doc.data()?['description'] ?? '',
        timestamp: doc.data()?['timestamp'] ?? '',
        doctorname: doc.data()?['doctor_name'],
        imageurl: doc.data()?['image_url'],
        phonenumber: doc.data()?['phone_number'] ?? '');
  }
}
