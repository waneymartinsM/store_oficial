import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/profile/my_profile_details.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';
import 'package:store_oficial/app/widgets/custom_list.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';
import 'package:store_oficial/app/widgets/custom_text_field_password.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  List<int> selectedItems = [];

  bool viewPass = true;
  bool viewConfirmPass = true;

  void _boolViewPass() => setState(() => viewPass = !viewPass);
  void _boolViewConfirmPass() =>
      setState(() => viewConfirmPass = !viewConfirmPass);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            icon: Image.asset(
              "assets/icons/arrow.png",
              height: 18,
            ),
          ),
          title: Text(
            "EDITAR PERFIL",
            style: GoogleFonts.syne(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: CustomColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightGrey,
                ),
                child: TabBar(
                  labelColor: CustomColors.mainBlue,
                  unselectedLabelColor: CustomColors.grey,
                  indicatorColor: CustomColors.mainBlue,
                  labelStyle: GoogleFonts.syne(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: GoogleFonts.syne(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(text: 'Dados'),
                    Tab(text: 'Interesses'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: CustomColors.lightGrey,
                                child: Center(
                                  child: Image.asset(
                                    "assets/icons/avatar.png",
                                    height: 35,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: CustomColors.greyStar),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/icons/camera.png"),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            readOnly: true,
                            icon: Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.grey[700],
                            ),
                            hintText: 'waneymartins2003@hotmail.com',
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: 'Waney Rafaele Santos Martins',
                            icon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.grey[700],
                            ),
                            textInputType: TextInputType.text,
                            //controller: _name,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: '(38) 9 8819-0693',
                            icon: Icon(
                              Icons.phone,
                              color: Colors.grey[700],
                            ),
                            textInputType: TextInputType.phone,
                            //controller: _phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: '126.656.416-07',
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey[700],
                            ),
                            textInputType: TextInputType.number,
                            //controller: _cpf,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                          ),
                          const SizedBox(height: 35),
                          CustomAnimatedButton(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text('ALTERAR SENHA')),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          CustomTextFieldPassword(
                                            hintText: 'Nova senha',
                                            icon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: Colors.grey[700],
                                            ),
                                            onTapPassword: () {
                                              _boolViewPass();
                                            },
                                            visualizar: viewPass,
                                            password: true,
                                            obscureText: viewPass,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            controller: _pass,
                                          ),
                                          const SizedBox(height: 15),
                                          CustomTextFieldPassword(
                                            hintText: 'Confirmar senha',
                                            icon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: Colors.grey[700],
                                            ),
                                            onTapPassword: () {
                                              _boolViewConfirmPass();
                                            },
                                            visualizar: viewConfirmPass,
                                            password: true,
                                            obscureText: viewConfirmPass,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            controller: _confirmPass,
                                          ),
                                          const SizedBox(height: 20),
                                          CustomAnimatedButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            widhtMultiply: 1,
                                            height: 45,
                                            colorText: Colors.white,
                                            color: CustomColors.mainBlue,
                                            text: "SALVAR",
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            widhtMultiply: 1,
                            height: 45,
                            colorText: Colors.black,
                            color: Colors.grey.withOpacity(0.1),
                            text: "ALTERAR SENHA",
                          ),
                          const SizedBox(height: 20),
                          CustomAnimatedButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            widhtMultiply: 1,
                            height: 45,
                            colorText: Colors.white,
                            color: CustomColors.mainBlue,
                            text: "SALVAR",
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Pesquisar por categorias...',
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey[700],
                          ),
                          textInputType: TextInputType.text,
                          //controller: _search,
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        height: 65,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                    : CustomColors.black,
                                              ),
                                              const SizedBox(width: 15),
                                              Flexible(
                                                child: Text(
                                                  item['text'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                          ),
                        ),
                        CustomAnimatedButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyProfileDetails()),
                            );
                          },
                          widhtMultiply: 1,
                          height: 45,
                          colorText: Colors.white,
                          color: CustomColors.mainBlue,
                          text: "SALVAR",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
