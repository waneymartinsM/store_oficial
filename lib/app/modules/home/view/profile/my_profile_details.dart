import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/profile/edit_profile_page.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class MyProfileDetails extends StatefulWidget {
  const MyProfileDetails({Key? key}) : super(key: key);

  @override
  State<MyProfileDetails> createState() => _MyProfileDetailsState();
}

class _MyProfileDetailsState extends State<MyProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: CustomColors.lightGrey,
                    child: Center(
                      child: Image.asset("assets/icons/avatar.png", height: 50),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Waney Rafaele Santos Martins',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.syne(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: CustomColors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '8',
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: CustomColors.black,
                                  ),
                                ),
                                Text(
                                  'Seguidores',
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  '80',
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: CustomColors.black,
                                  ),
                                ),
                                Text(
                                  'Seguindo',
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Spacer(),
                CustomAnimatedButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                  widhtMultiply: 0.6,
                  height: 35,
                  colorText: Colors.white,
                  color: CustomColors.mainGolden,
                  text: "Editar perfil",
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 20),
            TabBar(
              labelColor: CustomColors.mainBlue,
              unselectedLabelColor: CustomColors.grey,
              labelStyle:
                  GoogleFonts.syne(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  GoogleFonts.syne(fontSize: 14, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Seguidores'),
                Tab(text: 'Seguindo'),
                Tab(text: 'Sobre'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                radius: 25,
                                backgroundColor: CustomColors.mainBlue),
                            const SizedBox(width: 10),
                            Text('Waney Martins', style: GoogleFonts.syne()),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.mainBlue,
                                ),
                                width: 100,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                radius: 25,
                                backgroundColor: CustomColors.mainBlue),
                            const SizedBox(width: 10),
                            Text(
                              'Waney Martins',
                              style: GoogleFonts.syne(),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.lightGrey,
                                ),
                                width: 100,
                                height: 35,
                                child: Center(
                                  child: Text(
                                    'Seguindo',
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
                      ),
                    ],
                  ),
                  Container(color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
