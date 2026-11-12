import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController;
  final String hintText;
  const Input({super.key, required this.hintText, this.TextEditingController});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.lightBlue),
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: AppColors.backgroundColor,
        hintStyle: TextStyle(fontSize: 16, color: AppColors.lightBlue),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.beige, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.beige, width: 1),
        ),
      ),
      onChanged: (value) {
        setState(() {});
      },
      cursorColor: AppColors.beige,
      controller: widget.TextEditingController,
    );
  }
}
