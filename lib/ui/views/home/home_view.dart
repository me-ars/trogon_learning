import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trogon_learning/ui/views/home/widgets/home_head.dart';
import 'package:trogon_learning/ui/views/home/widgets/subject_tile.dart';
import '../../../core/app/base_view.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/theme/app_palette.dart';
import '../../../init_dependencies.dart';
import '../../../view_models/home_view_model/home_view_model.dart';
import '../../widgets/shared/loading_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//dynamic size value make the ui more responsive
    return BaseView<HomeViewModel>(
      viewModel: locator<HomeViewModel>(),
      onModelReady: (viewModel) => viewModel.onModelReady(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Padding(
                  padding: EdgeInsets.only(
                    right: size.width / 1.4,
                    top: size.height * 0.015,
                  ),
                  child: Text(
                    "Trogon",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppPalette.skyBlue,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                HomeHead(height: size.height * 0.2, width: size.width * 0.94),

                Padding(
                  padding: EdgeInsets.only(
                    right: size.width / 1.58,
                    top: size.height * 0.01,
                  ),
                  child: Text(
                    "Subject's",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.01),
                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (viewModel.viewState == ViewState.loading) {
                        return Center(
                          child: LoadingView(
                            height: size.height * 0.5,
                            width: size.width * 0.9,
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: viewModel.subjects.length,
                        itemBuilder: (context, index) {
                          final subject = viewModel.subjects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SubjectTile(
                              width: size.width * 0.9,
                              height: size.height * 0.18,
                              onTap: () {
                                //passes the arguments as parameters
                                context.goNamed(
                                  RouteConstants.modules,
                                  pathParameters: {
                                    'subjectId':
                                        viewModel.subjects[index].id.toString(),
                                    'subjectName':
                                        viewModel.subjects[index].title,
                                    'description':
                                        viewModel.subjects[index].description,
                                  },
                                );
                              },
                              subject: subject.title,
                              description: subject.description,
                              imageUrl: subject.image,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
