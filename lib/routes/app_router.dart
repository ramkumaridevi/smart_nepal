import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/features/dashboard/presentation/view/compound_interest_screen.dart';
import 'package:smart_nepal/features/dashboard/presentation/view/dashboard.dart';
import 'package:smart_nepal/features/dashboard/presentation/view/error_screen.dart';
import 'package:smart_nepal/features/dashboard/presentation/view/simple_interest_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      // Dashboard Screen (Default Route)
      GoRoute(
        path: "/",
        builder: (context, state) => DashboardScreen(),
      ),

      // Simple Interest Screen with Right-to-Left Animation
      GoRoute(
        path: "/simple_interest_screen",
        pageBuilder: (context, state) => _customPageTransition(
          context,
          SimpleInterestScreen(),
        ),
      ),

      // Compound Interest Screen with Right-to-Left Animation
      GoRoute(
        path: "/compound_interest_screen",
        pageBuilder: (context, state) => _customPageTransition(
          context,
          CompoundInterestScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(
          errorMessage: state.error?.message ?? 'An unknown error occurred');
    },
  );

  // Custom transition for right-to-left sliding animation
  static Page<dynamic> _customPageTransition(
      BuildContext context, Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0), // Start from right
            end: Offset.zero, // Move to center
          ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }
}
