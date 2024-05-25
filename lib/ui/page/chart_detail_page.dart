part of 'page.dart';

class ChartDetailPage extends StatelessWidget {
  // final int athleteId;
  // final int categoryId;
  final List<ExerciseEntity> exercise;
  final AthleteEntity athlete;

  const ChartDetailPage({
    super.key,
    required this.exercise,
    required this.athlete,
    // required this.athleteId,
    // required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      titleBar: 'Detail: ${athlete.name}',
      body: Column(
        children: [
          // Text(
          //   'Group 1',
          //   style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
          // ),
          // const SizedBox(height: 12),
          SfCartesianChart(
            // Initialize category axis
            primaryXAxis: const CategoryAxis(),
            series: <LineSeries<ExerciseChartData, String>>[
              LineSeries<ExerciseChartData, String>(
                // Bind data source
                dataSource: exercise
                    .map((e) => ExerciseChartData(
                        '${e.createdAt.split(" ")[0]} ${e.createdAt.split(" ")[1].split(".")[0].split(":")[0]}:${e.createdAt.split(" ")[1].split(".")[0].split(":")[1]}',
                        e.time))
                    .toList(),
                // dataSource: <ExerciseChartData>[
                //   ExerciseChartData('Jan', 35),
                //   ExerciseChartData('Feb', 28),
                //   ExerciseChartData('Mar', 34),
                //   ExerciseChartData('Apr', 32),
                //   ExerciseChartData('May', 40)
                // ],
                xValueMapper: (ExerciseChartData exercise, _) => exercise.date,
                yValueMapper: (ExerciseChartData exercise, _) => exercise.time,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Data',
              style: blackTextStyle.copyWith(fontWeight: semiBold),
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: exercise
                .map(
                  (e) => Column(
                    children: [
                      ExerciseWidget(
                        // name: athlete.name,
                        time: e.time,
                        createdAt: e.createdAt.split(".")[0],
                        // order: 1,
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
