import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/bottom_navigation.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_list.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _search = TextEditingController();
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.darkBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: _buildTextAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          gradient: CustomColors.mainBlueGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSearchCategories(),
            Expanded(child: _buildListCategories()),
            const SizedBox(height: 20),
            _buildButtonSignUp(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "CATEGORIAS",
          style: GoogleFonts.syne(
            color: CustomColors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Text(
          "Opcional",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: CustomColors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSearchCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomTextField(
        hintText: 'Pesquisar por categorias...',
        icon: const Icon(Icons.search, color: CustomColors.grey),
        textInputType: TextInputType.text,
        controller: _search,
      ),
    );
  }

  Widget _buildListCategories() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final isSelected = selectedItems.contains(index);
        final item = data[index];

        return InkWell(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedItems.remove(index);
              } else {
                selectedItems.add(index);
              }
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isSelected
                        ? CustomColors.greyStar
                        : CustomColors.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item['icon'].toString(),
                          height: 25,
                          color: isSelected
                              ? CustomColors.white
                              : CustomColors.black
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          child: Text(
                            item['text'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.syne(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: isSelected
                                  ? CustomColors.white
                                  : CustomColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtonSignUp() {
    return CustomAnimatedButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          ),
        );
      },
      widhtMultiply: 1,
      height: 45,
      colorText: CustomColors.white,
      color: CustomColors.mainGolden,
      text: "CADASTRAR",
    );
  }
}
