import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/ad_information_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class AdPage extends StatefulWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
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
            Navigator.pop(context);
          },
          icon: Image.asset("assets/icons/arrow.png", height: 18),
        ),
        title: Text(
          "ADICIONAR ANÚNCIO",
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhases(),
            _buildCategory(),
            _buildButtonAd(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildPhases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Para adicionar um anúncio siga as seguintes etapas:',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 25),
        Text(
          '1. Selecione a categoria do anúncio',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categoria',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Título do Alert'),
                  content: Text('Aqui terá todas as categorias'),
                  actions: [
                    CustomAnimatedButton(
                      widhtMultiply: 0.6,
                      text: 'Salvar',
                      height: 35,
                      color: CustomColors.mainBlue,
                      colorText: CustomColors.white,
                    ),
                  ],
                );
              },
            );
          },
          child: Material(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: CustomColors.lightGrey,
                  width: 2,
                ),
                color: CustomColors.lightGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selecione',
                      style: GoogleFonts.syne(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: CustomColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 35),
      ],
    );
  }

  Widget _buildButtonAd() {
    return CustomAnimatedButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdInformationPage(),
          ),
        );
      },
      widhtMultiply: 1,
      height: 45,
      colorText: Colors.white,
      color: CustomColors.mainGolden,
      text: "PROSSEGUIR",
    );
  }
}
