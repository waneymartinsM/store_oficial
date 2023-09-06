import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final double height;
  final double widhtMultiply;
  final String text;
  final Icon? icon;
  final bool? iconBool;
  final bool outlined;
  final Color? color;
  final Color? borderColor;
  final Color? colorText;
  final Function? onTap;
  final double fontSize;

  const CustomOutlinedButton({
    Key? key,
    required this.widhtMultiply,
    this.height = 60,
    this.text = "",
    this.outlined = false,
    this.icon,
    this.color,
    this.borderColor,
    this.colorText = Colors.pinkAccent,
    this.onTap,
    this.iconBool,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  _CustomOutlinedButtonState createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Center(
      child: InkWell(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: () {
          widget.onTap!();
        },
        child: Transform.scale(
          scale: _scale,
          child: _animatedButtonUI,
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => OutlinedButton(
    onPressed: () {
      widget.onTap!();
    },
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      side: BorderSide(
        color: widget.borderColor ?? Colors.transparent,
        width: 2,
      ),
    ),
    child: Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width * widget.widhtMultiply,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.text.isNotEmpty)
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.colorText,
                  fontSize: 16,
                ),
              ),
            if (widget.icon != null) widget.icon!,
          ],
        ),
      ),
    ),
  );
}
