import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../screens/confirm_password.dart';
import 'bottom_widget.dart';

void showVerifyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      String userOtp = ""; // Declare inside the builder scope

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/sent_message.png", height: 153),
                  SizedBox(height: 16),
                  Text(
                    tr(
                      "a_4_digit_code_has_been_sent_to_your_email_please_enter_it_to_verify",
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF6C7278)),
                  ),
                  SizedBox(height: 30),
                  Pinput(
                    length: 4,
                    showCursor: true,
                    onChanged: (value) {
                      setState(() {
                        userOtp = value;
                      });
                    },
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 55,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    separatorBuilder: (index) => SizedBox(width: 16),
                  ),
                  SizedBox(height: 26),
                  ButtonWidget(
                    dataName: tr("verify"),
                    colors: Colors.white,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmPassScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
