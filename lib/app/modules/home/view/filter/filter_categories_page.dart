import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/model/list_categories_model.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class FilterCategoriesPage extends StatefulWidget {
  const FilterCategoriesPage({Key? key}) : super(key: key);

  @override
  _FilterCategoriesPageState createState() => _FilterCategoriesPageState();
}

class _FilterCategoriesPageState extends State<FilterCategoriesPage> {
  final _name = TextEditingController();
  final _priceMin = TextEditingController();
  final _priceMax = TextEditingController();
  List<ListCategoriesModel> categories = [];
  List<Map<String, dynamic>> cities = [];
  List<int> selectedCities = [];

  Future<void> getCategories() async {
    const url =
        'https://webe.com.br/hm/webservice/usuario/interesses/listinteressesusuario';
    const token = 'f7DRB00J';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'TokenModel': jsonEncode({'token': token})
        },
      );
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        if (data != null && data is List<dynamic>) {
          setState(() {
            categories =
                data.map((item) => ListCategoriesModel.fromJson(item)).toList();
          });
        } else {
          print('Error: Invalid response data');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchCities() async {
    const url = 'https://webe.com.br/hm/webservice/usuario/anuncios/listcidadeestado';
    const cidade = 'Porto Alegre';
    const token = 'f7DRB00J';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'cidade': cidade,
        'token': token,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> apiResponse = jsonDecode(response.body);
      print("$apiResponse");
      setState(() {
        cities = apiResponse.map((city) => city as Map<String, dynamic>).toList();
        print("${response.statusCode}");
        print("$cities");
      });
    } else {
      print('Erro na solicitação: ${response.statusCode}');
    }
  }

  void showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione as cidades'),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(
                cities.length,
                    (index) {
                  final city = cities[index];
                  return CheckboxListTile(
                    title: Text(city['nome']),
                    value: selectedCities.contains(city['id']),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          selectedCities.add(city['id']);
                        } else {
                          selectedCities.remove(city['id']);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedCities);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    ).then((selectedCities) {
      if (selectedCities != null) {
        print('Cidades selecionadas: $selectedCities');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
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
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/arrow.png",
            height: 18,
          ),
        ),
        title: _buildTextAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildTextAppBar() {
    return Text(
      "FILTRAR",
      style: GoogleFonts.syne(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: CustomColors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextCategory(),
            _buildCategories(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildLocalization(),
                  _buildName(),
                  _buildPrice(),
                  _buildButtonFilter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "CATEGORIAS",
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: CustomColors.black,
            ),
          ),
          Text(
            "Ver tudo",
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: CustomColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
              (index) => Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: SizedBox(
              width: 80,
              height: 110,
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.lightGrey,
                    ),
                    child: Center(
                      child: Image.network(
                        'https://webe.com.br/_uploads/categorias/${categories[index].url}',
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categories[index].nome ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.syne(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocalization() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          "LOCALIZAÇÃO",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: () {
            //showCitySelectionDialog(context);
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
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NOME',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ), //Ex: Tablet Samsung Galaxy A7
        const SizedBox(height: 6),
        CustomTextField(
          controller: _name,
          hintText: 'Ex: Tablet Samsung Galaxy A7',
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
          'PREÇO',
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _priceMin,
                    hintText: 'Min.',
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: CustomTextField(
                controller: _priceMax,
                hintText: 'Max.',
                textInputType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: CustomAnimatedButton(
        onTap: () {},
        widhtMultiply: 1,
        height: 45,
        colorText: Colors.white,
        color: CustomColors.mainGolden,
        text: "ADICIONAR FILTRO",
      ),
    );
  }

  Widget _buildIconStar() {
    return IconButton(
        onPressed: () {},
        icon: const FaIcon(
          FontAwesomeIcons.solidStar,
          size: 18,
        ));
  }
}