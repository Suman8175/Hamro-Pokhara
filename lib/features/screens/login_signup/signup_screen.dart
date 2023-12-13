import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/login_signup/login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        backgroundColor: Colors.transparent,
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
        _buildGreyText('signin_info'.tr()),
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
        const SizedBox(
          height: 10,
        ),
        _buildLoginButton(),
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
          color: HexColor.fromHex(loginSignupNormalText),
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

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email: ${emailController.text}");
          debugPrint("password: ${passwordController.text}");
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          backgroundColor: HexColor.fromHex(buttonColor),
          minimumSize: const Size.fromHeight(60),
        ),
        child: Text('signup'.tr()));
  }

  Widget _signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'already_have_acc'.tr(),
          style: TextStyle(
              color: HexColor.fromHex(loginSignupText2), fontSize: 18),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'login'.tr(),
                style: TextStyle(
                    color: HexColor.fromHex(loginSignupText2),
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
