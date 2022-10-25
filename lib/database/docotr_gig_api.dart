import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/docotr_gig.dart';
import '../widgets/custom_widgets/custom_toast.dart';

class DoctorApi {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static const String _collection = 'doctorgigs';
  Future<bool> add(DoctorGig product) async {
    try {
      await _instance
          .collection(_collection)
          .doc(product.did)
          .set(product.toMap());
      CustomToast.successToast(message: 'Successfully Added');
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }

  Future<List<DoctorGig>> getdata() async {
    List<DoctorGig> product = <DoctorGig>[];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _instance.collection(_collection).get();
    for (DocumentSnapshot<Map<String, dynamic>> e in snapshot.docs) {
      product.add(DoctorGig.fromMap(e));
    }
    return product;
  }
}
