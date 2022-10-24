// ignore_for_file: library_private_types_in_public_api

import 'package:charpi/utilities/app_images.dart';
import 'package:charpi/widgets/custom_widgets/custom_widget.dart';
import 'package:flutter/material.dart';

import '../search_screen/search_screen.dart';

class Headeriamge extends StatefulWidget {
  const Headeriamge({Key? key}) : super(key: key);

  @override
  _HeaderiamgeState createState() => _HeaderiamgeState();
}

class _HeaderiamgeState extends State<Headeriamge> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: 220,
          width: width,
          
          child: Image(image: AssetImage(AppImages.cowbackground,),fit: BoxFit.fill),
        ),
        Positioned(
          bottom: 60,
          left: 15,
          right: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForText(name: 'search from thousand of adds', size: 18,color: Colors.white,),
                const SizedBox(height: 5),
                const ForText(name: 'Here you can search', size: 14,color: Colors.white,),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
              context,
              // ignore: always_specify_types
              MaterialPageRoute(
                builder: (BuildContext context) => const SerachScreen(),
              ),
            );
                  },
                  child: Container(
                    height: 35,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const ForText(
                          name: 'Search With Keywords..',
                          size: 14,
                        ),
                        Expanded(child: Container()),
                        Container(
                          height: 35,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Center(child: Icon(Icons.search)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
