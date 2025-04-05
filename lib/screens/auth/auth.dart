import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w), // Responsive padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.h), // Responsive spacing

              // Name Field
              _buildTextField(Icons.person, "Full Name"),

              SizedBox(height: 2.h), // Responsive spacing

              // Email Field
              _buildTextField(Icons.email, "Email"),

              SizedBox(height: 3.h), // Responsive spacing

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Add sign-up logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w, // Responsive width
                    vertical: 2.h, // Responsive height
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint) {
    return TextField(
      style: TextStyle(fontSize: 16.sp), // Responsive text size
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black, size: 20.sp), // Responsive icon
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp), // Responsive hint text size
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.5.h, // Responsive padding
          horizontal: 3.w,
        ),
      ),
    );
  }
}
