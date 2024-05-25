part of 'widget.dart';

class IndicatorCircleWidget extends StatelessWidget {
  final int status; // 0 = disconnected, 1 = connected, 2 = initial
  const IndicatorCircleWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: (status == 0)
            ? kRedColor
            : ((status == 2) ? kGreyColor : kGreenColor),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
