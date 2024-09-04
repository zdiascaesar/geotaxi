import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'client_loading_component_model.dart';
export 'client_loading_component_model.dart';

class ClientLoadingComponentWidget extends StatefulWidget {
  const ClientLoadingComponentWidget({
    super.key,
    required this.rideUid,
    required this.page,
  });

  final String? rideUid;
  final int? page;

  @override
  State<ClientLoadingComponentWidget> createState() =>
      _ClientLoadingComponentWidgetState();
}

class _ClientLoadingComponentWidgetState
    extends State<ClientLoadingComponentWidget> {
  late ClientLoadingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientLoadingComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      _model.rideUpdate = await queryRidesRecordOnce(
        queryBuilder: (ridesRecord) => ridesRecord.where(
          'uid',
          isEqualTo: widget.rideUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.rideUpdate?.status == 9) {
        context.pushNamed(
          'Client7',
          queryParameters: {
            'notFound': serializeParam(
              _model.rideUpdate?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      } else {
        if (widget.page == 3) {
          context.pushNamed(
            'Client4',
            queryParameters: {
              'foundDriver': serializeParam(
                _model.rideUpdate?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        } else {
          context.pushNamed(
            'Client5',
            queryParameters: {
              'ridePayment': serializeParam(
                _model.rideUpdate?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        }
      }

      Navigator.pop(context);
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
