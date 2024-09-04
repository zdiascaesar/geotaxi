import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_messages_model.dart';
export 'no_messages_model.dart';

class NoMessagesWidget extends StatefulWidget {
  const NoMessagesWidget({super.key});

  @override
  State<NoMessagesWidget> createState() => _NoMessagesWidgetState();
}

class _NoMessagesWidgetState extends State<NoMessagesWidget> {
  late NoMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoMessagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/illustration_default.png',
            width: 275.0,
            height: 275.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            'ettqdgbd' /* Нет сообщений */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
