import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'registration_three_page_model.dart';
export 'registration_three_page_model.dart';

class RegistrationThreePageWidget extends StatefulWidget {
  const RegistrationThreePageWidget({super.key});

  @override
  State<RegistrationThreePageWidget> createState() =>
      _RegistrationThreePageWidgetState();
}

class _RegistrationThreePageWidgetState
    extends State<RegistrationThreePageWidget> {
  late RegistrationThreePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationThreePageModel());

    _model.modelCarTextController ??= TextEditingController();
    _model.modelCarFocusNode ??= FocusNode();

    _model.typeCarTextController ??= TextEditingController();
    _model.typeCarFocusNode ??= FocusNode();

    _model.numberCarTextController ??= TextEditingController();
    _model.numberCarFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'vzhvo1hh' /* Данные авто */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFF1C1C1E),
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/image5.png',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 20.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'zq49mkbw' /* Заполните данные авто */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: _model.modelCarTextController,
                          focusNode: _model.modelCarFocusNode,
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'fd2w14p6' /* Модель */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0x6614181B),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD5DDE0),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.modelCarTextControllerValidator
                              .asValidator(context),
                        ),
                        TextFormField(
                          controller: _model.typeCarTextController,
                          focusNode: _model.typeCarFocusNode,
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'rneks1ay' /* Марка */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0x6614181B),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD5DDE0),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.typeCarTextControllerValidator
                              .asValidator(context),
                        ),
                        TextFormField(
                          controller: _model.numberCarTextController,
                          focusNode: _model.numberCarFocusNode,
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '0tjh1bf9' /* Номер */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0x6614181B),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD5DDE0),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.numberCarTextControllerValidator
                              .asValidator(context),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              imageQuality: 50,
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 42.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F8F9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FFIcons.kdoc1,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      () {
                                        if (_model.isDataUploading) {
                                          return () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return 'Uploading...';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'ru') {
                                              return 'Идет загрузка...';
                                            } else {
                                              return 'Yükleniyor...';
                                            }
                                          }();
                                        } else if (_model.uploadedFileUrl != '') {
                                          return () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return 'Document uploaded';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'ru') {
                                              return 'Документ загружен';
                                            } else {
                                              return 'Doküman yüklendi';
                                            }
                                          }();
                                        } else {
                                          return () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return 'Upload document';
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'ru') {
                                              return 'Загрузить документ';
                                            } else {
                                              return 'Belgeyi yükle';
                                            }
                                          }();
                                        }
                                      }(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  if (_model.uploadedFileUrl != '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await FirebaseStorage.instance
                                            .refFromURL(_model.uploadedFileUrl)
                                            .delete();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              'Удалено',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        FFIcons.kmultiply,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().role = 1;
                      setState(() {});

                      context.goNamed('HomePage');
                    },
                    text: FFLocalizations.of(context).getText(
                      'r3cdny1t' /* Далее */,
                    ),
                    options: FFButtonOptions(
                      height: 42.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
          ),
        ),
      ),
    );
  }
}
