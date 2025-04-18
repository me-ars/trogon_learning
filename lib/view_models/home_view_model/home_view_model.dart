import '../../core/constants/api_url_constants.dart';
import '../../core/enums/view_state.dart';
import '../../core/services/api_service.dart';
import '../../data/models/subject_model.dart';
import '../base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService;

  HomeViewModel({required ApiService apiService}) : _apiService = apiService;

  List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  onModelReady() async {
    try {
      //fetch all the subjects from api.
      setViewState(viewState: ViewState.loading);
      var data = await _apiService.getData(url: ApiUrlConstants.subjectApi);
      if (data != null) {
        for (var subject in data) {
          _subjects.add(Subject.fromJson(subject));
        }
      }
      if (_subjects.isNotEmpty) {
        setViewState(viewState: ViewState.idle);
      } else {
        setViewState(viewState: ViewState.empty);
      }
    } catch (e) {
      showException(
        error: e,
        retryMethod: () {
          onModelReady();
        },
      );
    }
  }
}
