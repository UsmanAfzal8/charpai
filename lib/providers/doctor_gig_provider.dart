import 'package:flutter/cupertino.dart';

import '../database/docotr_gig_api.dart';
import '../models/docotr_gig.dart';

class DoctorGigProvider with ChangeNotifier {
  DoctorGigProvider() {
    load();
    print(_doctor.length);
  }
  List<DoctorGig> _doctor = <DoctorGig>[];
  List<DoctorGig> get doctor => _doctor;
  Future<void> load() async {
    _doctor = await DoctorApi().getdata();

    notifyListeners();
  }
}
