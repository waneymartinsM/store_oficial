import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/login/model/recover_pass_model.dart';
import 'package:store_oficial/app/modules/login/repository/login_repository.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';
import 'package:store_oficial/app/widgets/simple_alert.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBlue,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          gradient: CustomColors.mainBlueGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoImage(),
            _buildTextForgotPass(),
            _buildTextSendLink(),
            const SizedBox(height: 22),
            _buildForm(),
            const SizedBox(height: 50),
            _buildButton(),
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

  Widget _buildTextForgotPass() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text(
        "ESQUECEU SUA SENHA?",
        style: GoogleFonts.syne(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget _buildTextSendLink() {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Text(
        "Insira o seu email e enviaremos um link para você\nvoltar a acessar a sua conta.",
        style: GoogleFonts.syne(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: CustomColors.grey,
        ),
      ),
    );
  }

  Widget _buildForm() {
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
        ),
      ],
    );
  }

  Widget _buildButton() {
    return CustomAnimatedButton(
      onTap: () async {
        final recoverPassModel = RecoverPassModel(
          email: _email.text.trim(),
          token: "f7DRB00J",
        );
        final result = await recoverPassword(recoverPassModel);
        if (result['status'] == '01') {
          showMessage(context,
              'As instruções para alteração de senha foram enviadas para o seu e-mail.');
        } else {
          print('Falha ao enviar link : ${result['message']}');
          showMessage(context, 'Falha ao enviar link : ${result['message']}');
        }
      },
      widhtMultiply: 1,
      height: 45,
      colorText: CustomColors.white,
      color: CustomColors.mainGolden,
      text: "Enviar link de recuperação",
    );
  }
}
