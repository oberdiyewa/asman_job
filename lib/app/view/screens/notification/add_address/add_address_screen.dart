import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/services/location_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/notification/add_address/search_from_map.dart';
import 'package:asman_work/app/view/screens/notification/bloc/address_reverse_bloc/address_reverse_bloc.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:asman_work/app/view/screens/search/search_screen.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({
    required this.valueNotifier,
    this.id,
    this.addressId,
    super.key,
  });

  final ValueNotifier<dynamic> valueNotifier;
  final int? id;
  final String? addressId;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late final TextEditingController _textController;
  LatLng? point;

  @override
  void initState() {
    _textController =
        TextEditingController(text: widget.valueNotifier.value as String);
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final throttleOnClick = throttle(1000, () {
      context
          .read<ServiceAddressBloc>()
          .add(ServiceAddressFetchEvent(_textController.text));
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: JobBaseAppbar(
        title: 'Salgy goşmak',
        onBack: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  context.read<ServiceAddressBloc>().add(
                        ServiceAddressAddEvent(
                          ServiceAddress(
                            displayName: _textController.text,
                            title: 'Ish salgym',
                            point: point,
                          ),
                          widget.id!,
                        ),
                      );
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocProvider<AddressReverseBloc>(
        create: (context) => AddressReverseBloc(ServicesRepository()),
        child: Column(
          children: [
            AddSection(
              customHeight: 160,
              widget: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 380.w,
                    child: TextField(
                      controller: _textController,
                      onChanged: (value) {
                        widget.valueNotifier.value = value;
                        if (_textController.text.length >= 3) {
                          throttleOnClick();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Salgyny giriz...',
                        suffixIcon: MaterialButton(
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          clipBehavior: Clip.antiAlias,
                          onPressed: () {
                            _textController.clear();
                            context.read<ServiceAddressBloc>().add(
                                  ServiceAddressClearEvent(),
                                );
                          },
                          shape: const CircleBorder(),
                          child: SvgPicture.asset(Assets.clear),
                        ),
                        hintStyle: TextStyle(
                          color: kcHardGreyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  // Choose from map
                  Padding(
                    padding: REdgeInsets.only(top: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) {
                              context
                                  .read<AddressReverseBloc>()
                                  .add(AddressReverseInitialEvent());
                              return SearchLocationFromMap(
                                id: widget.id!,
                                valueNotifier: widget.valueNotifier,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.map),
                          horizontalSpaceMedium,
                          const Text(
                            'Kartada saýla',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Choose my position
                  BlocConsumer<AddressReverseBloc, AddressReverseState>(
                    listener: (context, state) {
                      if (state is AddressReverseLoaded) {
                        widget.valueNotifier.value = state.address.displayName;
                        setState(() {
                          _textController.text = state.address.displayName;
                          point = state.address.point;
                        });
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          final position =
                              LocationRepository.instance!.currentLocation;
                          context.read<AddressReverseBloc>().add(
                                AddressReverseFetchEvent(
                                  LatLng(
                                    // position!.latitude,
                                    // position.longitude,
                                    37.890875,
                                    58.412073,
                                  ),
                                ),
                              );
                        },
                        child: Container(
                          padding: REdgeInsets.only(top: 16),
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.gps),
                              horizontalSpaceMedium,
                              const Text(
                                'Meniň ýerleşýän ýerim',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<ServiceAddressBloc, ServiceAddressState>(
              builder: (context, state) {
                if (state is ServiceAddressLoaded) {
                  final addressList = state.addressList;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView(
                        shrinkWrap: true,
                        children: List.generate(
                          addressList.length,
                          (index) {
                            final address = addressList[index];
                            return ListTile(
                              onTap: () {
                                point = address.point;
                                _textController.text = address.displayName;
                                widget.valueNotifier.value =
                                    address.displayName;
                              },
                              title: Text(
                                addressList[index].displayName,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
