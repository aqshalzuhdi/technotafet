part of 'widget.dart';

class ExerciseWidget extends StatelessWidget {
  final String? name;
  final double time;
  final int? order;
  final String? createdAt;

  const ExerciseWidget({
    super.key,
    this.name,
    required this.time,
    this.order,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: kBlackColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name != null
                  ? Column(
                      children: [
                        Text(
                          name!,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    )
                  : const SizedBox(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.timer_outlined),
                  const SizedBox(width: 8),
                  Text(
                    time.toString(),
                    style: blackTextStyle,
                  ),
                ],
              ),
              (createdAt != null)
                  ? Column(
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.date_range_outlined),
                            const SizedBox(width: 8),
                            Text(
                              createdAt.toString(),
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
          (order != null)
              ? Text(
                  'Athlete ${order.toString()}',
                  style: blackTextStyle,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
