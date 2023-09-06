import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/boost_ad_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/generate_boleto_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class BoletoPaymentPage extends StatefulWidget {
  const BoletoPaymentPage({Key? key}) : super(key: key);

  @override
  _BoletoPaymentPageState createState() => _BoletoPaymentPageState();
}

class _BoletoPaymentPageState extends State<BoletoPaymentPage> {
  final _cpf = TextEditingController();
  final _cep = TextEditingController();
  final _uf = TextEditingController();
  final _city = TextEditingController();
  final _street = TextEditingController();
  final _neighborhood = TextEditingController();
  final _numberHouse = TextEditingController();
  final _complement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BoostAdPage(),
              ),
            );          },
          icon: Image.asset(
            "assets/icons/arrow.png",
            height: 18,
          ),
        ),
        title: Text(
          "GERAR BOLETO",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: boxDecoration(),
        child: _buildUserData(),
      ),
    );
  }

  Widget _buildUserData() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTextField(
              readOnly: true,
              hintText: 'Waney Rafaele dos Santos Martins',
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              readOnly: true,
              hintText: 'waneymartins2003@hotmail.com',
              textInputType: TextInputType.text,
            ),
            const Divider(color: CustomColors.grey, height: 35, thickness: 1),
            CustomTextField(
              hintText: 'CPF',
              textInputType: TextInputType.number,
              controller: _cpf,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            const Divider(color: CustomColors.grey, height: 35, thickness: 1),
            CustomTextField(
              hintText: 'CEP',
              textInputType: TextInputType.number,
              controller: _cep,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomTextField(
                    hintText: 'UF',
                    contentPadding: null,
                    textInputType: TextInputType.text,
                    controller: _uf,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 2,
                  child: CustomTextField(
                    hintText: 'Cidade',
                    contentPadding: null,
                    textInputType: TextInputType.text,
                    controller: _city,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Rua',
              textInputType: TextInputType.text,
              controller: _street,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Bairro',
              textInputType: TextInputType.text,
              controller: _neighborhood,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomTextField(
                    hintText: 'N°',
                    contentPadding: null,
                    textInputType: TextInputType.number,
                    controller: _numberHouse,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 2,
                  child: CustomTextField(
                    hintText: 'Complemento',
                    contentPadding: null,
                    textInputType: TextInputType.text,
                    controller: _complement,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomAnimatedButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateBoletoPage(),
                  ),
                );
              },
              widhtMultiply: 1,
              height: 45,
              colorText: CustomColors.white,
              color: CustomColors.mainGolden,
              text: "EFETUAR PAGAMENTO",
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: CustomColors.mainBlue,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
