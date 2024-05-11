import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.hint,
      this.icon,
      this.ontap,
      this.readonly = false,
      this.onChanged,
      this.controller});
  final String hint;
  final IconData? icon;
  final void Function()? ontap;
  final bool readonly;
  void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        readOnly: readonly,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: ontap,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
