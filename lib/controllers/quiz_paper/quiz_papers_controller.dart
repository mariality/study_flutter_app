import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../models/quiz_paper_model.dart';
import '../../screens/quiz/quiz_screen.dart';
import '../../services/firebase/firebasestorage_service.dart';
import '../../utils/logger.dart';
import '../auth_controller.dart';
import 'package:study_flutter_app/models/models.dart';

class QuizPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPapers = <QuestionPaperModel>[].obs;
  final allPaperImages = <String>[].obs;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await quizePaperFR.get();
      final paperList =
      data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imageUrl =
        await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imageUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigatoQuestions({required QuestionPaperModel paper, bool isTryAgain = false}) {
    AuthController _authController = Get.find();

    if (_authController.isLogedIn()) {
      if (isTryAgain) {
        Get.back();
        Get.offNamed(QuizeScreen.routeName, arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuizeScreen.routeName, arguments: paper);
      }
    } else {
      _authController.showLoginAlertDialog();
    }
  }
}
