import 'package:charpi/widgets/custom_widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/doctor_gig_provider.dart';

class DoctorGigScreen extends StatelessWidget {
  const DoctorGigScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DoctorGigProvider doctorPro = Provider.of<DoctorGigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctorGigScreen'),
      ),
      body: ListView.builder(
        itemCount: doctorPro.doctor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ForText(name: doctorPro.doctor[index].doctorname),
                      ForText(name: doctorPro.doctor[index].description),
                      ForText(name: doctorPro.doctor[index].phonenumber),
                      ForText(name: doctorPro.doctor[index].location),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 70,
                        child: Image.network(doctorPro.doctor[index].imageurl),
                      ),
                      Text("Rs: ${doctorPro.doctor[index].amount}")
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
