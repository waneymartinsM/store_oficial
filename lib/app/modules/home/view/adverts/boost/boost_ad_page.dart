import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/boleto_payment_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/card_payment_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/pix_payment_page.dart';

class BoostAdPage extends StatelessWidget {
  const BoostAdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBlue,
      appBar: AppBar(
        backgroundColor: CustomColors.mainBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/arrow.png",
            height: 18,
            color: CustomColors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildTextBoost(),
            _buildPixPayment(context),
            const SizedBox(height: 15),
            _buildCardPayment(context),
            const SizedBox(height: 15),
           _buildBoletoPayment(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextBoost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "PLANO TURBINAR",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: CustomColors.mainGolden,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          "30 DIAS DE ANÚNCIO EM DESTAQUE DENTRO DA PLATAFORMA",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: CustomColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'R\$ ',
              style: GoogleFonts.syne(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: CustomColors.white,
              ),
            ),
            Text(
              '9',
              style: GoogleFonts.syne(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 60,
                color: CustomColors.white,
              ),
            ),
            Text(
              ',90',
              style: GoogleFonts.syne(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: CustomColors.white,
              ),
            ),
            Text(
              '/mês',
              style: GoogleFonts.syne(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: CustomColors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          'Selecione o método de pagamento',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: CustomColors.white,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildPixPayment(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PixPaymentPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/qr_code.png', height: 50,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pix',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    'Liberação do acesso de forma instantânea.',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPayment(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CardPaymentPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardPaymentPage(),
                  ),
                );
              },
              icon: Image.asset('assets/icons/cartao.png', height: 50,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Novo Cartão de Crédito',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    'Pagamento de forma segura e instantânea.',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildBoletoPayment(BuildContext context){
    return  InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BoletoPaymentPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/barras.png', height: 50,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Boleto',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    'Pagamento de forma segura e instantânea.',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: CustomColors.grey,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
