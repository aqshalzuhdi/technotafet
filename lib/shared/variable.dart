part of 'shared.dart';

List<String> olympiadeCategories = [
  'Olimpiade: 4x100m',
  'Olimpiade: 4x200m',
  'Non-Olimpiade: 4x100m',
];

class ExerciseChartData {
  ExerciseChartData(this.date, this.time);
  final String date;
  final double time;
}
