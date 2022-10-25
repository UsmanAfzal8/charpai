import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../database/databse_storage.dart';
import '../../../database/product_api.dart';
import '../../../function/time_date_function.dart';
import '../../../models/product_model.dart';
import '../../../utilities/image_picker.dart';
import '../../../widgets/custom_widgets/custom_toast.dart';
import '../../../widgets/custom_widgets/custom_widget.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController productname = TextEditingController();
  final TextEditingController productdecription = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController subcategory = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> uploaddata() async {
    if (_formKey.currentState!.validate() && _image != null) {
      setState(() {
        _isloading = true;
      });
      String imageurl = await Storagemethod().uploadtostorage(
        'post',
        'tester',
        _image!,
      );

      Product product = Product(
        pid: TimeStamp.timestamp.toString(),
        amount: int.parse(amount.text),
        colors: '',
        quantity: quantity.text,
        productname: productname.text,
        description: productdecription.text,
        timestamp: TimeStamp.timestamp,
        category: category.text,
        subCategory: subcategory.text,
        createdByUID: 'tester',
        imageurl: imageurl,
      );
      bool temp = await ProductApi().add(product);
      if (temp) {
        CustomToast.successToast(message: 'ho giya upload');
        productname.clear();
        productdecription.clear();
        amount.clear();
        category.clear();
        quantity.clear();
        subcategory.clear();
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
    return  SingleChildScrollView(
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
                textField(context, productname, 'name'),
                textField(context, productdecription, 'Description'),
                textField(context, amount, 'amount'),
                textField(context, quantity, 'quantity'),
                textField(context, category, 'category'),
                textField(context, subcategory, 'subcategory'),
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
