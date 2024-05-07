import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:quizzle/configs/configs.dart';
//import 'package:quizzle/controllers/controllers.dart';
//import 'package:quizzle/widgets/widgets.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/quiz_paper/quiz_controller.dart';
import '../../widgets/common/content_area.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/main.button.dart';
import '../../widgets/common/screen_background_decoration.dart';
import '../../widgets/quiz/answer_card.dart';
import '../../widgets/quiz/countdown_timer.dart';
import '../../widgets/quiz/quize_number_card.dart';

class QuizOverviewScreen extends GetView<QuizController> {
  const QuizOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = '/quizeoverview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  CustomAppBar(
        title: controller.completedQuiz,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CountdownTimer(
                            color: UIParameters.isDarkMode()
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor, time: '',
                          ),
                          Obx(
                                () => Text(
                              '${controller.time} Remining',
                              style: countDownTimerTs(context),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                          child: GridView.builder(
                              itemCount: controller.allQuestions.length,
                              shrinkWrap: true,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                  UIParameters.getWidth(context) ~/ 75,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (_, index) {
                                AnswerStatus? _answerStatus;
                                if(controller.allQuestions[index].selectedAnswer != null){
                                  _answerStatus = AnswerStatus.answered;
                                }
                                return QuizNumberCard(
                                  index: index+1, status: _answerStatus, onTap: () {
                                  controller.jumpToQuestion(index);
                                },
                                );
                              }))
                    ],
                  )),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.screenPadding,
                child: MainButton(
                  onTap: () {
                    controller.complete();
                  },
                  title: 'Complete',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
