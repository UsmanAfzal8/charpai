import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../database/databse_storage.dart';
import '../../database/product_api.dart';
import '../../function/time_date_function.dart';
import '../../models/product_model.dart';
import '../../utilities/image_picker.dart';
import '../../widgets/custom_widgets/custom_toast.dart';
import '../../widgets/custom_widgets/custom_widget.dart';

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
        amount: double.parse(amount.text),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                                backgroundColor: Colors.red,
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.grey,
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                textField(context, productname, 'productname'),
                textField(context, productdecription, 'product Description'),
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
