import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../widgets/custom_file_image_box.dart';
import '../../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/custom_widgets/custom_textformfield.dart';
import '../../../widgets/custom_widgets/custom_validator.dart';
import '../../../widgets/custom_widgets/show_loading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = '/register-screen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, AuthProvider authPro, _) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: authPro.registerKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 40),
                      const Text(
                        'Register Now',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Please fill the details and create account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      CustomFileImageBox(
                        file: authPro.profilePhoto,
                        onTap: () => authPro.pickProfilePhoto(),
                      ),
                      CustomTextFormField(
                        controller: authPro.name,
                        hint: 'Full Name',
                        validator: (String? value) =>
                            CustomValidator.lessThen3(value),
                      ),
                      // CustomTextFormField(
                      //   controller: authPro.username,
                      //   hint: 'Username',

                      //   validator: (String? value) =>
                      //       CustomValidator.username(context, value),
                      // ),
                      CustomTextFormField(
                        controller: authPro.bio,
                        hint: 'Bio',
                        maxLines: 4,
                        validator: (String? value) => null,
                      ),
                      const SizedBox(height: 10),
                      authPro.isRegsiterScreenLoadingn
                          ? const ShowLoading()
                          : CustomElevatedButton(
                              title: 'Register',
                              onTap: () => authPro.onRegister(context),
                            ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
