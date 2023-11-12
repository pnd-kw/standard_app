import 'package:flutter/material.dart';
import 'package:standard_app/model/building_list.dart';

class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Works',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: buildingList.length,
            itemBuilder: (context, categoryIndex) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/works-detail-screen',
                      arguments: buildingList[categoryIndex]);
                },
                child: SizedBox(
                  height: screenHeight / 2,
                  width: double.infinity,
                  child: Image.asset(
                    buildingList[categoryIndex].image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
