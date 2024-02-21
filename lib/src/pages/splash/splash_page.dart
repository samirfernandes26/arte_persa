import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/splash/splash_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({
    super.key,
  });

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
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
    final state = ref.watch(splashVmProvider);

    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
          opacity: _animationOpacityLogo,
          onEnd: () async {
            state.whenOrNull(
              error: (error, stackTrace) {},
              data: (data) async {
                switch (data) {
                  case SplashState.logged:
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteGeneratorKeys.cadastrar,
                      (route) => false,
                    );
                    break;
                  case SplashState.unlogged:
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteGeneratorKeys.authLogin,
                      (route) => false,
                    );
                    break;
                  default:
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteGeneratorKeys.authLogin,
                      (route) => false,
                    );
                    break;
                }
              },
            );
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 5),
            curve: Curves.linearToEaseOut,
            width: _logoAnimationWidth,
            child: Image.asset(
              ImagesConstants.artePersaLogo,
              semanticLabel: 'Arte Persa',
              width: 320,
            ),
          ),
        ),
      ),
    );
  }
}
