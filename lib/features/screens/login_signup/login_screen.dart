import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/homepage.dart';
import 'package:yhhhamropokhara/features/screens/login_signup/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late double mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = HexColor.fromHex(primaryColor);
    mediaSize = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: myColor,
        image: const DecorationImage(
          image: AssetImage("assets/images/LoginImage.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'hamro_pokhara'.tr(),
            style: TextStyle(
                color: HexColor.fromHex(loginpageheadingcolor),
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome'.tr(),
          style: TextStyle(
            color: myColor,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildGreyText('login_info'.tr()),
        const SizedBox(
          height: 30,
        ),
        _buildGreyText('email_address'.tr()),
        _buildInputField(emailController),
        const SizedBox(
          height: 20,
        ),
        _buildGreyText('password'.tr()),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(
          height: 20,
        ),
        _buildRememberForgot(),
        const SizedBox(
          height: 10,
        ),
        _buildLoginButton(context),
        const SizedBox(
          height: 20,
        ),
        _signUpButton()
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: HexColor.fromHex(
              loginSignupNormalText), //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText('remember_me'.tr())
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText('forget_password'.tr()))
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email: ${emailController.text}");
          debugPrint("password: ${passwordController.text}");

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          backgroundColor: HexColor.fromHex(buttonColor),
          minimumSize: const Size.fromHeight(60),
        ),
        child: Text('login'.tr()));
  }

  Widget _signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'dont_have_acc'.tr(),
          style: TextStyle(
              color: HexColor.fromHex(loginSignupText2), fontSize: 18),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'signup'.tr(),
                style: TextStyle(
                    color: HexColor.fromHex(
                        loginSignupText2), //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}