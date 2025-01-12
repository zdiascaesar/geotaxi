import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeliveryBottomSheetWidget extends StatefulWidget {
  const DeliveryBottomSheetWidget({
    super.key,
    required this.newRide,
  });

  final RidesRecord? newRide;

  @override
  State<DeliveryBottomSheetWidget> createState() =>
      _DeliveryBottomSheetWidgetState();
}

class _DeliveryBottomSheetWidgetState extends State<DeliveryBottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _senderPhoneController = TextEditingController();
  final TextEditingController _recipientPhoneController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool _doorToDoor = false;

  @override
  void dispose() {
    _senderPhoneController.dispose();
    _recipientPhoneController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return FFLocalizations.of(context).getText('phone_required');
    }
    if (value.length < 10 || value.length > 15) {
      return FFLocalizations.of(context).getText('invalid_phone');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                  child: Container(
                    width: 30.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText('delivery_details'),
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _senderPhoneController,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText('sender_phone'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: _validatePhone,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _recipientPhoneController,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText('recipient_phone'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: _validatePhone,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText('delivery_comment'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              SwitchListTile(
                value: _doorToDoor,
                onChanged: (bool value) {
                  setState(() {
                    _doorToDoor = value;
                  });
                },
                title: Text(
                  FFLocalizations.of(context).getText('door_to_door'),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                activeColor: FlutterFlowTheme.of(context).primary,
              ),
              const SizedBox(height: 16.0),
              FFButtonWidget(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await widget.newRide!.reference.update({
                      'order_type': 1, // 1 for delivery
                      'sender_phone': _senderPhoneController.text,
                      'recipient_phone': _recipientPhoneController.text,
                      'delivery_comment': _commentController.text,
                      'door_to_door': _doorToDoor,
                      'status': 0,
                      'cost': 15.0, // Default delivery cost
                      'cancelled': false,
                      'finished': false,
                      'ready_to_pickup': false,
                      'created_at': getCurrentTimestamp,
                    });

                    // Clear app state
                    FFAppState().fromWhere = null;
                    FFAppState().toWhere = null;
                    FFAppState().addressFromMap = '';
                    FFAppState().addressToMap = '';

                    if (context.mounted) {
                      context.goNamed(
                        'Client2',
                        queryParameters: {
                          'findingDriver': serializeParam(
                            widget.newRide?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    }
                  }
                },
                text: FFLocalizations.of(context).getText('order_delivery'),
                options: FFButtonOptions(
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
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
