part of 'page.dart';

class ChartPage extends StatelessWidget {
  final List<Map<String, dynamic>> athlete;
  final List<Map<String, dynamic>> exercise;
  const ChartPage({
    super.key,
    required this.athlete,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    int groupOrder = 1;

    return StatefulBuilder(builder: (context, setState) {
      return TemplatePage(
        titleBar: 'Exercise Chart: Group ${groupOrder.toString()}',
        body: Builder(builder: (context) {
          List<Widget> lists = [];
          int i = 0;
          for (var data in athlete[groupOrder - 1]
              ['g${groupOrder.toString()}']) {
            i++;
            lists.add(Column(
              children: [
                Text(
                  'Athlete ${i}: ${data}',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 14),
                SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  series: <LineSeries<ExerciseChartData, String>>[
                    LineSeries<ExerciseChartData, String>(
                      // Bind data source
                      // dataSource: exercise
                      //     .map((e) => ExerciseChartData(
                      //         '${e.createdAt.split(" ")[0]} ${e.createdAt.split(" ")[1].split(".")[0].split(":")[0]}:${e.createdAt.split(" ")[1].split(".")[0].split(":")[1]}',
                      //         e.time))
                      //     .toList(),
                      dataSource: <ExerciseChartData>[
                        ExerciseChartData('Jan', 35),
                        ExerciseChartData('Feb', 28),
                        ExerciseChartData('Mar', 34),
                        ExerciseChartData('Apr', 32),
                        ExerciseChartData('May', 40)
                      ],
                      xValueMapper: (ExerciseChartData exercise, _) =>
                          exercise.date,
                      yValueMapper: (ExerciseChartData exercise, _) =>
                          exercise.time,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],
            ));
          }
          return Column(children: lists);
        }),
        floatingActionButtonLocation: (groupOrder <= 1)
            ? FloatingActionButtonLocation.endFloat
            : FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (groupOrder <= 1) {
                groupOrder = 2;
              } else {
                groupOrder = 1;
              }
            });
          },
          mini: true,
          backgroundColor: kBlackColor,
          child: Icon(
            (groupOrder <= 1)
                ? Icons.navigate_next_outlined
                : Icons.navigate_before_outlined,
            color: kWhiteColor,
          ),
        ),
      );
    });
  }
}
