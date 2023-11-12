import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.imgList,
    required this.screenHeight,
    required this.screenWidth,
    required this.buttonCarouselController,
  });

  final List<String> imgList;
  final double screenHeight;
  final double screenWidth;
  final CarouselController buttonCarouselController;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: widget.buttonCarouselController,
          items: widget.imgList.asMap().entries.map(
            (entry) {
              final item = entry.value;

              return InkWell(
                onTap: () {
                  final arguments = GalleryFullScreenArguments(item);
                  Navigator.of(context)
                      .pushNamed('/gallery-full-screen', arguments: arguments);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: SizedBox(
                    width: widget.screenWidth,
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            height: widget.screenHeight / 2,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            initialPage: 2,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 50,
          child: IconButton(
            onPressed: () => widget.buttonCarouselController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
        Positioned(
          right: 50,
          child: IconButton(
            onPressed: () => widget.buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut),
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        )
      ],
    );
  }
}

class GalleryFullScreenArguments {
  final String selectedImage;

  GalleryFullScreenArguments(this.selectedImage);
}
