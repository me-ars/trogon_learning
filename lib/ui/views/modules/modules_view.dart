import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon_learning/core/constants/route_constants.dart';
import 'package:trogon_learning/ui/views/modules/widgets/module_tile.dart';
import '../../../core/app/base_view.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/theme/app_palette.dart';
import '../../../init_dependencies.dart';
import '../../../view_models/modules/modules_view_model.dart';
import '../../widgets/shared/custom_back_button.dart';
import '../../widgets/shared/empty_view.dart';
import '../../widgets/shared/loading_view.dart';

class ModulesView extends StatelessWidget {
  final int subjectId;
  final String subjectName;
  final String description;

  const ModulesView({
    super.key,
    required this.subjectId,
    required this.subjectName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseView<ModulesViewModel>(
      viewModel: locator<ModulesViewModel>(),
      onModelReady: (viewModel) {
        viewModel.onModelReady(subjectId: subjectId);
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: AppPalette.litePurple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBackButton(
                          height: size.height * 0.04,
                          width: size.height * 0.04,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          subjectName,
                          style: GoogleFonts.akayaKanadaka(
                            color: AppPalette.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppPalette.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Expanded(
                    child: Container(
                      height: size.height * 0.6,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: AppPalette.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                          left: size.height * 0.021,
                          right: size.height * 0.01,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Modules',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: size.height * 0.04),
                            Expanded(
                              child:
                                  viewModel.viewState == ViewState.empty
                                      ? Center(
                                        child: EmptyView(
                                          height: size.height * 0.5,
                                          width: size.width * 0.9,
                                        ),
                                      )
                                      : viewModel.viewState == ViewState.loading
                                      ? Center(
                                        child: LoadingView(
                                          height: size.height * 0.5,
                                          width: size.width * 0.9,
                                        ),
                                      )
                                      : ListView.builder(
                                        itemCount: viewModel.modules.length,
                                        itemBuilder: (context, index) {
                                          return ModuleTile(
                                            onTap: () {
                                              context.goNamed(
                                                RouteConstants.lessonView,
                                                pathParameters: {
                                                  'subjectId': subjectId.toString(),
                                                  'subjectName': subjectName,
                                                  'description': description,
                                                  'moduleId': viewModel.modules[index].id.toString(),
                                                },
                                              );
                                            },
                                            index: index + 1,
                                            title:
                                                viewModel.modules[index].title,
                                            description:
                                                viewModel
                                                    .modules[index]
                                                    .description,
                                            width: size.width * 0.8,
                                            height: size.height * 0.135,
                                          );
                                        },
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
