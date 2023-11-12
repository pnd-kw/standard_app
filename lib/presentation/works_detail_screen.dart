import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:standard_app/model/building_model.dart';
import 'package:standard_app/presentation/widgets/image_slider.dart';

class WorksDetailScreen extends StatefulWidget {
  const WorksDetailScreen({super.key});

  @override
  State<WorksDetailScreen> createState() => _WorksDetailScreenState();
}

class _WorksDetailScreenState extends State<WorksDetailScreen> {
  bool readMore = false;
  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final building = ModalRoute.of(context)!.settings.arguments as Building;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: screenHeight / 2,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  child: Image.asset(
                    building.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: screenHeight / 10,
                            width: screenWidth,
                            child: Text(
                              building.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Text(
                                  building.desc,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                  textAlign: TextAlign.justify,
                                  maxLines: readMore ? null : 5,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              if (!readMore && building.desc.length > 200)
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      readMore = true;
                                    });
                                  },
                                  child: Text(
                                    'Read more',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'DETAILS',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            building.detail,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'TEAM',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            building.team,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'IMAGE GALLERY',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        ImageSlider(
                          imgList: building.imgList,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          buttonCarouselController: buttonCarouselController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
