part of 'widget.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? fontColor;
  final double? fontSize;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    this.height,
    this.width,
    required this.text,
    this.backgroundColor,
    this.fontColor,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kBlackColor,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: fontColor ?? kWhiteColor,
            fontSize: fontSize ?? 14,
          ),
        ),
      ),
    );
  }
}
