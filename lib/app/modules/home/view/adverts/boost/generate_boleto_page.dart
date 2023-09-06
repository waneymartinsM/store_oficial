import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/boleto_payment_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/successful_payment.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class GenerateBoletoPage extends StatefulWidget {
  const GenerateBoletoPage({Key? key}) : super(key: key);

  @override
  _GenerateBoletoPageState createState() => _GenerateBoletoPageState();
}

class _GenerateBoletoPageState extends State<GenerateBoletoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BoletoPaymentPage(),
              ),
            );
          },
          icon: Image.asset(
            "assets/icons/arrow.png",
            height: 18,
          ),
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
        child: _buildGenerateBoleto(),
      ),
    );
  }

  Widget _buildGenerateBoleto() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Para pagar pelo Internet Banking, copie a linha digitável ou escaneie o código de barras.',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: CustomColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Se o pagamento é feito de segunda a sexta, é creditado no dia seguinte. Se você paga no fim de semana, será creditado na terça-feira.',
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: CustomColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/barras.png",
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          Container(
            decoration: boxDecoration(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '905802BR592520230222133506009o62240520mpqrinter5800113014263043E6C',
                  style:  GoogleFonts.syne(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          CustomAnimatedButton(
            onTap: () {},
            widhtMultiply: 1,
            height: 40,
            outlined: true,
            borderColor: CustomColors.mainBlue,
            colorText: CustomColors.mainBlue,
            text: "COPIAR CÓDIGO",
          ),
          const SizedBox(height: 20),
          CustomAnimatedButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuccessfulPayment(),
                ),
              );
            },
            widhtMultiply: 1,
            height: 40,
            outlined: true,
            borderColor: CustomColors.mainBlue,
            colorText: CustomColors.mainBlue,
            text: "OK",
          ),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: CustomColors.white,
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
