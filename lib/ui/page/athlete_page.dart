part of 'page.dart';

class AthletePage extends StatelessWidget {
  final int? order;
  final int olympiadeCategory;

  const AthletePage({
    super.key,
    this.order,
    required this.olympiadeCategory,
  });

  @override
  Widget build(BuildContext context) {
    int groupOrder = order ?? 1;

    final TextEditingController textEditingController1 =
        TextEditingController();
    final TextEditingController textEditingController2 =
        TextEditingController();
    final TextEditingController textEditingController3 =
        TextEditingController();
    final TextEditingController textEditingController4 =
        TextEditingController();

    List<Map<String, dynamic>> athlete = [];

    void clearTextEditingController() {
      textEditingController1.text = '';
      textEditingController2.text = '';
      textEditingController3.text = '';
      textEditingController4.text = '';
    }

    bool textEditingEmpty() {
      return (textEditingController1.text.isEmpty ||
              textEditingController2.text.isEmpty ||
              textEditingController3.text.isEmpty ||
              textEditingController4.text.isEmpty)
          ? true
          : false;
    }

    return TemplatePage(
      bodyCenter: true,
      body: StatefulBuilder(builder: (context, setState) {
        return Column(
          children: [
            Text(
              'Group ${groupOrder.toString()}',
              style: blackTextStyle.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              olympiadeCategories[olympiadeCategory - 1],
              style: blackTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(color: kBlackColor),
                // borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextfieldWidget(
                    title: 'Athlete 1',
                    textEditingController: textEditingController1,
                  ),
                  const SizedBox(height: 14),
                  TextfieldWidget(
                    title: 'Athlete 2',
                    textEditingController: textEditingController2,
                  ),
                  const SizedBox(height: 14),
                  TextfieldWidget(
                    title: 'Athlete 3',
                    textEditingController: textEditingController3,
                  ),
                  const SizedBox(height: 14),
                  TextfieldWidget(
                    title: 'Athlete 4',
                    textEditingController: textEditingController4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  width: MediaQuery.of(context).size.width / 4,
                  text: (groupOrder >= 2) ? 'Prev' : 'Back',
                  onPressed: () {
                    if (groupOrder <= 1) {
                      Get.back();
                    }
                    if (groupOrder >= 2) {
                      setState(() {
                        groupOrder = 1;
                      });
                    }
                  },
                ),
                ButtonWidget(
                  width: MediaQuery.of(context).size.width / 4,
                  text: 'Next',
                  onPressed: () {
                    setState(() {
                      // clearTextEditingController();
                      if (groupOrder <= 1) {
                        if (textEditingEmpty()) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'Athlete input is required',
                          );
                        } else {
                          athlete.add({
                            'g1': [
                              textEditingController1.text,
                              textEditingController2.text,
                              textEditingController3.text,
                              textEditingController4.text,
                            ]
                          });
                          groupOrder = 2;

                          clearTextEditingController();
                        }
                      } else if (groupOrder >= 2) {
                        if (textEditingEmpty()) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'Athlete input is required',
                          );
                        } else {
                          athlete.add({
                            'g2': [
                              textEditingController1.text,
                              textEditingController2.text,
                              textEditingController3.text,
                              textEditingController4.text,
                            ]
                          });
                          groupOrder = 3;

                          clearTextEditingController();
                        }
                      }

                      if (groupOrder >= 3) {
                        groupOrder = 1;
                        Get.to(ExercisePage(
                          olympiadeCategory: olympiadeCategory,
                          athlete: athlete,
                        ));
                      }
                    });
                  },
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
