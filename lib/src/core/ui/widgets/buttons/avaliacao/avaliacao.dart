import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Avaliacao extends StatelessWidget {
  const Avaliacao({
    super.key,
    required this.initialValue,
    required this.desable,
    required this.onChanged,
  });

  final double initialValue;
  final bool desable;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: RatingBar.builder(
        initialRating: initialValue,
        minRating: 0.5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        unratedColor: Colors.amber.withAlpha(50),
        itemPadding: const EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          onChanged(rating);
        },
        updateOnDrag: false,
        ignoreGestures: desable,
      ),
    );
  }
}
