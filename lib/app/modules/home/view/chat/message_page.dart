import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/view/chat/message.dart';
import 'package:store_oficial/app/widgets/custom_text_field.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: CustomColors.lightGrey,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset("assets/icons/arrow.png", height: 18),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomColors.grey,
                  ),
                ),
                const SizedBox(width: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Waney Martins',
                      style: GoogleFonts.syne(
                        fontSize: 16,
                        color: CustomColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Online',
                      style: GoogleFonts.syne(
                        fontSize: 11,
                        color: CustomColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: CustomColors.mainBlue,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/video.png",
                      height: 15,
                      color: CustomColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: CustomColors.mainBlue,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/telefone.png",
                      height: 18,
                      color: CustomColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => Message(
                      message: demeChatMessages[index],
                    )),
          ),
        ),
        _buildInputField(),
      ],
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: CustomColors.lightGrey,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    InkWell(
                      child: Image.asset(
                        "assets/icons/camera.png",
                        height: 20,
                        color: CustomColors.grey,
                      ),
                    ),
                    const Expanded(
                      child: CustomTextField(
                        hintText: 'Mensagem...',
                        textInputType: TextInputType.text,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        "assets/icons/microfone.png",
                        height: 20,
                        color: CustomColors.grey,
                      ),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      child: Image.asset(
                        "assets/icons/clipe.png",
                        height: 20,
                        color: CustomColors.grey,
                      ),
                    ),
                    // SizedBox(width: 17),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: CustomColors.mainBlue,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/enviar.png",
                      height: 18,
                      color: CustomColors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key, required this.message, this.messageStatus})
      : super(key: key);

  final ChatMessage message;
  final MessageStatus? messageStatus;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return _buildTextMessage();
        case ChatMessageType.audio:
          return _buildAudioMessage(context);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          messageContaint(message),
          if (message.isSender)
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 12,
              width: 12,
              decoration: const BoxDecoration(
                  color: CustomColors.mainGolden, shape: BoxShape.circle),
              child: Icon(
                messageStatus == MessageStatus.not_sent
                    ? Icons.close
                    : Icons.done,
                size: 8,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color:
              message.isSender ? CustomColors.mainBlue : CustomColors.lightGrey,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        message.text,
        style: GoogleFonts.syne(
            color: message.isSender ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildAudioMessage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            message.isSender ? CustomColors.mainBlue : CustomColors.lightGrey,
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color:
                message.isSender ? CustomColors.white : CustomColors.mainBlue,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xFF044C6C).withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF044C6C).withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '0.45',
            style: TextStyle(
              fontSize: 12,
              color: message.isSender ? CustomColors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
