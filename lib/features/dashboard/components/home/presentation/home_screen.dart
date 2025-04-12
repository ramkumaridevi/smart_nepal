import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/extensions/sized_box_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "SMART NEPAL"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.04.screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header
              _buildWelcomeHeader(context),
              SizedBox(height: 0.03.screenHeight),

              // Main Features Section
              Text(
                'Quick Access',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
              ),
              SizedBox(height: 0.02.screenHeight),

              // Featured Cards (asymmetric layout)
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildFeatureCard(
                              context,
                              icon: Icons.calculate,
                              title: 'Calculator',
                              subtitle: 'Advanced calculations',
                              color: Colors.blue,
                              height: 0.22.screenHeight,
                              onTap: () {
                                context.push('/calculator');
                              },
                            ),
                          ),
                          SizedBox(width: 0.04.screenWidth),
                          Expanded(
                            child: _buildFeatureCard(
                              context,
                              icon: Icons.local_parking,
                              title: 'Parking',
                              subtitle: 'Find spots',
                              color: Colors.orange,
                              height: 0.22.screenHeight,
                              onTap: () {
                                // Handle the Parking tap
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02.screenHeight),
                      Row(
                        children: [
                          Expanded(
                            child: _buildFeatureCard(
                              context,
                              icon: Icons.delete,
                              title: 'Waste',
                              subtitle: 'Management',
                              color: Colors.green,
                              height: 0.18.screenHeight,
                              onTap: () {
                                // Handle the Waste tap
                              },
                            ),
                          ),
                          SizedBox(width: 0.04.screenWidth),
                          Expanded(
                            flex: 2,
                            child: _buildFeatureCard(
                              context,
                              icon: Icons.book,
                              title: 'Library',
                              subtitle: 'Digital resources',
                              color: Colors.purple,
                              height: 0.18.screenHeight,
                              onTap: () {
                                // Handle the Library tap
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02.screenHeight),
                      _buildFeatureCard(
                        context,
                        icon: Icons.meeting_room,
                        title: 'Room Booking',
                        subtitle: 'Reserve spaces',
                        color: Colors.teal,
                        height: 0.20.screenHeight,
                        fullWidth: true,
                        onTap: () {
                          // Handle the Room Booking tap
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 0.03.screenHeight),

              // Secondary Features Section
              Text(
                'More Services',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
              ),
              SizedBox(height: 0.02.screenHeight),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 0.02.screenHeight,
                crossAxisSpacing: 0.04.screenWidth,
                children: [
                  _buildSmallFeatureCard(
                      context, Icons.event, 'Events', Colors.red, () {
                    // Handle the Events tap
                  }),
                  _buildSmallFeatureCard(
                      context, Icons.map, 'Maps', Colors.indigo, () {
                    // Handle the Maps tap
                  }),
                  _buildSmallFeatureCard(
                      context, Icons.attach_money, 'Finance', Colors.green, () {
                    // Handle the Finance tap
                  }),
                  _buildSmallFeatureCard(
                      context, Icons.health_and_safety, 'Health', Colors.pink,
                      () {
                    // Handle the Health tap
                  }),
                  _buildSmallFeatureCard(
                      context, Icons.school, 'Education', Colors.amber, () {
                    // Handle the Education tap
                  }),
                  _buildSmallFeatureCard(
                      context, Icons.more_horiz, 'More', Colors.grey, () {
                    // Handle the More tap
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.05.screenWidth),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade700,
            Colors.teal.shade400,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 30, color: Colors.blue),
          ),
          SizedBox(width: 0.04.screenWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'What would you like to do today?',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    double? height,
    bool fullWidth = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: height ?? 0.15.screenHeight,
        width: fullWidth ? 1.0.screenWidth : null,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 16,
              top: 16,
              child: Opacity(
                opacity: 0.1,
                child: Icon(icon, size: 60, color: color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 24, color: color),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallFeatureCard(BuildContext context, IconData icon,
      String title, Color color, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
