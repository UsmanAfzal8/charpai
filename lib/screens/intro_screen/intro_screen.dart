import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_elevated_button.dart';
import '../auth/auth_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const String routeName = '/IntroScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: IntroductionScreen(
              showDoneButton: false,
              showNextButton: false,
              pages: <PageViewModel>[
                PageViewModel(
                  bodyWidget: _ViewModelBody(
                    imagePath: AppImages.brandIntroIcon,
                    title: 'All Brands And Category',
                    subtitle: '',
                  ),
                  titleWidget: const SizedBox(),
                ),
                PageViewModel(
                  bodyWidget: _ViewModelBody(
                    imagePath: AppImages.discountIntroIcon,
                    title: 'Supper Discounts And Offers',
                    subtitle: '',
                  ),
                  titleWidget: const SizedBox(),
                ),
                PageViewModel(
                  bodyWidget: _ViewModelBody(
                    imagePath: AppImages.deliveryIntroIcon,
                    titleSpace: 40,
                    title: 'First Delivery Service',
                    subtitle: '',
                  ),
                  titleWidget: const SizedBox(),
                ),
                PageViewModel(
                  bodyWidget: _ViewModelBody(
                    imagePath: AppImages.paymentIntroIcon,
                    titleSpace: 40,
                    title: 'Easy Payment System',
                    subtitle: '',
                  ),
                  titleWidget: const SizedBox(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: CustomElevatedButton(
                title: 'Next Step',
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) => const AuthScreen()),
                  );
                }
                // onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                //   SigninScreen.routeName, (Route<dynamic> route) => false),
                ),
          ),
        ],
      ),
    );
  }
}

class _ViewModelBody extends StatelessWidget {
  const _ViewModelBody({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.titleSpace = 20,
    // ignore: unused_element
    this.subtitleSpace = 20,
    Key? key,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String subtitle;
  final double titleSpace;
  final double subtitleSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          child: Image.asset(imagePath),
        ),
        SizedBox(height: titleSpace),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        SizedBox(height: subtitleSpace),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
