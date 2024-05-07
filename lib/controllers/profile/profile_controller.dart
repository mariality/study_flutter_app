import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
//import 'package:quizzle/controllers/controllers.dart';
//import 'package:quizzle/firebase/references.dart';
//import 'package:quizzle/models/models.dart' show QuizPaperModel, RecentTest;
//import 'package:quizzle/services/firebase/firebasestorage_service.dart';
//import 'package:quizzle/utils/logger.dart';


import '../../firebase_ref/references.dart';
import '../../models/quiz_paper_model.dart';
import '../../models/recent_papers.dart';
import '../../services/firebase/firebasestorage_service.dart';
import '../../utils/logger.dart';
import '../auth_controller.dart';
import 'package:study_flutter_app/models/models.dart' show QuizPaperModel, RecentTest ;

class ProfileController extends GetxController {
  @override
  void onReady() {
    getMyRecentTests();
    super.onReady();
  }

  final allRecentTest = <RecentTest>[].obs;

  getMyRecentTests() async {
    try {
      User? user = Get.find<AuthController>().getUser();
      if (user == null) return;
      QuerySnapshot<Map<String, dynamic>> data =
      await recentQuizes(userId: user.email!).get();
      final tests =
      data.docs.map((paper) => RecentTest.fromSnapshot(paper)).toList();

      for (RecentTest test in tests) {
        DocumentSnapshot<Map<String, dynamic>> quizPaperSnapshot =
        await quizePaperFR.doc(test.paperId).get();
        final quizPaper = QuestionPaperModel.fromSnapshot(quizPaperSnapshot);

        final url =  await Get.find<FirebaseStorageService>().getImage(quizPaper.title);
        test.papername = quizPaper.title;
        test.paperimage = url;
      }

      allRecentTest.assignAll(tests);
    } catch (e) {
      AppLogger.e(e);
    }
  }
}
