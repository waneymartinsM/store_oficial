import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/boost/boost_ad_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class CardPaymentPage extends StatefulWidget {
  const CardPaymentPage({Key? key}) : super(key: key);

  @override
  _CardPaymentPageState createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _cardExpirationController = TextEditingController();
  final _cardCvvController = TextEditingController();

  String _cardNumber = 'XXXX XXXX XXXX XXXX';
  String _cardName = '---- ---- ---- ----';
  String _cardExpiration = 'MM/AA';
  String _cardCvv = 'XXX';

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _cardExpirationController.dispose();
    _cardCvvController.dispose();
    super.dispose();
  }

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
          icon: Image.asset(
            "assets/icons/arrow.png",
            height: 18,
          ),
        ),
        title: Text(
          "PAGAR COM CARTÃO",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0XFF02354b),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NOME DO CARTÃO',
                              style: GoogleFonts.syne(
                                  color: Color(0xfffcd76b),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            Text(
                              _cardName,
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          _cardNumber,
                          style: GoogleFonts.syne(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'VENCIMENTO',
                                  style: GoogleFonts.syne(
                                      color: Color(0xfffcd76b),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  _cardExpiration,
                                  style: GoogleFonts.syne(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CVV',
                                  style: GoogleFonts.syne(
                                      color: const Color(0xfffcd76b),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  _cardCvv,
                                  style: GoogleFonts.syne(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/icons/mcard.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  CustomTextField(
                    controller: _cardNameController,
                    onChange: (value) {
                      setState(() {
                        _cardName = value;
                      });
                    },
                    hintText: 'Nome do cartão',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: _cardNumberController,
                    onChange: (value) {
                      setState(() {
                        _cardNumber = formatCardNumber(value);
                      });
                    },
                    hintText: 'Número do cartão',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                          controller: _cardExpirationController,
                          onChange: (value) {
                            setState(() {
                              if (value.length == 2 &&
                                  _cardExpiration.length == 1) {
                                value += "/";
                              }
                              if (value.length > 5) {
                                value = value.substring(0, 5);
                              }
                              if (value.length >= 3) {
                                value =
                                    "${value.substring(0, 2)}/${value.substring(3)}";
                              }
                              _cardExpiration = value;
                            });
                          },
                          hintText: 'Vencimento',
                          textInputType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                          controller: _cardExpirationController,
                          onChange: (value) {
                            setState(() {
                              _cardCvv = value;
                            });
                          },
                          hintText: 'CVV',
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  CustomAnimatedButton(
                    onTap: () {},
                    widhtMultiply: 1,
                    height: 45,
                    colorText: Colors.white,
                    color: CustomColors.mainGolden,
                    text: "EFETUAR PAGAMENTO",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatCardNumber(String cardNumber) {
    // Remove qualquer espaço em branco no número do cartão
    String cleanedNumber = cardNumber.replaceAll(' ', '');
    // Verifica se o número possui menos de 16 dígitos
    if (cleanedNumber.length < 16) {
      return cleanedNumber.padRight(16, 'X');
    }
    // Adiciona os espaços a cada 4 dígitos
    String formattedNumber = cleanedNumber.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} ');
    // Retorna o número formatado
    return formattedNumber.trim();
  }
}
