part of 'page.dart';

class ChartDetailPage extends StatelessWidget {
  final AthleteEntity athlete;
  final int categoryId;
  // final List<ExerciseEntity> exercise;

  const ChartDetailPage({
    super.key,
    required this.athlete,
    required this.categoryId,
    // required this.exercise,
    // required this.athleteName,
    // required this.athleteId,
  });

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      titleBar: 'Detail: ${athlete.name}',
      body: StreamBuilder<Query<ExerciseEntity>>(
          stream: ExerciseService(store: store).readQueryStream(
            ExerciseEntity_.category
                    .equals(categoryId) //filter by olympiade from button
                &
                ExerciseEntity_.athlete.equals(athlete.id),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.find().isEmpty) {
                return const ErrorMessageWidget();
              }

              return Column(
                children: [
                  SfCartesianChart(
                    primaryXAxis: const CategoryAxis(),
                    series: <LineSeries<ExerciseChartData, String>>[
                      LineSeries<ExerciseChartData, String>(
                        // Bind data source
                        dataSource: snapshot.data!
                            .find()
                            .map((e) => ExerciseChartData(
                                '${e.createdAt.split(" ")[0]} ${e.createdAt.split(" ")[1].split(".")[0].split(":")[0]}:${e.createdAt.split(" ")[1].split(".")[0].split(":")[1]}',
                                e.time))
                            .toList(),
                        xValueMapper: (ExerciseChartData exercise, _) =>
                            exercise.date,
                        yValueMapper: (ExerciseChartData exercise, _) =>
                            exercise.time,
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
                    children: snapshot.data!
                        .find()
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
              );
            }

            return const SizedBox();
          }),
    );
  }
}
