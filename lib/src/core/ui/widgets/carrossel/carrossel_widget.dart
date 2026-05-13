import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarrosselWidget extends StatefulWidget {
  final List<Widget> cards;

  const CarrosselWidget({super.key, required this.cards});

  @override
  State<CarrosselWidget> createState() => _CarrosselWidgetState();
}

class _CarrosselWidgetState extends State<CarrosselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: false,
            autoPlay: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.cards,
        ),
        const SizedBox(height: 4),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.cards.length,
          effect: const WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.white,
            dotColor: Colors.white54,
          ),
        ),
      ],
    );
  }
}
