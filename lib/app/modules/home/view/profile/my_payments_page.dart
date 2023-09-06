import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';

class MyPaymentsPage extends StatefulWidget {
  const MyPaymentsPage({Key? key}) : super(key: key);

  @override
  _MyPaymentsPageState createState() => _MyPaymentsPageState();
}

class _MyPaymentsPageState extends State<MyPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: Text(
          "MEUS PAGAMENTOS",
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: CustomColors.black,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: CustomColors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: List.generate(
              10,
                  (index) => InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
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
                                              'Título do anúncio',
                                              overflow:
                                              TextOverflow.ellipsis,
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
                                              'Categoria',
                                              overflow:
                                              TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.syne(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: CustomColors
                                                    .greySubtitle,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '18/05/2023 - 09:38 AM',
                                              overflow:
                                              TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.syne(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11,
                                                color: CustomColors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Status: ',
                                          style: GoogleFonts.syne(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: CustomColors.black,
                                          ),
                                        ),
                                        Text(
                                          'Ativo',
                                          style: GoogleFonts.syne(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: CustomColors.mainGolden,
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
                                'R\$75.00',
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
            ),
          ),
        ),
      ),
    );
  }
}
