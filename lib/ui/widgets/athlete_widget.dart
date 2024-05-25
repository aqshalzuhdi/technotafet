part of 'widget.dart';

class AthleteWidget extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const AthleteWidget({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlackColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Show chart...',
                  style: blackTextStyle.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
