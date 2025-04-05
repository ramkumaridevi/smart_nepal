import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/constants/app_constant.dart';
import 'package:smart_nepal/core/constants/app_string.dart';
import 'package:smart_nepal/core/extensions/sized_box_extension.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController with a duration of 700ms
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Define the animation for the screen sliding from top to bottom
    _offsetAnimation = Tween<Offset>(
            begin: const Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation as soon as the screen is loaded
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Dashboard"),
      body: SlideTransition(
        position:
            _offsetAnimation, // Apply the sliding animation to the whole screen
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // First GestureDetector with animation
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // Navigate to Simple Interest Screen with animation
                  context.go("/simple_interest_screen");
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.7),
                        AppColors.teal,
                        AppColors.primary
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      AppSIString.sadharanByaj,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              17.toHeight,
              // Second GestureDetector with animation
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // Navigate to Compound Interest Screen with animation
                  context.go("/compound_interest_screen");
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.7),
                        AppColors.teal,
                        AppColors.primary
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      AppCIString.chakriyaByaj,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
