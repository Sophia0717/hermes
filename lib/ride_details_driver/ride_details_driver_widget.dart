import '../backend/backend.dart';
import '../components/amenitity_indicator_widget.dart';
import '../edit_ride_1/edit_ride1_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RideDetailsDriverWidget extends StatefulWidget {
  const RideDetailsDriverWidget({
    Key? key,
    this.propertyRef,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;

  @override
  _RideDetailsDriverWidgetState createState() =>
      _RideDetailsDriverWidgetState();
}

class _RideDetailsDriverWidgetState extends State<RideDetailsDriverWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.4,
          end: 1,
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 320,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              widget.propertyRef!.mainImage,
                                              'https://images5.alphacoders.com/882/882969.jpg',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault<String>(
                                            widget.propertyRef!.mainImage,
                                            'https://images5.alphacoders.com/882/882969.jpg',
                                          ),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      widget.propertyRef!.mainImage,
                                      'https://images5.alphacoders.com/882/882969.jpg',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          widget.propertyRef!.mainImage,
                                          'https://images5.alphacoders.com/882/882969.jpg',
                                        ),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.propertyRef!.rideName!,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.propertyRef!.rideLocation!.toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'DESCRIPTION',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            child: Text(
                              widget.propertyRef!.rideDescription!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Ride Tags\n',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
                    child: StreamBuilder<List<AmenititiesRecord>>(
                      stream: queryAmenititiesRecord(
                        queryBuilder: (amenititiesRecord) =>
                            amenititiesRecord.where('propertyRef',
                                isEqualTo: widget.propertyRef!.reference),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitWave(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<AmenititiesRecord>
                            amenitiesRowAmenititiesRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final amenitiesRowAmenititiesRecord =
                            amenitiesRowAmenititiesRecordList.isNotEmpty
                                ? amenitiesRowAmenititiesRecordList.first
                                : null;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (amenitiesRowAmenititiesRecord!.evCharger ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.ev_station,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.pool ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.pool_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.extraOutlets ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.power_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.ac ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.ac_unit_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.dogFriendly ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.pets_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.washer ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.local_laundry_service_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.dryer ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.local_laundry_service_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.workout ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.fitness_center_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.nightLife ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.nightlife,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.hip ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.theater_comedy,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              if (amenitiesRowAmenititiesRecord!.heater ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.wb_sunny_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x55000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$156',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              '+ taxes/fees',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'per rider',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditRide1Widget(
                            propertyRef: widget.propertyRef,
                          ),
                        ),
                      );
                    },
                    text: 'Edit Ride',
                    options: FFButtonOptions(
                      width: 150,
                      height: 50,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
