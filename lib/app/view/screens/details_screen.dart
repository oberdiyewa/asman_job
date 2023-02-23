import 'dart:async';

import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/screens/home/components/draggable_scrollable_sheet/draggable_entity_detail.dart';
import 'package:asman_work/app/view/screens/home/components/map_widget.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.publicEntity,
    required this.isVacancy,
    super.key,
  });

  final PublicEntity publicEntity;
  final bool isVacancy;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 200), () {
      MapService.instance.moveDelegate!(widget.publicEntity.point, 13);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const MapWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).iconTheme.color,
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            // const MapHeaderWidget(),
            DraggableEntityDetail(
              id: widget.publicEntity.id,
              isVacancy: widget.isVacancy,
            )
          ],
        ),
      ),
    );
  }
}
