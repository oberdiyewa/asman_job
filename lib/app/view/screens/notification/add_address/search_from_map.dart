import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/location_bloc/location_bloc.dart';
import 'package:asman_work/app/view/screens/home/components/map_widget.dart';
import 'package:asman_work/app/view/screens/notification/bloc/address_reverse_bloc/address_reverse_bloc.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class SearchLocationFromMap extends StatelessWidget {
  const SearchLocationFromMap({
    required this.id,
    required this.valueNotifier,
    super.key,
  });
  final int id;
  final ValueNotifier<dynamic> valueNotifier;

  @override
  Widget build(BuildContext context) {
    MapService.instance.selectedPoint.value = null;
    final textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: JobBaseAppbar(
        title: 'Salgy goşmak',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          const MapWidget(
            forChoosingAddress: true,
          ),
          appBarBottom(textEditingController),
          BlocBuilder<AddressReverseBloc, AddressReverseState>(
            builder: (context, state) {
              var sizeFromTop = 15.0;
              if (state is AddressReverseLoaded) {
                sizeFromTop = 75.0;
              }
              return Positioned(
                top: sizeFromTop,
                right: 15,
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    final location =
                        (locationState as LocationLoadSuccess).position;
                    return GestureDetector(
                      onTap: () {
                        MapService.instance.moveDelegate!(
                          LatLng(location.latitude, location.longitude),
                          14,
                        );
                      },
                      child: circleContainer(
                        widget: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.gps),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: MapService.instance.selectedPoint,
            builder: (context, value, child) {
              final disabled = value == null;
              return Positioned(
                bottom: 10,
                right: 55,
                left: 55,
                child: BlocBuilder<AddressReverseBloc, AddressReverseState>(
                  builder: (context, reverseAddressState) {
                    return BlocConsumer<ServiceAddressBloc,
                        ServiceAddressState>(
                      listener: (context, state) {
                        if (state is ServiceAddressAddSuccess) {
                          valueNotifier.value = textEditingController.text;
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        final busy =
                            reverseAddressState is AddressReverseLoading ||
                                state is ServiceAddressLoading;
                        return BoxButton.block(
                          title: 'Tassykla',
                          disabled: disabled,
                          busy: busy,
                          onTap: (busy || disabled)
                              ? null
                              : () {
                                  print('basyldy...........');
                                  if (reverseAddressState
                                      is AddressReverseLoaded) {
                                    context.read<ServiceAddressBloc>().add(
                                          ServiceAddressAddEvent(
                                            ServiceAddress(
                                              displayName: reverseAddressState
                                                  .address.displayName,
                                              title: 'Ish salgym',
                                              point: reverseAddressState
                                                  .address.point,
                                            ),
                                            id,
                                          ),
                                        );
                                  }
                                },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget appBarBottom(TextEditingController textEditingController) {
    return BlocBuilder<AddressReverseBloc, AddressReverseState>(
      builder: (context, state) {
        if (state is AddressReverseLoaded) {
          textEditingController.text = state.address.displayName;
          return Positioned(
            top: 0,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Container circleContainer({
    required Widget widget,
    Color? color = Colors.white,
  }) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: widget,
    );
  }
}
