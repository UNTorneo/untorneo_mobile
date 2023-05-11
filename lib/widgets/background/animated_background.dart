import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({required this.child, super.key});

  final Widget child;

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  static const foodIcons = [
    Icons.sports_bar,
    Icons.sports_baseball,
    Icons.sports_basketball,
    Icons.sports_cricket,
    Icons.sports_esports,
    Icons.sports_football,
    Icons.sports_golf,
    Icons.sports_handball,
    Icons.sports_hockey,
    Icons.sports_kabaddi,
    Icons.sports_mma,
    Icons.sports_motorsports,
    Icons.sports_rugby,
    Icons.sports_soccer,
    Icons.sports_tennis,
    Icons.sports_volleyball,
    Icons.sports,
    FontAwesomeIcons.baseballBatBall,
    FontAwesomeIcons.basketball,
    FontAwesomeIcons.bowlingBall,
    FontAwesomeIcons.chess,
    FontAwesomeIcons.dumbbell,
    FontAwesomeIcons.football,
    FontAwesomeIcons.golfBallTee,
    FontAwesomeIcons.hockeyPuck,
    FontAwesomeIcons.motorcycle,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.personRunning,
    FontAwesomeIcons.personSkiing,
    FontAwesomeIcons.personSnowboarding,
    FontAwesomeIcons.personSwimming,
    FontAwesomeIcons.tableTennisPaddleBall,
    FontAwesomeIcons.volleyball,
  ];

  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _animate = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final middleWidth = size.width / 2;
    final middleHeight = size.height / 2;

    final random = Random();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.redAccent,
                  ],
                ),
              ),
            ),
            ...List.generate(
              random.nextInt(10) + 20,
              (index) => AnimatedPositioned(
                key: Key('$index'),
                duration: Duration(milliseconds: 500 + random.nextInt(1000)),
                curve: Curves.easeInOut,
                top:
                    _animate ? size.height * random.nextDouble() : middleHeight,
                left: _animate ? size.width * random.nextDouble() : middleWidth,
                child: Transform.rotate(
                  angle: 2 * pi * random.nextDouble(),
                  child: FaIcon(
                    foodIcons.elementAt(random.nextInt(foodIcons.length)),
                    size: 50 * random.nextDouble() + 20,
                    color: Colors.white
                        .withOpacity(min(1, random.nextDouble() + 0.6)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20 + MediaQuery.of(context).padding.top,
              left: 20,
              right: 20,
              bottom: 20 + MediaQuery.of(context).padding.bottom,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
