import 'dart:ui';

import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/screens/splash/splash_screen_vm.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const _minimumDisplayDuration = Duration(milliseconds: 2500);

  late final Future<SplashState> _initialStateFuture;
  late final AnimationController _introController;
  late final AnimationController _pulseController;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoLift;
  late final Animation<double> _glowPulse;
  late final Animation<double> _backgroundDrift;
  bool _redirected = false;

  @override
  void initState() {
    super.initState();

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );

    _logoOpacity = CurvedAnimation(
      parent: _introController,
      curve: const Interval(0.12, 0.72, curve: Curves.easeOutCubic),
    );
    _logoScale = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _introController,
        curve: Curves.easeOutBack,
      ),
    );
    _logoLift = Tween<double>(
      begin: 26,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _introController,
        curve: Curves.easeOutCubic,
      ),
    );
    _glowPulse = Tween<double>(
      begin: 0.92,
      end: 1.08,
    ).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _backgroundDrift = Tween<double>(
      begin: -6,
      end: 6,
    ).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _initialStateFuture = _loadInitialStateWithMinimumDuration();
    _introController.forward();
    _pulseController.repeat(reverse: true);
  }

  void _redirect(SplashState state) {
    if (_redirected) {
      return;
    }

    _redirected = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final route = switch (state) {
        SplashState.logged => RouteGeneratorKeys.painel,
        SplashState.auth => RouteGeneratorKeys.authLogin,
      };

      Navigator.of(context).pushReplacementNamed(route);
    });
  }

  Future<SplashState> _loadInitialStateWithMinimumDuration() async {
    final startTime = DateTime.now();
    final splashState = await SplashScreenVm().loadInitialState();
    final elapsedTime = DateTime.now().difference(startTime);
    final remainingTime = _minimumDisplayDuration - elapsedTime;

    if (remainingTime > Duration.zero) {
      await Future<void>.delayed(remainingTime);
    }

    return splashState;
  }

  @override
  void dispose() {
    _introController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFFF6F0E8),
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F3EC),
        body: FutureBuilder<SplashState>(
          future: _initialStateFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _redirect(snapshot.data!);
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final logoWidth = (constraints.maxWidth * 0.44).clamp(
                  220.0,
                  380.0,
                );

                return AnimatedBuilder(
                  animation: Listenable.merge([
                    _introController,
                    _pulseController,
                  ]),
                  builder: (context, _) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        const ColoredBox(color: Color(0xFFF8F3EC)),
                        Transform.translate(
                          offset: Offset(0, _backgroundDrift.value),
                          child: Image.asset(
                            ImagesConstants.splashBackground,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFF8F3EC).withValues(alpha: 0.22),
                                const Color(0xFFF8F3EC).withValues(alpha: 0.10),
                                const Color(0xFFF8F3EC).withValues(alpha: 0.20),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -constraints.maxHeight * 0.03,
                          right: -constraints.maxWidth * 0.12,
                          child: _SoftShape(
                            width: constraints.maxWidth * 0.42,
                            height: constraints.maxHeight * 0.16,
                            opacity: 0.28,
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * 0.25,
                          left: -constraints.maxWidth * 0.18,
                          child: _SoftShape(
                            width: constraints.maxWidth * 0.32,
                            height: constraints.maxHeight * 0.18,
                            opacity: 0.18,
                          ),
                        ),
                        Positioned(
                          bottom: -constraints.maxHeight * 0.08,
                          left: -constraints.maxWidth * 0.05,
                          child: _SoftShape(
                            width: constraints.maxWidth * 0.76,
                            height: constraints.maxHeight * 0.22,
                            opacity: 0.24,
                          ),
                        ),
                        SafeArea(
                          child: Center(
                            child: Transform.translate(
                              offset: Offset(
                                0,
                                -constraints.maxHeight * 0.05 - _logoLift.value,
                              ),
                              child: Opacity(
                                opacity: _logoOpacity.value.clamp(0.0, 1.0),
                                child: Transform.scale(
                                  scale: _logoScale.value,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                          sigmaX: 28 * _glowPulse.value,
                                          sigmaY: 28 * _glowPulse.value,
                                        ),
                                        child: Container(
                                          width: logoWidth *
                                              (1.24 * _glowPulse.value),
                                          height: logoWidth *
                                              (1.14 * _glowPulse.value),
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              colors: [
                                                const Color(
                                                  0xFFF8E9C8,
                                                ).withValues(alpha: 0.98),
                                                const Color(
                                                  0xFFF1D6A1,
                                                ).withValues(alpha: 0.72),
                                                const Color(
                                                  0xFFF1D6A1,
                                                ).withValues(alpha: 0.0),
                                              ],
                                              stops: const [0.0, 0.52, 1.0],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(0, 8),
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 12,
                                            sigmaY: 12,
                                          ),
                                          child: Image.asset(
                                            ImagesConstants.logo,
                                            width: logoWidth * 0.96,
                                            fit: BoxFit.contain,
                                            color: const Color(0xFF8A5A24)
                                                .withValues(alpha: 0.30),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                      ),
                                      ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Color(0xFFC48C43),
                                          BlendMode.modulate,
                                        ),
                                        child: Image.asset(
                                          ImagesConstants.logo,
                                          width: logoWidth,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.34,
                                        child: Image.asset(
                                          ImagesConstants.logo,
                                          width: logoWidth,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _SoftShape extends StatelessWidget {
  const _SoftShape({
    required this.width,
    required this.height,
    required this.opacity,
  });

  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFF3EADF).withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
