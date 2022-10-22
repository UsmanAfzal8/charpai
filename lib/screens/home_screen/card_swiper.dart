import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_widget.dart';

class Headeriamge extends StatefulWidget {
  const Headeriamge({Key? key}) : super(key: key);

  @override
  _HeaderiamgeState createState() => _HeaderiamgeState();
}

class _HeaderiamgeState extends State<Headeriamge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: 3,
        autoplay: true,
        autoplayDelay: 10000,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: 150.0,
        layout: SwiperLayout.TINDER,
        onTap: (index) {},
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            // height: 170,
            // width: width * 0.8,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 168, 193),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //const SizedBox(height: 20),
                      const ForText(
                        name: '30% Off',
                        bold: true,
                      ),
                      //const SizedBox(height: 20),
                      const ForText(
                        name: 'Gaming Controller',
                        bold: true,
                      ),
                      // const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(16)),
                        child: const ForText(
                          name: 'free Delievery',
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.controller),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
