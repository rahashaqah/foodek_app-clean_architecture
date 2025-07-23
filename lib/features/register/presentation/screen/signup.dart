import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/responsive.dart';
import '../../../../core/util/secure_storage_helper.dart';
import '../../../../view/navigation_bar.dart';
import '../../../../view/widgets/bottom_widget.dart';
import '../../../../view/widgets/custom_text.dart';
import '../../../../view/widgets/text_field_widget.dart';
import '../../../login/presentation/screen/login.dart';
import '../cubit/register_cubit.dart';
import '../state/register_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController dobController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    dobController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25AE4B),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          if (state is RegisterStateLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RegisterStateLoaded ||
              state is RegisterStateIntl) {
            return _buildSignupForm(context);
          } else if (state is RegisterStateError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text("Unhandled state: $state"));
          }
        },
      ),
    );
  }

  Widget _buildSignupForm(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/pattern.png",
          height: responsiveHeight(context, 932),
          width: responsiveWidth(context, 430),
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: responsiveHeight(context, 85)),
              Image.asset(
                'assets/images/logo.png',
                height: responsiveHeight(context, 85),
                width: responsiveWidth(context, 307),
              ),
              SizedBox(height: responsiveHeight(context, 42)),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 20),
                  ),
                  padding: EdgeInsets.all(responsiveWidth(context, 20)),
                  height: responsiveHeight(context, 672),
                  width: responsiveWidth(context, 343),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: responsiveWidth(context, 24),
                        height: responsiveHeight(context, 24),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_sharp),
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 24)),

                      Text(
                        tr("sign_up"),
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontFamily: "Inter",
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            tr("already_have_an_account"),
                            style: TextStyle(fontSize: 12.sp),
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
                                fontSize: 12.sp,
                                color: Color(0xFF25AE4B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFieldWidget(
                        textEditingController: nameController,
                        obscureText: false,
                        label: tr("full_name"),
                        hintText: tr("full_name"),
                        keyboardType: TextInputType.name,
                      ),
                      TextFieldWidget(
                        textEditingController: emailController,
                        obscureText: false,
                        label: tr("email"),
                        hintText: tr("email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).unfocus(); // Hide keyboard
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat(
                              'yyyy-MM-dd',
                            ).format(pickedDate);
                            setState(() {
                              dobController.text = formattedDate.toString();
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFieldWidget(
                            textEditingController: dobController,
                            obscureText: false,
                            label: tr("date_of_birth"),
                            hintText: tr("date_of_birth"),
                            suffixIcon: Icon(Icons.date_range_outlined),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: responsiveHeight(context, 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: tr("phone_number"),
                              weight: FontWeight.w500,
                              size: 12,
                              color: AppColors.grey,
                            ),
                            SizedBox(height: responsiveHeight(context, 2)),
                            IntlPhoneField(
                              disableLengthCheck: true,
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: responsiveHeight(context, 10),
                                  horizontal: responsiveWidth(context, 12),
                                ),
                                labelText: tr("phone_number"),
                                hintText: tr("phone_number"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFieldWidget(
                        textEditingController: passwordController,
                        obscureText: true,
                        label: tr("set_password"),
                        hintText: tr("set_password"),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: responsiveHeight(context, 24)),
                      ButtonWidget(
                        colors: Colors.white,
                        dataName: tr("register"),
                        onTap: () async {
                          // final model = RegisterModel(
                          //   name: nameController.text.trim(),
                          //   email: emailController.text.trim(),
                          //   birth_date: dobController.text.trim(),
                          //   phone_number:
                          //   phoneController.text.trim(),
                          //   password: passwordController.text.trim(),
                          // );
                          //
                          // context.read<RegisterCubit>().register(model);
                          try {
                            String name = nameController.text.trim();
                            String email = emailController.text.trim();
                            String dob = dobController.text.trim();
                            String number = phoneController.text.trim();
                            String password = passwordController.text.trim();

                            print(
                              "Request:\n$name\n$email\n$dob\n$number\n$password",
                            );

                            Map<String, dynamic>? response = await ApiClient()
                                .signup(
                                  name: name,
                                  email: email,
                                  dob: dob,
                                  number: number,
                                  password: password,
                                );

                            if (response != null &&
                                response['status'] == true) {
                              String token = response['data']['token'];

                              print(
                                'Registration successful. Response: $response',
                              );

                              await SecureStorageHelper.instance.savePrefString(
                                key: 'auth_token',
                                value: token,
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationBarScreen(),
                                ),
                              );
                            } else {
                              print(
                                'Registration failed. Message: ${response?['message']}',
                              );
                            }
                          } catch (e) {
                            print('Registration error: $e');
                          }
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
    );
  }
}
