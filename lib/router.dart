import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/video/views/video_recording_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => InterestsScreen(),
    ),
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|discover|inbox|profile)",
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => ActivityScreen(),
    ),
    GoRoute(
      name: ChatsScreen.routeName,
      path: ChatsScreen.routeURL,
      builder: (context, state) => ChatsScreen(),
      routes: [
        GoRoute(
          path: ChatDetailScreen.routeURL,
          name: ChatDetailScreen.routeName,
          builder: (context, state) {
            final chatId = state.params["chatId"]!;
            return ChatDetailScreen(chatId: chatId);
          },
        ),
      ],
    ),
    GoRoute(
      name: VideoRecordingScreen.routeName,
      path: VideoRecordingScreen.routeURL,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            transitionDuration: Duration(microseconds: 200),
            child: VideoRecordingScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final position = Tween(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(position: position, child: child);
            },
          ),
    ),
  ],
);
