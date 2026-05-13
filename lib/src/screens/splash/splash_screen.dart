import 'package:asyncstate/asyncstate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 320 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final splashScreenVm = ref.watch(splashScreenVmProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConstants.backgroundImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: _animationOpacityLogo,
            curve: Curves.easeIn,
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,

              onEnd: () async {
                await ref.read(seedsHandlerProvider).execute().asyncLoader();

                splashScreenVm.whenOrNull(
                  error: (error, stackTrace) => (error, stackTrace) {},
                  data: (data) async {
                    switch (data) {
                      case SplashState.logged:
                        context.navigator.pushNamedAndRemoveUntil(
                          RouteGeneratorKeys.painel,
                          (_) => false,
                        );
                      default:
                        context.navigator.pushNamedAndRemoveUntil(
                          RouteGeneratorKeys.authLogin,
                          (_) => false,
                        );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
