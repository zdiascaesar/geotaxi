import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'on_boarding_component_model.dart';
export 'on_boarding_component_model.dart';

class OnBoardingComponentWidget extends StatefulWidget {
  const OnBoardingComponentWidget({
    super.key,
    required this.title,
    required this.descitpion,
    required this.action,
    required this.pageNumber,
    required this.image,
  });

  final String? title;
  final String? descitpion;
  final Future Function()? action;
  final int? pageNumber;
  final String? image;

  @override
  State<OnBoardingComponentWidget> createState() =>
      _OnBoardingComponentWidgetState();
}

class _OnBoardingComponentWidgetState extends State<OnBoardingComponentWidget> {
  late OnBoardingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardingComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Builder(
            builder: (context) {
              if (widget.pageNumber == 1) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/-2.png',
                    fit: BoxFit.contain,
                  ),
                );
              } else if (widget.pageNumber == 2) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Frame_1061-2.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Frame_1063-2.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 82.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Title',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 60.0),
            child: Text(
              valueOrDefault<String>(
                widget.descitpion,
                'Description',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0x9914181B),
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                await widget.action?.call();
              },
              text: FFLocalizations.of(context).getText(
                'fydzxjly' /* Дальше */,
              ),
              options: FFButtonOptions(
                width: 174.0,
                height: 42.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
