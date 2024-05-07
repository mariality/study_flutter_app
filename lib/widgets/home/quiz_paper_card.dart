
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:quizzle/configs/configs.dart';
//import 'package:quizzle/controllers/controllers.dart';
//import 'package:quizzed/controllers/quiz_paper/quiz_papers_controller.dart';
//import 'package:quizzle/models/quiz_paper_model.dart';
//import 'package:quizzle/screens/screens.dart';
//import 'package:quizzle/widgets/widgets.dart';

import '../../configs/themes/app_icons_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/quiz_paper/quiz_papers_controller.dart';
import '../../models/quiz_paper_model.dart';
import '../../screens/leader_board/laaderboard_screen.dart';
//import '../../screens/leaderboard/laaderboard_screen.dart';
import '../common/icon_with_text.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(
              paper: model
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //showing the image
                    ClipRRect(
                      borderRadius: UIParameters.cardBorderRadius,
                      child: ColoredBox(
                          color:
                          Theme.of(context).primaryColor.withOpacity(0.2),
                          child: SizedBox(
                            width: 65,
                            height: 65,
                            child: model.imageUrl == null ||  model.imageUrl!.isEmpty ? null :
                            Image.network(model.imageUrl!),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    //question and other things
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //title of the paper
                            Text(
                              model.title,
                              style: cardTitleTs(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(model.description),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: EasySeparatedRow(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(width: 15);
                                },
                                children: [
                                  IconWithText(
                                      icon:  Icon(Icons.help_outline_sharp,
                                          color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                                      text: Text(
                                        '${model.questionsCount} quizzes',
                                        style: kDetailsTS.copyWith(
                                            color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                                      )),
                                  IconWithText(
                                      icon:  Icon(Icons.timer,
                                          color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                                      text: Text(
                                        model.timeInMinits(),
                                        style: kDetailsTS.copyWith(
                                            color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                //showing the trophy
                Positioned(
                    bottom: -_padding,
                    right: -_padding,
                    child: GestureDetector(
                      behavior : HitTestBehavior.translucent,
                      onTap: () {
                        // Get.find<NotificationService>().showQuizCompletedNotification(id: 1, title: 'Sampole', body: 'Sample', imageUrl: model.imageUrl, payload: json.encode(model.toJson())  );
                        Get.toNamed(LeaderBoardScreen.routeName, arguments:model );
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: const Icon(AppIcons.trophyoutline),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(kCardBorderrRadius),
                                bottomRight:
                                Radius.circular(kCardBorderrRadius)),
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}