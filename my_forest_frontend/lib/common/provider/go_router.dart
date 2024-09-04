import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/daliy/view/daily_screen.dart';
import 'package:my_forest_frontend/daliy/view/daily_writing_screen.dart';
import 'package:my_forest_frontend/forest/view/start_screen.dart';
import 'package:my_forest_frontend/guide/view/guide_screen.dart';

import '../../forest/view/delivery_screen.dart';
import '../../forest/view/select_forest_screen.dart';
import '../../home/view/grow_stage_screen.dart';
import '../../home/view/home_screen.dart';
import '../../notification/view/notification_detail_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../store/view/my_item_screen.dart';
import '../../store/view/product_screen.dart';
import '../../user/view/certification_screen.dart';
import '../../user/view/custom_sns_screen.dart';
import '../../user/view/edit_profile_screen.dart';
import '../../user/view/email_login_screen.dart';
import '../../user/view/find_id_screen.dart';
import '../../user/view/find_password_input_screen.dart';
import '../../user/view/find_password_screen.dart';
import '../../user/view/input_info_screen.dart';
import '../../user/view/login_screen.dart';
import '../../user/view/profile_screen.dart';
import '../../user/view/term_detail_screen.dart';
import '../../user/view/term_screen.dart';
import '../view/completion_screen.dart';
import '../view/completion_screen_to_email_login.dart';
import '../view/error_screen.dart';
import '../view/scaffold_with_nav.dart';
import '../view/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  // initialLocation: '/splash',
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/home",
                name: HomeScreen.routeName,
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: "grow_stage",
                    name: GrowStageScreen.routeName,
                    builder: (context, state) => GrowStageScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/guide",
                name: GuideScreen.routeName,
                builder: (context, state) => GuideScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/daily",
                name: DailyScreen.routeName,
                builder: (context, state) => DailyScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: DailyWritingScreen.routeName,
                    builder: (context, state) {
                      final String id = state.pathParameters["id"]!;
                      return DailyWritingScreen(id: id);
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/product",
                name: ProductScreen.routeName,
                builder: (context, state) => ProductScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: ProfileScreen.routeName,
                builder: (context, state) => ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'edit',
                    name: EditProfileScreen.routeName,
                    builder: (context, state) => EditProfileScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'delivery',
                    name: DeliveryScreen.routeName,
                    builder: (context, state) => DeliveryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'my_item',
                    name: MyItemScreen.routeName,
                    builder: (context, state) => MyItemScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNav(navigationShell: navigationShell);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) {
          final String title = state.pathParameters['title']!;

          return CompletionScreen(title: title);
        },
      ),
      GoRoute(
        path: '/completion_find/:title',
        name: CompletionScreenToEmailLogin.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreenToEmailLogin(title: parameters['title']!);
        },
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context, state) => TermScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'detail/:id',
                    name: TermDetailScreen.routeName,
                    builder: (context, state) => TermDetailScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'certification',
                name: CertificationScreen.routeName,
                builder: (context, state) => CertificationScreen(),
                routes: [
                  GoRoute(
                    path: 'input_info',
                    name: InputInfoScreen.routeName,
                    builder: (context, state) => InputInfoScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'find_id',
                name: FindIdScreen.routeName,
                builder: (context, state) => FindIdScreen(),
              ),
              GoRoute(
                path: 'find_password',
                name: FindPasswordScreen.routeName,
                builder: (context, state) => FindPasswordScreen(),
                routes: [
                  GoRoute(
                    path: 'input',
                    name: FindPasswordInputScreen.routeName,
                    builder: (context, state) => FindPasswordInputScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/notification',
        name: NotificationScreen.routeName,
        builder: (context, state) => NotificationScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: NotificationDetailScreen.routeName,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return NotificationDetailScreen(id: id);
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/start',
        name: StartScreen.routeName,
        builder: (context, state) => StartScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "select_forest",
            name: SelectForestScreen.routeName,
            builder: (context, state) => SelectForestScreen(),
          ),
        ],
      ),
    ];
