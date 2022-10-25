import 'package:charpi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'doctor_gig_upload.dart';
import 'upload_screen.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload'),
        ),
        body: authPro.apUser.usertype=='user'?
       const UploadScreen()
        :const DoctorScreen()
        
        
        );
  }
}
