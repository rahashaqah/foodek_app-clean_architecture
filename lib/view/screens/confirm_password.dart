import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/util/responsive.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/success_dialog_widget.dart';
import '../widgets/text_field_widget.dart';
import '../../features/login/presentation/screen/login.dart';

class ConfirmPassScreen extends StatelessWidget {
  const ConfirmPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newPassTextEditingController =
        TextEditingController();
    TextEditingController confirmNewPassTextEditingController =
        TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF25AE4B),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/pattern.png",
            height: responsiveHeight(context, 932),
            width: responsiveWidth(context, 430),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(context, 85)),
                Image.asset(
                  'assets/images/logo.png',
                  height: responsiveHeight(context, 85),
                  width: responsiveWidth(context, 307),
                ),
                SizedBox(height: 50),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    height: responsiveHeight(context, 417),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_sharp),
                          ),
                        ),
                        SizedBox(height: responsiveHeight(context, 8)),
                        Text(
                          tr("reset_password"),
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              tr("want_to_try_with_my_current_password"),
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                tr("login"),
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsiveHeight(context, 2)),
                        TextFieldWidget(
                          textEditingController: newPassTextEditingController,
                          obscureText: true,
                          label: tr("new_password"),
                          hintText: tr("new_password"),
                        ),
                        SizedBox(height: responsiveHeight(context, 16)),
                        TextFieldWidget(
                          textEditingController:
                              confirmNewPassTextEditingController,
                          obscureText: true,
                          label: tr("confirm_new_password"),
                          hintText: tr("confirm_new_password"),
                        ),
                        SizedBox(height: responsiveHeight(context, 20)),
                        ButtonWidget(
                          dataName: tr("update_password"),
                          colors: Colors.white,
                          onTap: () {
                            showSuccessDialog(context);
                          },
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
}
