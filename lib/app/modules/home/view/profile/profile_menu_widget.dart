import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    this.textColor,
  });

  final String title;
  final Widget icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(child: icon),
      title: Text(title, style: GoogleFonts.syne(color: textColor)),
      trailing: endIcon
          ? IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/proximo.png", height: 18),
            )
          : null,
    );
  }
}
