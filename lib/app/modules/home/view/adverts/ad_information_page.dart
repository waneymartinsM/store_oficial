import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/adverts/add_photo_or_video.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class AdInformationPage extends StatefulWidget {
  const AdInformationPage({Key? key}) : super(key: key);

  @override
  _AdInformationPageState createState() => _AdInformationPageState();
}

class _AdInformationPageState extends State<AdInformationPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _discount = TextEditingController();
  final _link = TextEditingController();

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
            _buildTitle(),
            _buildDescription(),
            _buildPrice(),
            _buildDiscount(),
            _buildLink(),
            _buildButtonAd(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Text(
      '2. Preencha os campos com o título, a descrição, o valor, o percentual desconto e um link externo, respectivamente',
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: CustomColors.black,
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Título do anúncio',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: _title,
          hintText: 'Ex: Tablet Samsung Galaxy A7',
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: _description,
          hintText: 'Ex: Tablet Samsung Galaxy Tab A8 X200 com Tela 10.5',
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Valor',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: _price,
          hintText: 'Ex: R\$ 1.234,05',
          textInputType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDiscount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Percentual de Desconto',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: _discount,
          hintText: 'Ex: 10%',
          textInputType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}?%?$')),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLink() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Link externo',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: _link,
          hintText: 'Ex: https://www.nomedosite.com.br',
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildButtonAd() {
    return CustomAnimatedButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddPhotoOrVideo(),
          ),
        );
      },
      widhtMultiply: 2,
      height: 45,
      colorText: Colors.white,
      color: CustomColors.mainGolden,
      text: "PROSSEGUIR",
    );
  }
}
