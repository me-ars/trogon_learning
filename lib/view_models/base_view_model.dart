import 'package:flutter/material.dart';
import '../core/enums/view_state.dart';
import '../core/errors/base_exception.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;
  BaseException? _exception;

  BaseException? get exception => _exception;
  Function? _retryMethod;

  Function? get retryMethod => _retryMethod;

  void setViewState({required ViewState viewState}) {
    _viewState = viewState;
    notifyListeners();
  }

  showException({required dynamic error, required Function retryMethod}) {
    if (error! is BaseException) {
      _exception = error;
    } else {
      _exception = AppException(error: error.toString());
    }
    _retryMethod = retryMethod;
    //this will trigger the listener in the baseView.
    notifyListeners();
  }

  void clearException() {
    _exception = null;
    //clears the current exception while retrying .
    notifyListeners();
  }
}
