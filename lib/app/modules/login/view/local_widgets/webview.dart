import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:webviewx/webviewx.dart';

class CustomWebView extends StatelessWidget {
  final String title;
  final String url;
  const CustomWebView({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBlue,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: CustomColors.mainBlue,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.syne(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            //Modular.to.pop();
            Navigator.pop(context);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade700,
          ),
        ),
      ),
      body: WebViewX(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        initialContent: url,
        javascriptMode: JavascriptMode.unrestricted,
        initialSourceType: SourceType.url,
        mobileSpecificParams: const MobileSpecificParams(
          androidEnableHybridComposition: true,
          gestureNavigationEnabled: true,
          debuggingEnabled: true,
        ),
      ),
    );
  }
}
