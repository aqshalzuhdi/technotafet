part of 'widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 4),
        Icon(
          Icons.file_open_rounded,
          color: kBlackColor,
          size: 100,
        ),
        const SizedBox(height: 8),
        Text(
          'Data not available',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Start Exercise now!',
          style: blackTextStyle,
        ),
      ],
    );
  }
}
