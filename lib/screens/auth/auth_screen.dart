import 'package:charpi/providers/auth_provider.dart';
import 'package:charpi/screens/auth/phone_registration/phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_widget.dart';
import 'login_screen.dart';
import 'signup-screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String routeName = '/authscren';
  @override
  Widget build(BuildContext context) {
    AuthProvider authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              logo(),
              Expanded(child: Container()),
              const ForText(name: 'Welcome', bold: true, size: 26),
              const SizedBox(height: 70),
              CustomElevatedButton(
                title: 'User',
                onTap: () {
                  authPro.userType('user');
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const PhoneNumberScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                title: 'Doctor',
                onTap: () {
                  authPro.userType('doctor');
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const PhoneNumberScreen()),
                  );
                },
                bgColor: const Color(0xffE2F0F7),
                textStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.logo),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
