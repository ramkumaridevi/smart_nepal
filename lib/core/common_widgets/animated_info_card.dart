import 'dart:math';
import 'package:flutter/material.dart';

enum CardIconStyle { neumorphic, circle }
enum CardHoverEffect { glow, border }

class AnimatedInfoCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData? backgroundIcon;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;
  final bool useRotation;
  final bool animateBorderRadius;
  final CardIconStyle iconStyle;
  final CardHoverEffect hoverEffect;
  final double? width;
  final double? height;

  const AnimatedInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.backgroundIcon,
    this.gradientColors,
    this.onTap,
    this.useRotation = true,
    this.animateBorderRadius = false,
    this.iconStyle = CardIconStyle.neumorphic,
    this.hoverEffect = CardHoverEffect.glow,
    this.width,
    this.height,
  });

  @override
  State<AnimatedInfoCard> createState() => _AnimatedInfoCardState();
}

class _AnimatedInfoCardState extends State<AnimatedInfoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _borderRadiusAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 0.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _borderRadiusAnimation = Tween<double>(begin: 20, end: 30).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
      if (hovering) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..scale(_scaleAnimation.value)
                ..rotateZ(widget.useRotation
                    ? _rotationAnimation.value * (_isHovered ? 1 : -1)
                    : 0),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left:12.0,right: 12.0),
                child: Container(
                  width: widget.width ?? screenWidth * 1.0,
                  height: widget.height ?? screenHeight * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: widget.gradientColors ??
                          [
                            const Color(0xFF6A11CB),
                            const Color(0xFF2575FC),
                          ],
                    ),
                    borderRadius: BorderRadius.circular(
                      widget.animateBorderRadius
                          ? _borderRadiusAnimation.value
                          : 20,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      if (widget.backgroundIcon != null)
                        Positioned(
                          right: widget.iconStyle == CardIconStyle.circle ? 20 : -30,
                          top: widget.iconStyle == CardIconStyle.circle ? 20 : -30,
                          child: widget.iconStyle == CardIconStyle.circle
                              ? Icon(
                                  widget.backgroundIcon,
                                  size: 80,
                                  color: Colors.white.withOpacity(0.15),
                                )
                              : Transform.rotate(
                                  angle: pi / 4,
                                  child: Icon(
                                    widget.backgroundIcon,
                                    size: 120,
                                    color: Colors.white.withOpacity(0.08),
                                  ),
                                ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            // Icon with different styles
                            widget.iconStyle == CardIconStyle.neumorphic
                                ? _buildNeumorphicIcon()
                                : _buildCircleIcon(),
                            const SizedBox(width: 20),
                            // Text content
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widget.iconStyle == CardIconStyle.circle ? 16 : 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                    shadows: widget.iconStyle == CardIconStyle.neumorphic
                                        ? [
                                            Shadow(
                                              blurRadius: 2,
                                              color: Colors.black.withOpacity(0.2),
                                              offset: const Offset(1, 1),
                                            ),
                                          ]
                                        : null,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: screenWidth * 0.6,
                                  child: Text(
                                    widget.subtitle,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: widget.iconStyle == CardIconStyle.circle ? 13 : 14,
                                      fontWeight: widget.iconStyle == CardIconStyle.circle
                                          ? FontWeight.w400
                                          : FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Hover effects
                      if (_isHovered && widget.hoverEffect == CardHoverEffect.glow)
                        Positioned(
                          top: -50,
                          left: -50,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withOpacity(0.3),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (_isHovered && widget.hoverEffect == CardHoverEffect.border)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                widget.animateBorderRadius
                                    ? _borderRadiusAnimation.value
                                    : 20,
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNeumorphicIcon() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.white, Colors.amber.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: Icon(
          widget.icon,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCircleIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        widget.icon,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}