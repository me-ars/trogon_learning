import '../../core/enums/view_state.dart';
import '../../core/services/api_service.dart';
import '../../data/models/module_model.dart';
import '../base_view_model.dart';

class ModulesViewModel extends BaseViewModel {
  final ApiService _apiService;

  ModulesViewModel({required ApiService apiService}) : _apiService = apiService;
  List<Module> _modules = [];

  List<Module> get modules => _modules;

  onModelReady({required int subjectId}) async {
    try {
      //current subject is not recognized bu the api.
      setViewState(viewState: ViewState.loading);
      var data = await _apiService.getData(url:
            'https://trogon.info/interview/php/api/modules.php?subject_id=$subjectId',
      );
      if (data != null) {
        for (var i in data) {
          _modules.add(Module.fromJson(i));
        }
      }
      if (_modules.isNotEmpty) {
        setViewState(viewState: ViewState.idle);
      } else {
        setViewState(viewState: ViewState.empty);
      }
      //assign the view state according to the modules fetched;
    } catch (e) {
      showException(
        error: e,
        retryMethod: () {
          onModelReady(subjectId: subjectId);
        },
      );
    }
  }
}
