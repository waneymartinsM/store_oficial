import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/chat/message_page.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class WebeChatPage extends StatelessWidget {
  const WebeChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            const CustomTextField(
              hintText: 'Pesquisar...',
              icon: Icon(Icons.search, color: CustomColors.grey),
              textInputType: TextInputType.text,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessagePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: CustomColors.grey,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Waney Martins',
                                    style: GoogleFonts.syne(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.black,
                                    ),
                                  ),
                                  Text(
                                    'Mensagem da pessoa...',
                                    style: GoogleFonts.syne(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.greySubtitle,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '09:00 AM',
                            style: GoogleFonts.syne(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: CustomColors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
