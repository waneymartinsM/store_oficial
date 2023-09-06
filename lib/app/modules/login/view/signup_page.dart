import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/login/view/categories_page.dart';
import 'package:store_oficial/app/modules/login/view/signin_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';
import 'package:store_oficial/app/widgets/custom_text_field_password.dart';
import 'package:validatorless/validatorless.dart';

import 'local_widgets/webview.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _cpf = TextEditingController();
  final _birth = TextEditingController();
  final _phone = TextEditingController();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();

  bool viewPass = true;
  bool viewConfirmPass = true;
  bool termosPrivacidade = false;

  void _boolViewPass() => setState(() => viewPass = !viewPass);
  void _boolViewConfirmPass() =>
      setState(() => viewConfirmPass = !viewConfirmPass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration:
            const BoxDecoration(gradient: CustomColors.mainBlueGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoImage(),
            _buildTextSignUp(),
            _buildTextCreateAccount(),
            _buildForm(),
            _buildPrivacyPolicy(),
            const SizedBox(height: 25),
            _buildButtonNext(),
            const SizedBox(height: 20),
            _buildSignIn(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Image.asset(
          "assets/icons/store_logo.png",
          height: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
    );
  }

  Widget _buildTextSignUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text(
        "REGISTRE-SE",
        style: GoogleFonts.syne(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: CustomColors.white,
        ),
      ),
    );
  }

  Widget _buildTextCreateAccount() {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Text(
        "Criar uma nova conta",
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
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Text(
            'Nome',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 6),
          CustomTextField(
            hintText: 'Nome Completo',
            icon: const Icon(
              Icons.person_outline_rounded,
              color: CustomColors.grey,
            ),
            textInputType: TextInputType.text,
            controller: _name,
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
              Validatorless.min(3, "O nome deve ter no mínimo 3 caracteres"),
              Validatorless.max(20, "O nome deve ter no máximo 20 caracteres"),
            ]),
          ),
          const SizedBox(height: 22),
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
          Text(
            'CPF',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 6),
          CustomTextField(
            hintText: 'CPF',
            icon: const Icon(
              Icons.person,
              color: CustomColors.grey,
            ),
            textInputType: TextInputType.number,
            controller: _cpf,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
              Validatorless.cpf("CPF inválido."),
            ]),
          ),
          const SizedBox(height: 22),
          Text(
            'Data de Nascimento',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 6),
          CustomTextField(
            hintText: 'Data de Nascimento',
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: CustomColors.grey,
            ),
            textInputType: TextInputType.number,
            controller: _birth,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              DataInputFormatter(),
            ],
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
            ]),
          ),
          const SizedBox(height: 22),
          Text(
            'Celular',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 6),
          CustomTextField(
            hintText: 'Celular',
            icon: const Icon(
              Icons.phone,
              color: CustomColors.grey,
            ),
            textInputType: TextInputType.phone,
            controller: _phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
            ]),
          ),
          const SizedBox(height: 22),
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
          const SizedBox(height: 22),
          Text(
            'Confirmar senha',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 6),
          CustomTextFieldPassword(
            hintText: 'Confirmar senha',
            icon: const Icon(
              Icons.lock_outline_rounded,
              color: CustomColors.grey,
            ),
            onTapPassword: () {
              _boolViewConfirmPass();
            },
            visualizar: viewConfirmPass,
            password: true,
            obscureText: viewConfirmPass,
            textInputType: TextInputType.visiblePassword,
            controller: _confirmPass,
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
              Validatorless.min(8, "A senha deve ter no mínimo 8 caracteres"),
              Validatorless.max(20, "A senha deve ter no máximo 20 caracteres"),
              Validatorless.compare(_pass, "As senhas não correspondem"),
            ]),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _buildPrivacyPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: termosPrivacidade,
          onChanged: (value) {
            setState(() => termosPrivacidade = value!);
          },
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return CustomColors.mainGolden;
            }
            return CustomColors.mainGolden;
          }),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const CustomWebView(
                title: "Política de Privacidade",

                ///TODO: Criar uma página c/ as políticas de privacidade
                url: "https:///politica/politica.html",
              ),
            );
          },
          child: Text(
            'Aceitar Política de Privacidade',
            style: GoogleFonts.syne(
                fontSize: 14,
                color: CustomColors.white.withOpacity(0.7),
                decoration: TextDecoration.underline,
                decorationColor: CustomColors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonNext() {
    return CustomAnimatedButton(
      onTap: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CategoriesPage()),
        );
        // final isValid = _formKey.currentState?.validate() ?? false;
        // final locationModel = LocationModel();
        // await locationModel.getPosition();
        // if (isValid) {
        //   final model = SignUpModel(
        //     nome: _name.text.trim(),
        //     email: _email.text.trim(),
        //     celular: _phone.text.trim(),
        //     dataNascimento: _birth.text.trim(),
        //     interesses: ["1909", "1882", "1845"],
        //     documento: _cpf.text.trim(),
        //     password: _pass.text.trim(),
        //     latitude: locationModel.lat.toString(),
        //     longitude: locationModel.long.toString(),
        //     token: "f7DRB00J",
        //   );
        //   final result = await signUp(model);
        //   if (result['status'] == '02') {
        //     print('Falha ao realizar o cadastro: ${result['message']}');
        //     showMessage(context, 'Falha ao realizar o cadastro: ${result['message']}');
        //   } else {
        //     print('Cadastro realizado com sucesso!');
        //     Future.microtask(() {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => const CategoriesPage()),
        //       );
        //     });
        //   }
        // }
      },
      widhtMultiply: 1,
      height: 45,
      colorText: Colors.white,
      color: CustomColors.mainGolden,
      text: "PRÓXIMO",
    );
  }

  Widget _buildSignIn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Já tem uma conta?',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            ' Entrar',
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
}
