import 'dart:io';

import 'package:contact/core/theme/app_colors.dart';
import 'package:contact/modules/widgets/contact_card.dart';
import 'package:contact/modules/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  Future<void> pickImage() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 145,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.beige),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: image == null
                          ? Image.asset("assets/images/imagePicker.png")
                          : Image.file(File(image!.path), fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameController.text,
                        style: TextStyle(
                          color: AppColors.beige,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: AppColors.beige),
                      Text(
                        emailController.text,
                        style: TextStyle(
                          color: AppColors.beige,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: AppColors.beige),
                      Text(
                        phoneController.text,
                        style: TextStyle(
                          color: AppColors.beige,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Input(
              hintText: "Enter User Name",
              TextEditingController: nameController,
            ),
            SizedBox(height: 10),
            Input(
              hintText: "Enter User Email",
              TextEditingController: emailController,
            ),
            SizedBox(height: 10),
            Input(
              hintText: "Enter User Phone",
              TextEditingController: phoneController,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.beige,
                  foregroundColor: AppColors.backgroundColor,
                  textStyle: TextStyle(fontSize: 20),
                  overlayColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty) {
                    return;
                  }

                  final contact = ContactCard(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    image: image == null ? null : File(image!.path),
                    onDelete: () {},
                  );

                  Navigator.pop(context, contact);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Enter User"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
