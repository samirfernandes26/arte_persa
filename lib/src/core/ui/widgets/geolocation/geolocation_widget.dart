import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/core/ui/widgets/app_loader.dart';
import 'package:arte_persa/src/core/ui/widgets/geolocation/geolocation_state.dart';
import 'package:arte_persa/src/core/ui/widgets/geolocation/geolocation_vm.dart';

class GeolocationWidget extends ConsumerStatefulWidget {
  const GeolocationWidget({
    super.key,
    required this.onPosition,
    this.initialValue,
    this.canSearchLocation = true,
  });

  final void Function(Position? position) onPosition;
  final Map<String, dynamic>? initialValue;
  final bool canSearchLocation;

  @override
  ConsumerState<GeolocationWidget> createState() => _GeolocationWidgetState();
}

class _GeolocationWidgetState extends ConsumerState<GeolocationWidget> {
  @override
  Widget build(BuildContext context) {
    final GeolocationVm(
      :refresh,
      :reset,
      :setLoaded,
    ) = ref.read(geolocationVmProvider.notifier);

    final geolocationVm = ref.watch(geolocationVmProvider);

    if (geolocationVm.status == GeolocationStatus.initial &&
        widget.canSearchLocation) {
      Future(() async {
        await refresh();
      });
    } else {
      Future(() async {
        await setLoaded();
      });
    }

    ref.listen(geolocationVmProvider, (_, state) async {
      switch (state.status) {
        case GeolocationStatus.initial:
          await refresh();
        case GeolocationStatus.error:
          Messages.showErrors(state.message!, context);
        case GeolocationStatus.success:
          widget.onPosition(state.position);
        case GeolocationStatus.loaded:
      }
    });

    if (widget.canSearchLocation == true) {
      return GetGeolocationWidget(
        geolocationVm: geolocationVm,
        widget: widget,
        reset: reset,
      );
    }

    return ShowGeolocationWidget(
      initialValue: widget.initialValue,
    );
  }
}

class GetGeolocationWidget extends StatelessWidget {
  const GetGeolocationWidget({
    super.key,
    required this.geolocationVm,
    required this.widget,
    required this.reset,
  });

  final GeolocationState geolocationVm;
  final GeolocationWidget widget;
  final void Function() reset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Visibility(
        visible: geolocationVm.status != GeolocationStatus.initial,
        replacement: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Color(0xFFC6C6C6),
                  spreadRadius: -5,
                  offset: Offset(0, 10),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AppLoader(size: 32),
              const SizedBox(width: 16),
              AutoSizeText(
                'Carregando informações de geolocalização',
                maxFontSize:
                    Theme.of(context).textTheme.titleMedium?.fontSize ?? 16,
              )
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Color(0xFFC6C6C6),
                  spreadRadius: -5,
                  offset: Offset(0, 10),
                ),
              ]),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Icon(
                  Icons.pin_drop,
                  color: geolocationVm.position != null
                      ? Colors.blueAccent
                      : Colors.redAccent,
                  size: 32,
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: geolocationVm.position != null,
                  replacement: Text(
                    'Não foi possível obter a localização',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.redAccent,
                        ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Latitude: ${geolocationVm.position?.latitude}',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('Longitude: ${geolocationVm.position?.longitude}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  reset();
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowGeolocationWidget extends StatelessWidget {
  final Map<String, dynamic>? initialValue;

  const ShowGeolocationWidget({super.key, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Color(0xFFC6C6C6),
                spreadRadius: -5,
                offset: Offset(0, 10),
              ),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16.0),
              child: Icon(
                Icons.pin_drop,
                color:
                    initialValue != null ? Colors.blueAccent : Colors.redAccent,
                size: 32,
              ),
            ),
            Expanded(
              child: Visibility(
                visible: initialValue != null,
                replacement: Text(
                  'Não foi possível obter a localização',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.redAccent,
                      ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Latitude: ${initialValue?['latitude']}',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Longitude: ${initialValue?['longitude']}',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
