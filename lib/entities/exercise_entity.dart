part of 'entity.dart';

@Entity()
class ExerciseEntity {
  int id;
  final int groupType; // 1 - 2
  final int category; // Olimpiade:{1 = 4x100, 2 = 4x200} | Non-Olim:{3 = 4x100}
  final double time;
  final String createdAt;

  // @Backlink('exercises')
  final athlete = ToOne<AthleteEntity>();

  ExerciseEntity({
    this.id = 0,
    required this.groupType,
    required this.category,
    required this.time,
    required this.createdAt,
  });
}
