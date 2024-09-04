import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'driver_loading_component_model.dart';
export 'driver_loading_component_model.dart';

class DriverLoadingComponentWidget extends StatefulWidget {
  const DriverLoadingComponentWidget({
    super.key,
    required this.uid,
    required this.page,
  });

  final String? uid;
  final int? page;

  @override
  State<DriverLoadingComponentWidget> createState() =>
      _DriverLoadingComponentWidgetState();
}

class _DriverLoadingComponentWidgetState
    extends State<DriverLoadingComponentWidget> {
  late DriverLoadingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverLoadingComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      _model.rideUpdates = await queryRidesRecordOnce(
        queryBuilder: (ridesRecord) => ridesRecord.where(
          'uid',
          isEqualTo: widget.uid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.rideUpdates?.status == 9) {
        context.goNamed(
          'Driver5',
          queryParameters: {
            'foundRide': serializeParam(
              _model.rideUpdates?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      } else {
        if (widget.page == 3) {
          context.goNamed(
            'Driver4',
            queryParameters: {
              'foundRide': serializeParam(
                _model.rideUpdates?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        } else {
          context.goNamed(
            'Driver5',
            queryParameters: {
              'foundRide': serializeParam(
                _model.rideUpdates?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Lottie.asset(
        'assets/lottie_animations/Animation_-_1723992211016.json',
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        fit: BoxFit.contain,
        animate: true,
      ),
    );
  }
}
