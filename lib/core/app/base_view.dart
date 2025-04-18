import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trogon_learning/ui/widgets/shared/error_view.dart';

import '../../view_models/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
  builder;
  final T viewModel;
  final void Function(T viewModel) onModelReady;

  const BaseView({
    super.key,
    required this.onModelReady,
    required this.builder,
    required this.viewModel,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    viewModel.addListener(_showErrorWarning);//triggers when any event takes place
    widget.onModelReady(viewModel);
  }

  _showErrorWarning() {
    if (viewModel.exception != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) { // only after build
        final currentLocation = GoRouter.of(context).state;
        final isOnHomeScreen = currentLocation.path == '/';
        Size size = MediaQuery.of(context).size;
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              child: ErrorView(
                canPopScreen: isOnHomeScreen,
                width: size.width * 0.9,
                height: size.height * 0.3,
                onRetry: () {
                  Navigator.pop(context);
                  viewModel.clearException();
                  viewModel.retryMethod?.call();
                },
                onCancel: (){

                    Navigator.pop(context);
                    Navigator.pop(context);
                }
                ,
              ),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
