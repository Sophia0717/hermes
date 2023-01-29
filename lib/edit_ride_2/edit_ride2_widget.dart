import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/amenitity_indicator_widget.dart';
import '../edit_ride_3/edit_ride3_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRide2Widget extends StatefulWidget {
  const EditRide2Widget({
    Key? key,
    this.propertyRef,
    this.propertyAmenities,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;
  final AmenititiesRecord? propertyAmenities;

  @override
  _EditRide2WidgetState createState() => _EditRide2WidgetState();
}

class _EditRide2WidgetState extends State<EditRide2Widget> {
  bool? amenityACValue;
  bool? amenityHeatingValue;
  bool? amenityPetsValue;
  bool? amenityPoolValue1;
  bool? amenityPoolValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Property',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: StreamBuilder<AmenititiesRecord>(
            stream: AmenititiesRecord.getDocument(
                widget.propertyAmenities!.reference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitWave(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              final columnAmenititiesRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'CHOOSE YOUR AMENITIES',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: FaIcon(
                                      FontAwesomeIcons.paw,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    borderColor: Color(0xFFE1EDF9),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: amenityACValue ??=
                                        widget.propertyAmenities!.dogFriendly!,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => amenityACValue = newValue!);
                                    },
                                    title: Text(
                                      'Pet Friendly',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: FaIcon(
                                      FontAwesomeIcons.dog,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    borderColor: Color(0xFFE1EDF9),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: amenityHeatingValue ??=
                                        widget.propertyAmenities!.dogFriendly!,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          amenityHeatingValue = newValue!);
                                    },
                                    title: Text(
                                      'Dog Friendly',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: FaIcon(
                                      FontAwesomeIcons.cat,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    borderColor: Color(0xFFE1EDF9),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: amenityPetsValue ??=
                                        widget.propertyAmenities!.dogFriendly!,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => amenityPetsValue = newValue!);
                                    },
                                    title: Text(
                                      'Cat Friendly',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: FaIcon(
                                      FontAwesomeIcons.female,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    borderColor: Color(0xFFE1EDF9),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: amenityPoolValue1 ??=
                                        widget.propertyAmenities!.hip!,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => amenityPoolValue1 = newValue!);
                                    },
                                    title: Text(
                                      'Female Only',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.looks_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                  Expanded(
                                    child: SwitchListTile.adaptive(
                                      value: amenityPoolValue2 ??=
                                          widget.propertyAmenities!.nightLife!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            amenityPoolValue2 = newValue!);
                                      },
                                      title: Text(
                                        'LGBTQ+ Friendly',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      activeTrackColor: Color(0xFF392BBA),
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 8, 0, 8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STEP',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              '2/3',
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                          ],
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            final amenititiesUpdateData =
                                createAmenititiesRecordData(
                              ac: amenityACValue,
                              heater: amenityHeatingValue,
                              dogFriendly: amenityPetsValue,
                              hip: amenityPoolValue1,
                              nightLife: amenityPoolValue2,
                            );
                            await widget.propertyAmenities!.reference
                                .update(amenititiesUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditRide3Widget(
                                  propertyRef: widget.propertyRef,
                                ),
                              ),
                            );
                          },
                          text: 'NEXT',
                          options: FFButtonOptions(
                            width: 120,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
