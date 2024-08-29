import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/daliy/view/daily_screen.dart';
import 'package:my_forest_frontend/daliy/view/daily_writing_screen.dart';
import 'package:my_forest_frontend/guide/view/guide_screen.dart';

import '../../home/view/grow_stage_screen.dart';
import '../../home/view/home_screen.dart';
import '../../notification/view/notification_detail_screen.dart';
import '../../notification/view/notification_screen.dart';
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
                // routes: [
                //   GoRoute(
                //     parentNavigatorKey: _rootNavigatorKey,
                //     path: "my_request_list",
                //     name: MyRequestListScreen.routeName,
                //     builder: (context, state) => MyRequestListScreen(),
                //   ),
                //   GoRoute(
                //     parentNavigatorKey: _rootNavigatorKey,
                //     path: "list",
                //     name: ManufacturingListScreen.routeName,
                //     builder: (context, state) => ManufacturingListScreen(),
                //   ),
                //   GoRoute(
                //     parentNavigatorKey: _rootNavigatorKey,
                //     path: ":id",
                //     name: ManufacturingDetailScreen.routeName,
                //     builder: (context, state) {
                //       final String id = state.pathParameters["id"]!;
                //       return ManufacturingDetailScreen(id: id);
                //     },
                //     routes: [
                //       GoRoute(
                //         parentNavigatorKey: _rootNavigatorKey,
                //         path: "request",
                //         name: ManufacturingRequestScreen.routeName,
                //         builder: (context, state) {
                //           final String id = state.pathParameters["id"]!;
                //           return ManufacturingRequestScreen(id: id);
                //         },
                //       )
                //     ],
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/product",
                name: ProductScreen.routeName,
                builder: (context, state) => ProductScreen(),
                //   routes: [
                //     GoRoute(
                //       parentNavigatorKey: _rootNavigatorKey,
                //       path: 'purchase:id',
                //       name: ProductPurchaseDetailScreen.routeName,
                //       builder: (context, state) {
                //         final productId =
                //         GoRouterState.of(context).pathParameters['id']!;
                //
                //         return ProductPurchaseDetailScreen(id: productId);
                //       },
                //     ),
                //     GoRoute(
                //       parentNavigatorKey: _rootNavigatorKey,
                //       path: ':id',
                //       name: ProductDetailScreen.routeName,
                //       builder: (context, state) {
                //         final productId =
                //             GoRouterState.of(context).pathParameters['id']!;
                //
                //         return ProductDetailScreen(id: productId);
                //       },
                //     ),
                //   ],
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
                  // GoRoute(
                  //   parentNavigatorKey: _rootNavigatorKey,
                  //   path: 'my_product_list',
                  //   name: MyProductListScreen.routeName,
                  //   builder: (context, state) => MyProductListScreen(),
                  // ),
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
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/create_order',
      //   name: CreateOrderScreen.routeName,
      //   builder: (context, state) => CreateOrderScreen(),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/order_list',
      //   name: OrderListScreen.routeName,
      //   builder: (context, state) => OrderListScreen(),
      //   routes: [
      //     GoRoute(
      //       parentNavigatorKey: _rootNavigatorKey,
      //       path: ':id',
      //       name: OrderDetailScreen.routeName,
      //       builder: (context, state) {
      //         String id = state.pathParameters['id']!;
      //         return OrderDetailScreen(id: id);
      //       },
      //     ),
      //   ],
      // ),
    ];
