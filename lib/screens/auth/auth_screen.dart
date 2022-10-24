import 'package:flutter/material.dart';
import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_widget.dart';
import 'login_screen.dart';
import 'signup-screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String routeName = '/authscren';
  @override
  Widget build(BuildContext context) {
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
                title: 'Continue with email or phone number',
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                title: 'Create a account',
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                             SignupScreen()),
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
