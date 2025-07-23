import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/responsive.dart';
import '../../../../../view/widgets/bottom_widget.dart';
import '../../../../../view/widgets/otp_widget.dart';
import '../../../../../view/widgets/text_field_widget.dart';
import '../../../../login/presentation/screen/login.dart';
import '../../cubit/reset_password_cubit.dart';
import '../../state/reset_password_state.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF25AE4B),
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
                SizedBox(height: 85),
                Image.asset(
                  'assets/images/logo.png',
                  height: responsiveHeight(context, 85),
                  width: responsiveWidth(context, 307),
                ),
                SizedBox(height: 150),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: responsiveHeight(context, 366),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_sharp),
                            ),
                            RichText(
                              text: TextSpan(
                                text: tr("back_to"),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF111827),
                                ),
                                children: [
                                  TextSpan(
                                    mouseCursor: MouseCursor.defer,
                                    text: tr("login"),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF25AE4B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginScreen(),
                                          ),
                                        );
                                      },
                                  ),
                                  TextSpan(
                                    text: context.locale.languageCode == "en" ? " page?" : "؟",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF111827),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          tr("reset_password"),
                          style: TextStyle(
                            color: const Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          tr(
                            "enter_your_e_mail_or_phone_and_we_ll_send_you_a_link_to_get_back_into_your_account",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: const Color(0xFF6C7278),
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tr("email"),
                            style: TextStyle(
                              color: AppColors.dark_grey,
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: responsiveHeight(context, 3)),
                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          obscureText: false,
                          label: tr("email"),
                          hintText: "Enter your email",
                        ),
                        SizedBox(height: responsiveHeight(context, 24)),

                        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                          listener: (context, state) {
                            if (state is SendOTPSuccess) {
                              showVerifyDialog(context);
                            } else if (state is ResetPasswordFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(tr("send_failed"))),
                              );
                            }
                          },
                          builder: (context, state) {
                            return ButtonWidget(
                              dataName: tr("send"),
                              colors: Colors.white,
                              onTap: () {
                                context
                                    .read<ResetPasswordCubit>()
                                    .sendOTP(emailTextEditingController.text.trim());
                              },
                            );
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
