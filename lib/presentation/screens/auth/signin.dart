// ignore: file_names
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/common/utils/appcolors.dart';
import 'package:wallify/common/widgets/passfield.dart';
import 'package:wallify/presentation/screens/auth/signup.dart';
import 'package:wallify/common/utils/custom_toast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? AppColorsLight.background : AppColorsDark.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo
                Container(
                  height: 15.h,
                  width: 30.w,
                  margin: EdgeInsets.only(bottom: 4.h),
                  child: Image.asset(
                    'assets/logo/wallifylogo.png', // make sure the path is correct and added in pubspec.yaml
                    fit: BoxFit.contain,
                  ),
                ),

                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 3.h),

                // Email Field
                _buildTextField(Icons.mail, "Email", controller: email),
                SizedBox(height: 2.h),

                // Password Field
                PasswordField(
                  controller: password,
                  icon: Icons.lock,
                  hint: 'Enter your password',
                ),
                SizedBox(height: 3.h),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     showCustomToast("Sign In");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint,
      {TextEditingController? controller}) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 16.sp),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black, size: 20.sp),
        hintText: hint,
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
