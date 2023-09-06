import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/success_ad_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class AddPhotoOrVideo extends StatefulWidget {
  const AddPhotoOrVideo({Key? key}) : super(key: key);

  @override
  _AddPhotoOrVideoState createState() => _AddPhotoOrVideoState();
}

class _AddPhotoOrVideoState extends State<AddPhotoOrVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset("assets/icons/arrow.png", height: 18),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            const SizedBox(height: 25),
            _buildAddPhotoVideo(),
            const SizedBox(height: 25),
            _buildButtonAd(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Text(
      '3. Para finalizar, selecione suas imagens(no máximo 5) e/ou 1 vídeo de até 40 segundos',
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: CustomColors.black,
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildAddPhotoVideo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.lightGrey,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/camera.png',
                height: 30,
              ),
              const SizedBox(height: 8),
              Text(
                'Selecionar imagens e/ou vídeo',
                style: GoogleFonts.syne(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: CustomColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonAd() {
    return CustomAnimatedButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessAdPage(),
          ),
        );
      },
      widhtMultiply: 2,
      height: 45,
      colorText: Colors.white,
      color: CustomColors.mainBlue,
      text: "ADICIONAR ANÚNCIO",
    );
  }
}
