import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/model/ad_information_model.dart';
import 'package:store_oficial/app/modules/home/model/list_ads_model.dart';
import 'package:store_oficial/app/modules/home/model/list_categories_model.dart';
import 'package:store_oficial/app/modules/home/model/list_stories_model.dart';
import 'package:store_oficial/app/modules/home/model/location_model.dart';
import 'package:store_oficial/app/modules/home/repository/home_repository.dart';
import 'package:store_oficial/app/modules/home/view/ad/ad_details_page.dart';
import 'package:store_oficial/app/modules/home/view/adverts/ad_page.dart';
import 'package:store_oficial/app/modules/home/view/filter/filter_categories_page.dart';
import 'package:store_oficial/app/modules/home/view/notifications/notifications_page.dart';
import 'package:store_oficial/app/widgets/custom_list.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? videoController;
  List<ListStoriesModel> stories = [];
  List<ListCategoriesModel> categories = [];
  List<AnunciosPais> anunciosPais = [];
  int _activeButtonIndex = -1;
  bool isLoading = true;

  void getAnuncios() async {
    setState(() {
      isLoading = true;
    });
    LocationModel locationModel = LocationModel();
    await locationModel.getPosition();

    ListAdsModel listAdsModel = ListAdsModel(
      latitude: locationModel.lat.toString(),
      longitude: locationModel.long.toString(),
      token: '',
    );
    try {
      anunciosPais.clear();
      AdModel adModel = await fetchAnuncio(listAdsModel);
      anunciosPais.addAll(adModel.anunciosPais ?? []);
      print("$adModel");
    } catch (e) {
      print('Erro ao obter anúncios: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void exibirVideo(String url) {
    videoController = VideoPlayerController.network(url);
    videoController?.initialize().then((_) {
      setState(() {
        videoController?.play();
      });
    });
  }

  Future<void> getCategories() async {
    const url = '';
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

  Future<void> getStories() async {
    const token = '';
    const url = '';
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
            stories =
                data.map((item) => ListStoriesModel.fromJson(item)).toList();
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

  @override
  void initState() {
    super.initState();
    // getAnuncios();
    // getStories();
    // getCategories();
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Column(
              children: [_buildAppBar()],
            ),
          ),
          _buildCategories(),
          _buildAdBanners(),
          // ChangeNotifierProvider<LocationModel>(
          //   create: (context) => LocationModel(),
          //   child: Builder(
          //     builder: (context) {
          //       final local = context.watch<LocationModel>();
          //       String mensage = local.error == ""
          //           ? 'Latitude: ${local.lat} | Logintude: ${local.long}'
          //           : local.error;
          //
          //       return Text(mensage);
          //     },
          //   ),
          // ),
          _buildTabFilter(),
          _buildAdverts(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/icons/store_logo_preta.png",
            color: CustomColors.mainBlue,
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterCategoriesPage(),
                    ),
                  );
                },
                icon: Image.asset('assets/icons/filter.png', height: 22),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ),
                  );
                },
                icon: Image.asset('assets/icons/bell.png', height: 22),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdPage(),
                    ),
                  );
                },
                icon: Image.asset('assets/icons/plus.png',
                    height: 22, color: CustomColors.black),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildAdBanners() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.lightGrey,
              ),
              child: Image.asset("assets/icons/ad_banner.png", fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          data.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: SizedBox(
              width: 80,
              height: 110,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.lightGrey,
                    ),
                    child: Center(
                      child: Image.asset(
                        data[index]['icon'].toString(),
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data[index]['text'].toString(),
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

  Widget _buildAdverts() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // if (isLoading)
          //   const Center(
          //       child: CircularProgressIndicator(color: CustomColors.mainBlue))
          // else
          ...List.generate(
            10,
            (index) => Column(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdDetailsPage(),
                      ),
                    );
                    // const url =
                    //     "";
                    //
                    // var idAnuncio = anunciosPais[index].id;
                    // var idAnunciante = anunciosPais[index].idAnunciante;
                    //
                    // final body = {
                    //   'id': idAnuncio.toString(),
                    //   'id_usuario': idAnunciante.toString(),
                    //   'token': 'f7DRB00J',
                    // };
                    //
                    // final response = await http.post(
                    //   Uri.parse(url),
                    //   headers: {'Content-Type': 'application/json'},
                    //   body: jsonEncode(body),
                    // );
                    // print("BODY detalhes do anuncio: $body");
                    // if (response.statusCode == 200) {
                    //   final List<dynamic> data = jsonDecode(response.body);
                    //   print("statuscode: ${response.statusCode}");
                    //   print("DATA detalhes do anuncio: $data");
                    //
                    //   if (data.isNotEmpty) {
                    //     final ad = DetailsAdModel.fromJson(data[0]);
                    //
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => AdDetailsPage(ad: ad),
                    //       ),
                    //     );
                    //   } else {
                    //     print("Error: Empty data list");
                    //   }
                    // } else {
                    //   print("status code: ${response.statusCode}");
                    // }
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 15),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: CustomColors.lightGrey,
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 80,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.grey,
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // Image.network(
                                    //   'https:///_uploads/images/redimensionadas/${anunciosPais[index].url}',
                                    //   fit: BoxFit.cover,
                                    // ),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: CustomColors.pureWhite,
                                        child: Image.asset(
                                          'assets/icons/favorite.png',
                                          height: 10
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Nome do anúncio",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.syne(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: CustomColors.black,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                "Categoria",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: GoogleFonts.syne(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color:
                                                      CustomColors.greySubtitle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: CustomColors.greyStar,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "4.5",
                                            style: GoogleFonts.syne(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "R\$0,00",
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabFilter() {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildButton(0, "Mais Próximos", "assets/icons/pin.png"),
          const SizedBox(width: 10),
          _buildButton(1, "Por Estado", "assets/icons/explore.png"),
          const SizedBox(width: 10),
          _buildButton(2, "Em todo Brasil", "assets/icons/caminhao_de_entrega.png"),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String buttonText, String iconAsset) {
    bool isActive = index == _activeButtonIndex;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          _activeButtonIndex = isActive ? -1 : index;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isActive ? CustomColors.mainBlueLight : Colors.transparent,
        foregroundColor: isActive ? CustomColors.mainBlue : CustomColors.grey,
        side: BorderSide(
          color: isActive ? CustomColors.mainBlue : CustomColors.grey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconAsset,
            color: CustomColors.grey,
            height: 18,
          ),
          const SizedBox(width: 4),
          Text(
            buttonText,
            style: TextStyle(
              fontFamily: 'Syne',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isActive ? CustomColors.mainBlue : CustomColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
