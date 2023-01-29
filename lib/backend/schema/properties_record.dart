import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'properties_record.g.dart';

abstract class PropertiesRecord
    implements Built<PropertiesRecord, PropertiesRecordBuilder> {
  static Serializer<PropertiesRecord> get serializer =>
      _$propertiesRecordSerializer;

  String? get mainImage;

  bool? get isDraft;

  DocumentReference? get userRef;

  double? get ratingSummary;

  int? get price;

  double? get taxRate;

  int? get cleaningFee;

  String? get notes;

  double? get minNightStay;

  DateTime? get lastUpdated;

  int? get minNights;

  bool? get isLive;

  String? get rideName;

  String? get rideDescription;

  LatLng? get rideLocation;

  String? get rideAddress;

  String? get rideNeighorhood;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PropertiesRecordBuilder builder) => builder
    ..mainImage = ''
    ..isDraft = false
    ..ratingSummary = 0.0
    ..price = 0
    ..taxRate = 0.0
    ..cleaningFee = 0
    ..notes = ''
    ..minNightStay = 0.0
    ..minNights = 0
    ..isLive = false
    ..rideName = ''
    ..rideDescription = ''
    ..rideAddress = ''
    ..rideNeighorhood = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('properties');

  static Stream<PropertiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PropertiesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PropertiesRecord._();
  factory PropertiesRecord([void Function(PropertiesRecordBuilder) updates]) =
      _$PropertiesRecord;

  static PropertiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPropertiesRecordData({
  String? mainImage,
  bool? isDraft,
  DocumentReference? userRef,
  double? ratingSummary,
  int? price,
  double? taxRate,
  int? cleaningFee,
  String? notes,
  double? minNightStay,
  DateTime? lastUpdated,
  int? minNights,
  bool? isLive,
  String? rideName,
  String? rideDescription,
  LatLng? rideLocation,
  String? rideAddress,
  String? rideNeighorhood,
}) {
  final firestoreData = serializers.toFirestore(
    PropertiesRecord.serializer,
    PropertiesRecord(
      (p) => p
        ..mainImage = mainImage
        ..isDraft = isDraft
        ..userRef = userRef
        ..ratingSummary = ratingSummary
        ..price = price
        ..taxRate = taxRate
        ..cleaningFee = cleaningFee
        ..notes = notes
        ..minNightStay = minNightStay
        ..lastUpdated = lastUpdated
        ..minNights = minNights
        ..isLive = isLive
        ..rideName = rideName
        ..rideDescription = rideDescription
        ..rideLocation = rideLocation
        ..rideAddress = rideAddress
        ..rideNeighorhood = rideNeighorhood,
    ),
  );

  return firestoreData;
}
