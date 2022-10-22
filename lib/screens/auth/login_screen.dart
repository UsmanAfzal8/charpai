
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/categories_provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_widget.dart';
import '../home_screen/home_screen.dart';
import '../main_screen/main_screen.dart';
import 'auth_screen.dart';
import 'signup-screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = '/loginScreen';

  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CategoriesProvider catPro = Provider.of<CategoriesProvider>(context);
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
        ),
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
                  controller: phonenumber,
                  starticon: Icons.email,
                  hint: 'Phone Number',
                  validator: (String? value) =>
                      CustomValidator.validateMobile(value!),
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
                    title: 'Login',
                    onTap: () {
                      catPro.load();
                      Navigator.push(
                        context,
                        // ignore: always_specify_types
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const ForText(
                      name: 'Not you member? ',
                      size: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SignupScreen()),
                        );
                      },
                      child: ForText(
                        name: 'Signup',
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
