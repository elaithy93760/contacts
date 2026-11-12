import 'dart:io';

import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final File? image;
  final VoidCallback onDelete;
  const ContactCard({
    super.key,
    required this.email,
    required this.name,
    required this.phone,
    required this.onDelete,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 180,
      height: 284,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.file(
                  image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 180,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 65,
                height: 35,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.mail, size: 20),
                    Text(email, style: TextStyle(fontSize: 10)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.phone_in_talk_rounded, size: 20),
                    Text(phone, style: TextStyle(fontSize: 10)),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: AppColors.white,
                      textStyle: TextStyle(fontSize: 10),
                      overlayColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      onDelete();
                    },
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.delete), Text("Delete")],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
