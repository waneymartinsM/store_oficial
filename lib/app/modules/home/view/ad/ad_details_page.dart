import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/ad/advertiser_profile_page.dart';
import 'package:store_oficial/app/modules/home/view/ad/local_widget/star_rating_row.dart';

class AdDetailsPage extends StatefulWidget {
  const AdDetailsPage({
    Key? key,
    //required this.ad,
  }) : super(key: key);

  //final DetailsAdModel ad;

  @override
  _AdDetailsPageState createState() => _AdDetailsPageState();
}

class _AdDetailsPageState extends State<AdDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //itemCount: widget.ad.fotos?.length ?? 0,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: CustomColors.lightGrey),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/icons/arrow.png", height: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                  // List<Fotos>? fotos = widget.ad.fotos;
                  // if (fotos != null && index < fotos.length) {
                  //   String url =
                  //       '';
                  //   return Padding(
                  //     padding: const EdgeInsets.only(right: 10),
                  //     child: Container(
                  //       height: 400,
                  //       width: MediaQuery.of(context).size.width,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40),
                  //         image: DecorationImage(
                  //           image: NetworkImage(url),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //       child: IconButton(
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         },
                  //         icon: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 40, horizontal: 10),
                  //           child: Align(
                  //             alignment: Alignment.topLeft,
                  //             child: Image.asset(
                  //               "assets/icons/arrow.png",
                  //               height: 18,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }
                  // return SizedBox();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          //widget.ad.nome ?? "Nome do anúncio",
                          "Nome do anúncio",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.syne(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: CustomColors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: CustomColors.mainBlue,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/favorite.png",
                              color: CustomColors.white,
                              height: 18,
                            )),
                      ),
                    ],
                  ),
                  Text(
                    "Categoria",
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Pubicado em 31/08/2023",
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.greySubtitle,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'R\$0,00',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: CustomColors.greyStar, size: 20),
                      Text(
                        "0",
                        style: GoogleFonts.syne(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: CustomColors.black,
                        ),
                      ),
                      Text(
                        ' ( Avaliações )',
                        style: GoogleFonts.syne(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: CustomColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/gostar.png',
                        height: 18,
                        color: CustomColors.grey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "5",
                        style: GoogleFonts.syne(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: CustomColors.greySubtitle,
                        ),
                      ),
                      Text(
                        ' usuário(s) sugeriu este produto.',
                        style: GoogleFonts.syne(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: CustomColors.greySubtitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Descrição',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Descrição do anúncio",
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: CustomColors.greySubtitle,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Avaliações',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.lightGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "4.5",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.syne(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            color: CustomColors.black),
                                      ),
                                    ),
                                    Text(
                                      "/",
                                      style: GoogleFonts.syne(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: CustomColors.black),
                                    ),
                                    Text(
                                      "5",
                                      style: GoogleFonts.syne(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: CustomColors.greySubtitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    "Baseado em 120 avaliações",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.syne(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: CustomColors.greySubtitle),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                _buildStar(size: 20),
                              ],
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StarRatingRow(
                                  labelText: '5 estrelas',
                                  progressValue: 1,
                                  width: 9),
                              StarRatingRow(
                                  labelText: '4 estrelas',
                                  progressValue: 0.75,
                                  width: 9),
                              StarRatingRow(
                                  labelText: '3 estrelas',
                                  progressValue: 0.50,
                                  width: 9),
                              StarRatingRow(
                                  labelText: '2 estrelas',
                                  progressValue: 0.25,
                                  width: 9),
                              StarRatingRow(
                                  labelText: '1 estrela ',
                                  progressValue: 0.1,
                                  width: 14),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(color: CustomColors.divider),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: CustomColors.mainBlue,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/plus.png",
                              color: CustomColors.white,
                              height: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          child: Text(
                            "Adicionar avaliação",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.syne(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: CustomColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: CustomColors.divider),
                  const SizedBox(height: 15),
                  _buildRating(),
                  const SizedBox(height: 15),
                  _buildRating(),
                  const SizedBox(height: 15),
                  const Divider(color: CustomColors.divider),
                  const SizedBox(height: 15),
                  Text(
                    'Anunciante',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AdvertiserProfilePage()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Container(
                              height: 60,
                              width: 60,
                              color: CustomColors.lightGrey),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Nome do anunciante",
                                style: GoogleFonts.syne(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: CustomColors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: CustomColors.mainBlue,
                                    ),
                                    width: 80,
                                    height: 35,
                                    child: Center(
                                      child: Text(
                                        'Seguir',
                                        style: GoogleFonts.syne(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: CustomColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: CustomColors.lightGrey,
                                    ),
                                    width: 100,
                                    height: 35,
                                    child: Center(
                                      child: Text(
                                        'Mensagem',
                                        style: GoogleFonts.syne(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: CustomColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Usuário também anunciou',
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 200,
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              child: Image.asset('assets/icons/favorite.png',
                                  height: 10)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStar({required double size}) {
    return Row(
      children: [
        Icon(Icons.star_rounded, color: CustomColors.mainBlue, size: size),
        Icon(Icons.star_rounded, color: CustomColors.mainBlue, size: size),
        Icon(Icons.star_rounded, color: CustomColors.mainBlue, size: size),
        Icon(Icons.star_rounded, color: CustomColors.mainBlue, size: size),
        Icon(Icons.star_rounded, color: CustomColors.greyStar, size: size),
      ],
    );
  }

  Widget _buildRating() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                    radius: 15, backgroundColor: CustomColors.grey),
                Flexible(
                  child: Text(
                    "Waney Martins",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.syne(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: CustomColors.black,
                    ),
                  ),
                ),
                Text(
                  "Há 2 dias",
                  style: GoogleFonts.syne(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: CustomColors.greySubtitle,
                  ),
                ),
                _buildStar(size: 15),
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
              style: GoogleFonts.syne(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: CustomColors.greySubtitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
