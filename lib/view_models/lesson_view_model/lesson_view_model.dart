import 'package:trogon_learning/core/enums/view_state.dart';
import 'package:trogon_learning/core/services/api_service.dart';
import 'package:trogon_learning/data/models/lesson_model.dart';
import 'package:trogon_learning/view_models/base_view_model.dart';

class LessonViewModel extends BaseViewModel {
  final ApiService _apiService;

  LessonViewModel({required ApiService apiService}) : _apiService = apiService;
  List<Lesson> _lessons = [];

  List<Lesson> get lessons => _lessons;
  Lesson? _lesson;

  Lesson? get lesson => _lesson;

  Future<void> onModelReady({
    required int moduleId,
    required int subjectId,
  }) async {
    try {
      //currently the params moduleId and subject id , return the same response
      setViewState(viewState: ViewState.loading);
      var data = await _apiService.getData(
        url:
            'https://trogon.info/interview/php/api/videos.php?module_id=$moduleId&subject_id=$subjectId',
      );
      if (data != null) {
        for (var tempLesson in data) {
          _lessons.add(Lesson.fromJson(tempLesson));
        }
        if (_lessons.isNotEmpty) {
          for (var i in _lessons) {
            if (i.id == moduleId) {
              _lesson = i;
            }
          }
          //fetch the lesson with same module_id
        }
      }
      if (_lesson != null) {
        setViewState(viewState: ViewState.idle);
      } else {
        setViewState(viewState: ViewState.empty);
      }
    } catch (e) {
      showException(
        error: e,
        retryMethod: () {
          onModelReady(subjectId: subjectId, moduleId: moduleId);
        },
      );
    }
  }
}
