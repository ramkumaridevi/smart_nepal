import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/features/dashboard/components/home/component/calculator/calculator_screen.dart';
import 'package:smart_nepal/features/dashboard/components/home/component/calculator/compound_interest_screen.dart';
import 'package:smart_nepal/features/dashboard/components/home/component/calculator/simple_interest_screen.dart';
import 'package:smart_nepal/features/dashboard/dashboard.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      // Dashboard Screen (Default Route)
      GoRoute(
        path: "/",
        builder: (context, state) => const Dashboard(),
      ),

      // Calculator Screen with nested routes
      GoRoute(
        path: "/calculator",
        pageBuilder: (context, state) => _customPageTransition(
          context,
          const CalculatorScreen(),
        ),
        routes: [
          // Nested Simple Interest Screen
          GoRoute(
            path: "simple_interest",
            pageBuilder: (context, state) => _customPageTransition(
              context,
              const SimpleInterestScreen(),
            ),
          ),
          
          // Nested Compound Interest Screen
          GoRoute(
            path: "compound_interest",
            pageBuilder: (context, state) => _customPageTransition(
              context,
              const CompoundInterestScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Text("Error");
    },
  );

  // Custom transition for right-to-left sliding animation
  static Page<dynamic> _customPageTransition(BuildContext context, Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0), // Start from right
            end: Offset.zero, // Move to center
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    );
  }
}