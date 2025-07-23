import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/features/reset_password/presentation/view/Screen/reset_password.dart';
import 'package:foodek_app/features/register/presentation/screen/signup.dart';
import '../../../../core/network/api_client.dart';
import '../../../../view/navigation_bar.dart';
import '../../../../view/widgets/bottom_widget.dart';
import '../../../../view/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF25AE4B),
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Image.asset(
              "assets/images/pattern.png",
              fit: BoxFit.cover, // Adjust for responsiveness
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 85.h),

                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 85.h,
                  width: 307.w,
                ),
                SizedBox(height: 42.h),

                // Login Container
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(20.w),
                    height: 661.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          tr("login"),
                          style: TextStyle(
                            color: const Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr("don_t_have_an_account"),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                tr("sign_up"),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Email Field
                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          hintText: "demo@example.com",
                          obscureText: false,
                          label: tr("email"),
                        ),
                        SizedBox(height: 25.h),

                        // Password Field
                        TextFieldWidget(
                          textEditingController: passwordTextEditingController,
                          hintText: "Enter Your Password",
                          obscureText: true,
                          label: tr("password"),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                          ),
                        ),
                        SizedBox(height: 14.h),

                        // Remember Me & Forgot Password
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              tr("remember_me"),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const ResetPassScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                tr("forgot_password"),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        // Login Button
                        ButtonWidget(
                          dataName: tr("log_in"),
                          onTap: () async {
                            try {
                              String email =
                                  emailTextEditingController.text.trim();
                              String password =
                                  passwordTextEditingController.text.trim();

                              String? token = await ApiClient().login(
                                email,
                                password,
                              );

                              if (token != null) {
                                print('Login successful. Token: $token');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigationBarScreen(),
                                  ),
                                );
                              } else {
                                print('Login failed: token is null');
                                // Optional: show a snackbar or dialog here
                              }
                            } catch (e) {
                              print('Login error: $e');
                            }
                          },
                          colors: Colors.white,
                        ),

                        SizedBox(height: 10.h),

                        // Divider with "Or"
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFEDF1F3),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                tr("or"),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF6C7278),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFEDF1F3),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        // Social Login Buttons
                        _buildContinueWithButton(
                          title: tr("continue_with_google"),
                          path: "assets/images/google_icon.png",
                        ),
                        SizedBox(height: 10.h),
                        _buildContinueWithButton(
                          title: tr("continue_with_facebook"),
                          path: "assets/images/facebook_icon.png",
                        ),
                        SizedBox(height: 10.h),
                        _buildContinueWithButton(
                          title: tr("continue_with_apple"),
                          path: "assets/images/apple_icon.png",
                        ),
                      ],
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

  // Social Login Buttons
  Widget _buildContinueWithButton({
    required String title,
    required String path,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFF0F6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: const Color(0xFFC0C0C0),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(path, width: 20.w, height: 20.h),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF1A1C1E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
