import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/bottom_navigation.dart';
import 'package:store_oficial/app/modules/login/view/recover_password_page.dart';
import 'package:store_oficial/app/modules/login/view/signup_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';
import 'package:store_oficial/app/widgets/custom_text_field_password.dart';
import 'package:validatorless/validatorless.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool viewPass = true;

  void _boolViewPass() => setState(() => viewPass = !viewPass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration:
            const BoxDecoration(gradient: CustomColors.mainBlueGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoImage(),
            _buildTextWelcome(),
            _buildTextSignInSignUp(),
            const SizedBox(height: 22),
            _buildForm(),
            _buildForgotPassword(),
            const SizedBox(height: 50),
            _buildButtonSignIn(),
            const SizedBox(height: 20),
            _buildTextSignUp(),
            const SizedBox(height: 30),
            _buildButtonEnterWith(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Image.asset(
          "assets/icons/store_logo.png",
          height: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
    );
  }

  Widget _buildTextWelcome() {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Text(
        "BEM-VINDO",
        style: TextStyle(
          fontFamily: 'Syne',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget _buildTextSignInSignUp() {
    return const Padding(
      padding: EdgeInsets.only(top: 7),
      child: Text(
        "Faça login ou cadastre-se para continuar",
        style: TextStyle(
          fontFamily: 'Syne',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: CustomColors.grey,
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          _buildFormEmail(),
          _buildFormPassword(),
        ],
      ),
    );
  }

  Widget _buildFormEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.white,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'E-mail',
          icon: const Icon(
            Icons.alternate_email_rounded,
            color: CustomColors.grey,
          ),
          textInputType: TextInputType.emailAddress,
          controller: _email,
          validator: Validatorless.multiple([
            Validatorless.required("Campo obrigatório"),
            Validatorless.email("E-mail inválido."),
          ]),
        ),
        const SizedBox(height: 22),
      ],
    );
  }

  Widget _buildFormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Senha',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.white,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextFieldPassword(
          hintText: 'Senha',
          icon: const Icon(
            Icons.lock_outline_rounded,
            color: CustomColors.grey,
          ),
          onTapPassword: () {
            _boolViewPass();
          },
          visualizar: viewPass,
          password: true,
          obscureText: viewPass,
          textInputType: TextInputType.visiblePassword,
          controller: _pass,
          validator: Validatorless.multiple([
            Validatorless.required("Campo obrigatório"),
            Validatorless.min(8, "A senha deve ter no mínimo 8 caracteres"),
            Validatorless.max(20, "A senha deve ter no máximo 20 caracteres"),
          ]),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecoverPasswordPage()),
        );
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          'Esqueceu a senha?',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: CustomColors.grey,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  Widget _buildButtonSignIn() {
    return CustomAnimatedButton(
      onTap: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
        // final isValid = _formKey.currentState?.validate() ?? false;
        // if (isValid) {
        //   final signInModel = SignInModel(
        //     email: _email.text,
        //     password: _pass.text,
        //     token: "f7DRB00J",
        //   );
        //
        //   final result = await signIn(signInModel);
        //   if (result['status'] == '02') {
        //     print('Falha ao realizar o login: ${result['message']}');
        //     showMessage(context,
        //         'Falha ao realizar ao realizar login: ${result['message']}');
        //   } else {
        //     print('Login realizado com sucesso!');
        //     Future.microtask(() {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const BottomNavigation()),
        //       );
        //     });
        //   }
        // }
      },
      widhtMultiply: 1,
      height: 45,
      colorText: CustomColors.white,
      color: CustomColors.mainGolden,
      text: "ENTRAR",
    );
  }

  Widget _buildTextSignUp() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Não tem uma conta?',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            ' Registre-se',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonEnterWith() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: CustomColors.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                  child: Image.asset('assets/icons/google.png', width: 25)),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: CustomColors.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.blue.shade800,
                  size: 20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: CustomColors.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.apple,
                  color: CustomColors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
