import 'package:flutter/material.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/login/view/signin_page.dart';
import 'package:store_oficial/app/modules/login/view/signup_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColors.mainBlueGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildLogoImage(),
              _buildButtonSignIn(),
              _buildButtonSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/icons/store_logo.png",
            height: MediaQuery.of(context).size.height * 0.09),
      ),
    );
  }

  Widget _buildButtonSignIn() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: CustomAnimatedButton(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInPage()),
          );
        },
        widhtMultiply: 1,
        height: 45,
        colorText: CustomColors.white,
        color: CustomColors.mainGolden,
        text: "ENTRAR",
      ),
    );
  }

  Widget _buildButtonSignUp() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
      child: CustomAnimatedButton(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          );
        },
        widhtMultiply: 1,
        height: 45,
        colorText: CustomColors.darkBlue,
        color: CustomColors.white,
        text: "CRIAR CONTA",
      ),
    );
  }
}
