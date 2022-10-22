import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_widget.dart';
import '../../widgets/custom_widgets/phone_number_field.dart';
import 'auth_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  static const String routeName = '/signupScreen';

  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authPro=Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: (() {
          Navigator.pop(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AuthScreen()),
          );
        }),
      )
          // leading: const Icon(Icons.arrow_back, color: Colors.black),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                logo(),
                const ForText(name: 'Welcome', bold: true, size: 26),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: name,
                  starticon: Icons.person,
                  hint: 'Name',
                  validator: (String? value) =>
                      CustomValidator.username(context, value),
                ),
                const SizedBox(height: 10),
                PhoneNumberField(
                  initialCountryCode: authPro.phoneNumber?.countryCode ?? 'UK',
                  bgColor: Colors.transparent,
                  onChange: (PhoneNumber? value) =>
                      authPro.onPhoneNumberChange(value),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: password,
                  hint: 'Password',
                  starticon: Icons.lock,
                  validator: (String? value) =>
                      CustomValidator.password(value!),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: CustomElevatedButton(
                    title: 'Signup',
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const ForText(
                      name: 'Already a member?  ',
                      size: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen()),
                        );
                      },
                      child: ForText(
                        name: 'Login',
                        size: 16,
                        bold: true,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.logo),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
