import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/boost_ad_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/successful_payment.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class PixPaymentPage extends StatefulWidget {
  const PixPaymentPage({Key? key}) : super(key: key);

  @override
  _PixPaymentPageState createState() => _PixPaymentPageState();
}

class _PixPaymentPageState extends State<PixPaymentPage> {
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
            );
          },
          icon: Image.asset("assets/icons/arrow.png", height: 18),
        ),
        title: Text(
          "PAGAR COM PIX",
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
        child: _buildCardPayPix(),
      ),
    );
  }

  Widget _buildCardPayPix() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStepOne(),
          const SizedBox(height: 20),
          _buildStepTwo(),
          const SizedBox(height: 20),
          _buildStepThree(),
          const SizedBox(height: 20),
          _buildQRCode(),
          _buildLinkQRCode(),
          const SizedBox(height: 20),
          _buildTextRelease(),
          const SizedBox(height: 20),
          _buildButtonCopyCode(),
          _buildButtonSaveImage(),
          _buildButtonCompletedPayment(),
        ],
      ),
    );
  }

  Widget _buildStepOne() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        '1.Acesse seu Internet Banlink ou app de\npagamentos.',
        style: GoogleFonts.syne(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: CustomColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStepTwo() {
    return Text(
      '2.Escolha pagar via Pix/Código Qr.',
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: CustomColors.black,
      ),
    );
  }

  Widget _buildStepThree() {
    return Text(
      '3.Escaneie o seguinte código:',
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: CustomColors.black,
      ),
    );
  }

  Widget _buildQRCode() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/icons/QRCode.png",
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }

  Widget _buildLinkQRCode() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: boxDecoration(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '00020126360014br.gov.bcb.pix01143637506500016952040000530398654049.905802BR5925WEBEUPWEBEUP20230222133506009Sao Paulo62240520mpqrinter5800113014263043E6C',
              style: GoogleFonts.syne(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRelease() {
    return Text(
      'A liberação da reserva ocorrerá de forma\ninstantânea, após o pagamento realizado.',
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: CustomColors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtonCopyCode() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomAnimatedButton(
        onTap: () {},
        widhtMultiply: 1,
        height: 40,
        outlined: true,
        borderColor: CustomColors.mainBlue,
        colorText: CustomColors.mainBlue,
        text: "COPIAR CÓDIGO",
      ),
    );
  }

  Widget _buildButtonSaveImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomAnimatedButton(
        onTap: () {},
        widhtMultiply: 1,
        height: 40,
        outlined: true,
        borderColor: CustomColors.mainBlue,
        colorText: CustomColors.mainBlue,
        text: "SALVAR IMAGEM",
      ),
    );
  }

  Widget _buildButtonCompletedPayment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomAnimatedButton(
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
        text: "JÁ REALIZEI O PAGAMENTO",
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
