part of 'entity.dart';

@Entity()
class AthleteEntity {
  int id;
  final String name;

  @Backlink('athlete')
  final exercises = ToMany<ExerciseEntity>();

  AthleteEntity({
    this.id = 0,
    required this.name,
  });
}
