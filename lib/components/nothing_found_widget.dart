import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'nothing_found_model.dart';
export 'nothing_found_model.dart';

class NothingFoundWidget extends StatefulWidget {
  const NothingFoundWidget({super.key});

  @override
  State<NothingFoundWidget> createState() => _NothingFoundWidgetState();
}

class _NothingFoundWidgetState extends State<NothingFoundWidget> {
  late NothingFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NothingFoundModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          'assets/lottie_animations/Animation_-_1725886969004.json',
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 150.0,
          fit: BoxFit.contain,
          animate: true,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'gkzpavwe' /* Ничего не найдено */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ].divide(const SizedBox(height: 6.0)),
    );
  }
}
