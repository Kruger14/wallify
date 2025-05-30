import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController? controller;
  final bool initialObscure;

  const PasswordField({
    super.key,
    required this.icon,
    required this.hint,
    this.controller,
    this.initialObscure = true,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.initialObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      style: TextStyle(fontSize: 16.sp),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.black, size: 20.sp),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 14.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.5.h,
          horizontal: 3.w,
        ),
      ),
    );
  }
}
