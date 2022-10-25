import 'dart:typed_data';
import 'package:charpi/models/docotr_gig.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../database/databse_storage.dart';
import '../../../database/docotr_gig_api.dart';
import '../../../function/time_date_function.dart';
import '../../../utilities/image_picker.dart';
import '../../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/custom_widgets/custom_textformfield.dart';
import '../../../widgets/custom_widgets/custom_toast.dart';
import '../../../widgets/custom_widgets/custom_validator.dart';
import '../../../widgets/custom_widgets/cutom_text.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController decription = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> uploaddata() async {
    if (_formKey.currentState!.validate() && _image != null) {
      setState(() {
        _isloading = true;
      });
      String imageurl = await Storagemethod().uploadtostorage(
        'gig',
        'doctor',
        _image!,
      );

      DoctorGig product = DoctorGig(
        imageurl: imageurl,
        did: TimeStamp.timestamp.toString(),
        amount: int.parse(amount.text),
        doctorname: name.text,
        description: decription.text,
        timestamp: TimeStamp.timestamp,
        location: location.text,
        phonenumber: phonenumber.text,
      );
      bool temp = await DoctorApi().add(product);
      if (temp) {
        CustomToast.successToast(message: 'ho giya upload');
      }
      setState(() {
        _isloading = false;
      });
    }
  }

  selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _image != null
                  ? GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: MemoryImage(_image!))),
                      ),
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: Colors.white,
                                  size: 36),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const ForText(
                              name: 'Add Image',
                              color: Colors.white,
                              size: 22,
                            )
                          ],
                        ),
                      ),
                    ),
              textField(context, name, 'name'),
              textField(context, decription, 'Description'),
              textField(context, amount, 'amount'),
              textField(context, location, 'location'),
              textField(context, phonenumber, 'phonenumber'),
              const SizedBox(height: 20),
              _isloading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      title: 'upload',
                      onTap: () {
                        uploaddata();
                      })
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      BuildContext context, TextEditingController controller, String hint) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller,
          // starticon: Icons.person,
          hint: hint,
          validator: (String? value) => CustomValidator.isEmpty(value),
        ),
      ],
    );
  }
}
