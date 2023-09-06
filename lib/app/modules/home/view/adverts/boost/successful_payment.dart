import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/bottom_navigation.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class SuccessfulPayment extends StatelessWidget {
  const SuccessfulPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 325,
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Lottie.asset("assets/lottie/lottie_success.json"),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Pagamento efetuado, aguarde a aprovação do administrador",
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: CustomColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          Text(
            "Em breve seu anúncio\nvai ser um destaque",
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColors.greySubtitle,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
            child: CustomAnimatedButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigation(),
                  ),
                );
              },
              widhtMultiply: 1,
              height: 45,
              colorText: Colors.white,
              color: CustomColors.mainBlue,
              text: "CONCLUIR",
            ),
          ),
        ],
      ),
    );
  }
}
