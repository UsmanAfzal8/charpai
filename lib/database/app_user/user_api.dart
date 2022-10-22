
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

import '../../models/app_user/app_user.dart';
import '../../providers/user_change_provider.dart';
import '../../widgets/custom_widgets/custom_toast.dart';
import 'auth_method.dart';

class UserApi {
 
  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  Future<AppUser?> user({required String uid,required String col}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _instance.collection(col).doc(uid).get();
    if (!doc.exists) return null;
    final AppUser appUser = AppUser.fromDoc(doc);
    return appUser;
  }
Future<bool> register({required AppUser user,required String col}) async {
    try {
      await _instance.collection(col).doc(user.uid).set(user.toMap());
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }
  Future<String?> uploadProfilePhoto({required File file,required String col}) async {
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref('profile_photos/${AuthMethods.uid}')
          .putFile(file);
      String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
