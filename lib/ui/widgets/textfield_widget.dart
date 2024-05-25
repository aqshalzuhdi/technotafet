part of 'widget.dart';

class TextfieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController? textEditingController;
  const TextfieldWidget({
    super.key,
    required this.title,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kBlackColor,
              ),
            ),
          ),
          controller: textEditingController,
        ),
      ],
    );
  }
}
