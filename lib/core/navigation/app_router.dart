  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';
  import 'package:trogon_learning/ui/views/lesson/lesson_view.dart';

  import '../../ui/views/home/home_view.dart';
  import '../../ui/views/modules/modules_view.dart';
  import '../constants/route_constants.dart';

   //no redirection logic according to the app scenario
  class AppRouter {
    static final appRouter = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          name: RouteConstants.home,
          path: '/',
          pageBuilder: (context, state) => const MaterialPage<void>(
            key: ValueKey<String>(RouteConstants.home),
            child: HomeView(),
          ),
          routes: [
            GoRoute(
              name: RouteConstants.modules,
              path: '/modules/:subjectId/:subjectName/:description',
              pageBuilder: (context, state) {
                final subjectId = int.tryParse(
                  state.pathParameters['subjectId'] ?? '1',
                );
                final subjectName = state.pathParameters['subjectName'] ?? '';
                final description = state.pathParameters['description'] ?? '';

                return MaterialPage<void>(
                  key: const ValueKey<String>(RouteConstants.modules),
                  child: ModulesView(
                    subjectId: subjectId ?? 1,
                    subjectName: subjectName,
                    description: description,
                  ),
                );
              },
              routes: [
                // The lesson route should not have subjectId in the path
                GoRoute(
                  name: RouteConstants.lessonView,
                  path: 'lesson/:moduleId',
                  pageBuilder: (context, state) {
                    final moduleId = int.tryParse(
                      state.pathParameters['moduleId'] ?? '1',
                    );
                    // Get other parameters from queryParameters
                    final subjectId = int.tryParse(
                      state.uri.queryParameters['subjectId'] ?? '1',
                    );
                    final subjectName = state.uri.queryParameters['subjectName'] ?? '';
                    final description = state.uri.queryParameters['description'] ?? '';

                    return MaterialPage<void>(
                      key: ValueKey<String>(RouteConstants.lessonView),
                      child: LessonView(
                        moduleId: moduleId ?? 1,
                        subjectId: subjectId ?? 1,
                        subjectName: subjectName,
                        description: description,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
