import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon_learning/core/enums/view_state.dart';
import 'package:trogon_learning/init_dependencies.dart';
import 'package:trogon_learning/ui/views/lesson/widgets/custom_vimeo_player.dart';
import 'package:trogon_learning/ui/views/lesson/widgets/you_tube_player.dart';
import 'package:trogon_learning/ui/widgets/shared/empty_view.dart';

import '../../../core/app/base_view.dart';
import '../../../core/theme/app_palette.dart';
import '../../../view_models/lesson_view_model/lesson_view_model.dart';
import '../../widgets/shared/custom_back_button.dart';
import '../../widgets/shared/loading_view.dart';

class LessonView extends StatelessWidget {
  final int moduleId;
  final int subjectId;
  final String subjectName;
  final String description;

  const LessonView({
    super.key,
    required this.moduleId,
    required this.subjectId,
    required this.subjectName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<LessonViewModel>(
      viewModel: locator<LessonViewModel>(),
      onModelReady: (viewModel) {
        viewModel.onModelReady(moduleId: moduleId, subjectId: subjectId);
      },
      builder: (context, viewModel, child) {
        Size size = MediaQuery.of(context).size;
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: AppPalette.litePurple,
              width: size.width,
              height: size.height, // Add this to ensure full height
              child: Padding(
                padding: EdgeInsets.only(),
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.05),
                        child: CustomBackButton(
                          height: size.height * 0.04,
                          width: size.height * 0.04,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Expanded(
                        child:
                            viewModel.viewState == ViewState.idle
                                ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.lesson!.title,
                                            style: GoogleFonts.akayaKanadaka(
                                              color: AppPalette.white,
                                              fontSize: 36,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            viewModel.lesson!.description,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              color: AppPalette.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.04),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: AppPalette.red,
                                        height: size.height * 0.5,
                                        child:
                                            viewModel.lesson!.video_type ==
                                                    'YouTube'
                                                ? CustomYouTubePlayer(
                                                  url:
                                                      viewModel
                                                          .lesson!
                                                          .video_url,
                                                )
                                                : CustomVimeoPlayer(
                                                  url:
                                                      viewModel
                                                          .lesson!
                                                          .video_url,
                                                ),
                                      ),
                                    ),
                                  ],
                                )
                                : viewModel.viewState == ViewState.loading
                                ? Center(
                                  child: LoadingView(
                                    height: size.height * 0.5,
                                    width: size.width * 0.9,
                                  ),
                                )
                                : Center(
                                  // Wrap EmptyView in Center
                                  child: EmptyView(
                                    height: size.height * 0.5,
                                    width: size.width * 0.9,
                                  ),
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
