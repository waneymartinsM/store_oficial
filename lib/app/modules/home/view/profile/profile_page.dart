import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/profile/my_payments_page.dart';
import 'package:store_oficial/app/modules/home/view/profile/my_profile_details.dart';
import 'package:store_oficial/app/modules/home/view/profile/profile_menu_widget.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: CustomColors.lightGrey,
                backgroundImage: AssetImage("assets/icons/avatar.png"),
              ),
              const SizedBox(height: 10),
              Text('Waney Martins',
                  style: GoogleFonts.syne(
                      fontSize: 16, color: CustomColors.black)),
              Text('waneymartins@gmail.com',
                  style: GoogleFonts.syne(
                      fontSize: 14, color: CustomColors.greySubtitle)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomAnimatedButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfileDetails()));
                  },
                  widhtMultiply: 1,
                  height: 40,
                  colorText: Colors.white,
                  color: CustomColors.mainGolden,
                  text: "MEU PERFIL",
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Meu Plano',
                  icon: Image.asset('assets/icons/meu_plano.png', height: 25),
                  onPress: () {},
                  endIcon: true),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Planos',
                  icon: Image.asset('assets/icons/pesquisar.png', height: 25),
                  onPress: () {},
                  endIcon: true),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Meus Pagamentos',
                  icon: Image.asset('assets/icons/dinheiro.png', height: 25),
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const MyPaymentsPage()));
                  },
                  endIcon: true),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Desativar conta',
                  icon: Image.asset('assets/icons/desativar.png', height: 25),
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                              child: Text(
                            'DESATIVAR CONTA',
                            style: GoogleFonts.syne(),
                          )),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: Column(
                              children: [
                                Text(
                                  'Deseja excluir sua conta permanentemente?',
                                  style: GoogleFonts.syne(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: CustomColors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                CustomAnimatedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  widhtMultiply: 1,
                                  height: 35,
                                  colorText: Colors.white,
                                  color: CustomColors.mainBlue,
                                  text: "EXCLUIR",
                                ),
                                const SizedBox(height: 10),
                                CustomAnimatedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  widhtMultiply: 1,
                                  height: 35,
                                  colorText: Colors.black,
                                  color: CustomColors.pureWhite,
                                  text: "CANCELAR",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  endIcon: true),
              const SizedBox(height: 10),
              const Divider(),
              ProfileMenuWidget(
                  title: 'Suporte',
                  icon: Image.asset('assets/icons/apoio_suporte.png', height: 25),
                  onPress: () {},
                  endIcon: false),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Sair',
                  icon: Image.asset('assets/icons/sair.png', height: 25),
                  onPress: () {},
                  endIcon: false),
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
