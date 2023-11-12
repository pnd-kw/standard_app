import 'package:flutter/material.dart';
import 'package:standard_app/presentation/widgets/image_slider.dart';

class GalleryFullScreen extends StatelessWidget {
  const GalleryFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as GalleryFullScreenArguments;

    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Image.asset(
            arguments.selectedImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
