
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/core/common_widgets/animated_info_card.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/extensions/sized_box_extension.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "CALCULATOR"),
      body: Column(
        children: [
          20.toHeight,
          AnimatedInfoCard(
            title: 'Compound Interest',
            subtitle: 'Your money grows exponentially',
            icon: Icons.auto_graph_rounded,
            backgroundIcon: Icons.attach_money,
           onTap: () => context.push('/calculator/compound_interest'),
          ),
          10.toHeight,
          AnimatedInfoCard(
            title: 'Simple Interest',
            subtitle: 'Straightforward interest calculation',
            icon: Icons.trending_up_rounded,
            backgroundIcon: Icons.percent,
            gradientColors: [
              const Color(0xFF11998E), // Teal
              const Color(0xFF38EF7D), // Light Green
            ],
            useRotation: false,
            animateBorderRadius: true,
            iconStyle: CardIconStyle.circle,
            hoverEffect: CardHoverEffect.border,
           onTap: () => context.push('/calculator/simple_interest'), 
          )
        ],
      ),
    );
  }
}