import 'package:arte_persa/src/screens/splash/splash_screen_vm.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Future<SplashState> _initialStateFuture;
  bool _redirected = false;

  @override
  void initState() {
    super.initState();
    _initialStateFuture = SplashScreenVm().loadInitialState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF102542),
              Color(0xFF1E3A5F),
              Color(0xFFF6E7CB),
            ],
          ),
        ),
        child: Center(
          child: FutureBuilder<SplashState>(
            future: _initialStateFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _redirect(snapshot.data!);
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.24),
                      ),
                    ),
                    child: const Text(
                      'Arte Persa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CircularProgressIndicator(color: Colors.white),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
