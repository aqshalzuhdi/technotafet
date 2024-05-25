part of 'page.dart';

class ExercisePage extends StatelessWidget {
  final int olympiadeCategory;
  final List<Map<String, dynamic>> athlete;
  const ExercisePage({
    super.key,
    required this.olympiadeCategory,
    required this.athlete,
  });

  @override
  Widget build(BuildContext context) {
    int groupOrder = 1;
    List<Map<String, dynamic>> exercise = [
      {
        'g1': [
          math.Random().nextDouble(),
          math.Random().nextDouble(),
          math.Random().nextDouble(),
          math.Random().nextDouble(),
        ]
      },
      {
        'g2': [
          math.Random().nextDouble(),
          math.Random().nextDouble(),
          math.Random().nextDouble(),
          math.Random().nextDouble(),
        ]
      }
    ];

    return StatefulBuilder(
      builder: (context, setState) {
        return TemplatePage(
          titleBar: 'Exercise: Group ${groupOrder.toString()}',
          actionBar: [
            IndicatorCircleWidget(status: 1),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you want to save this Exercise?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'Cancel',
                    confirmBtnColor: kGreenColor,
                    onConfirmBtnTap: () {
                      AthleteService athleteService =
                          AthleteService(store: store);

                      int i = 0;
                      for (var data in athlete[groupOrder - 1]
                          ['g${groupOrder.toString()}']) {
                        AthleteEntity? athleteEntity =
                            athleteService.readByName(data);

                        ExerciseService exerciseService =
                            ExerciseService(store: store);
                        ExerciseEntity exerciseEntity = ExerciseEntity(
                          groupType: groupOrder,
                          category: olympiadeCategory,
                          time: exercise[groupOrder - 1]
                              ['g${groupOrder.toString()}'][i],
                          createdAt: DateTime.now().toString(),
                        );
                        i++;

                        if (athleteEntity != null) {
                          exerciseEntity.athlete.targetId = athleteEntity.id;
                        } else {
                          exerciseEntity.athlete.target =
                              AthleteEntity(name: data);
                        }

                        int exerciseId = exerciseService.create(exerciseEntity);
                        log('exercise: ${exerciseId}');
                      }

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Save data successfully',
                            style: whiteTextStyle,
                          ),
                          backgroundColor: kGreenColor,
                        ),
                      );
                    });
              },
              child: Icon(
                Icons.save,
                color: kBlackColor,
              ),
            ),
            const SizedBox(width: 14),
          ],
          body: Column(
            children: [
              Builder(builder: (context) {
                List<Widget> lists = [];
                int i = 0;
                for (var data in athlete[groupOrder - 1]
                    ['g${groupOrder.toString()}']) {
                  i++;
                  lists.add(Column(
                    children: [
                      ExerciseWidget(
                          name: data,
                          time: exercise[groupOrder - 1]
                              ['g${groupOrder.toString()}'][i - 1],
                          order: i),
                      const SizedBox(height: 14),
                    ],
                  ));
                }
                return Column(children: lists);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (groupOrder >= 2)
                      ? ButtonWidget(
                          width: MediaQuery.of(context).size.width / 4,
                          text: 'Prev',
                          onPressed: () {
                            setState(() {
                              groupOrder = 1;
                            });
                          },
                        )
                      : const SizedBox(),
                  (groupOrder <= 1)
                      ? ButtonWidget(
                          width: MediaQuery.of(context).size.width / 4,
                          text: 'Next',
                          onPressed: () {
                            setState(() {
                              groupOrder = 2;
                            });
                          },
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.menu,
            backgroundColor: kBlackColor,
            foregroundColor: kWhiteColor,
            activeIcon: Icons.close,
            spacing: 3,
            childPadding: const EdgeInsets.all(5),
            spaceBetweenChildren: 4,
            // onOpen: () => debugPrint('OPENING DIAL'),
            // onClose: () => debugPrint('DIAL CLOSED'),
            // tooltip: 'Open Speed Dial',
            // heroTag: 'speed-dial-hero-tag',
            elevation: 8.0,
            animationCurve: Curves.elasticInOut,
            isOpenOnStart: false,
            shape: const StadiumBorder(),
            children: [
              SpeedDialChild(
                child: const Icon(Icons.restart_alt_rounded),
                backgroundColor: kBlackColor,
                foregroundColor: kWhiteColor,
                label: 'Reset All',
                onTap: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Reset and Exit this Exercise?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'Cancel',
                    confirmBtnColor: kGreenColor,
                    onConfirmBtnTap: () {
                      Navigator.pop(context);
                      Get.back();
                    },
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.replay_circle_filled_sharp),
                backgroundColor: kBlackColor,
                foregroundColor: kWhiteColor,
                label: 'Time Reset',
                onTap: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you want to reset time to Zero?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'Cancel',
                    confirmBtnColor: kGreenColor,
                    onConfirmBtnTap: () {
                      setState(() {
                        exercise[groupOrder - 1]['g${groupOrder.toString()}']
                            [0] = 0.00;
                        exercise[groupOrder - 1]['g${groupOrder.toString()}']
                            [1] = 0.00;
                        exercise[groupOrder - 1]['g${groupOrder.toString()}']
                            [2] = 0.00;
                        exercise[groupOrder - 1]['g${groupOrder.toString()}']
                            [3] = 0.00;
                      });

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Time successfully resetted!',
                            style: whiteTextStyle,
                          ),
                          backgroundColor: kGreenColor,
                        ),
                      );
                    },
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.bar_chart_outlined),
                backgroundColor: kBlackColor,
                foregroundColor: kWhiteColor,
                label: 'Chart',
                onTap: () {
                  Get.to(ChartPage(
                    athlete: athlete,
                    exercise: exercise,
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
