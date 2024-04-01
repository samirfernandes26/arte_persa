import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/core/ui/app_nav_global_key.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/geolocation/geolocation_state.dart';

part 'geolocation_vm.g.dart';

@riverpod
class GeolocationVm extends _$GeolocationVm {
  @override
  GeolocationState build() => GeolocationState.initial();

  bool isShowing = false;

  void reset() {
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    final hasPermission =
        await ref.read(geolocationServiceProvider).checkPermission();

    if (![
      LocationPermission.always,
      LocationPermission.whileInUse,
    ].contains(hasPermission)) {
      final context = AppNavGlobalKey.instance.navKey.currentContext!;

      if (context.mounted && !isShowing) {
        isShowing = true;

        final canRequest = await showDialog(
          context: context,
          builder: (context) => PopScope(
            canPop: false,
            onPopInvoked: (canPop) {
              if (canPop) {
                return;
              }
            },
            child: Dialog.fullscreen(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagesConstants.artePersaLogo,
                      width: 320,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Deseja utilizar sua localização.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      HelpersConstants.localizacaoDescricao,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        if (canRequest) {
          isShowing = false;
          await getPosition();
        }
      }
    } else {
      await getPosition();
    }
  }

  /// initialValue é um Map<String, dynamic> onde latitude e longitude são obrigatórios
  Future<void> setLoaded() async {
    state = state.copyWith(
      status: GeolocationStatus.loaded,
      position: null,
      message: null,
    );
  }

  Future<void> getPosition() async {
    final response = await ref.read(geolocationServiceProvider).execute();

    switch (response) {
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: GeolocationStatus.error,
          message: message,
        );
      case Success(value: final position):
        state = state.copyWith(
          status: GeolocationStatus.success,
          position: position,
          message: null,
        );
    }
  }
}
