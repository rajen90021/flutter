
final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id,testId,testName, parameterCovered,specialPreparation,sampleRequired,price,createdtime];


  static final String id = '_id';
  static final String testId = 'testId';
  static final String testName = 'testName';
  static final String parameterCovered = 'parameterCovered';
  static final String specialPreparation = 'specialPreparation';
  static final String sampleRequired = 'sampleReqiured';
  static final String price = 'price';
  static final String createdtime = 'time';
}

class Note {
  final int? id;
  final int? testId;
  final String testName;
  final String parameterCovered;
  final String specialPreparation;
  final String sampleRequired;
  final String price;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.testId,
    required this.testName,
    required this.parameterCovered,
    required this.specialPreparation,
    required this.sampleRequired,
    required this.price,
    required this.createdTime,
  });

  Note copy({
    int? id,
    int? testId,
    String? testName,
    String? parameterCovered,
    String? specialPreparation,
    String? sampleRequired,
    String? price,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        testId:testId?? this.testId,
        testName: testName ?? this.testName,
        parameterCovered: parameterCovered ?? this.parameterCovered,
        specialPreparation: specialPreparation ?? this.specialPreparation,
        sampleRequired: sampleRequired ?? this.sampleRequired,
        price: price ?? this.price,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    testId: json[NoteFields.testId] as int?,
    testName: json[NoteFields.testName] as String,
    parameterCovered: json[NoteFields.parameterCovered] as String,
    specialPreparation: json[NoteFields.specialPreparation] as String,
    sampleRequired: json[NoteFields.sampleRequired] as String,
    price: json[NoteFields.price] as String,
    createdTime: DateTime.parse(json[NoteFields.createdtime] as String),
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.testId: testId,
    NoteFields.testName: testName,
    NoteFields.parameterCovered: parameterCovered,
    NoteFields.specialPreparation: specialPreparation,
    NoteFields.sampleRequired: sampleRequired,
    NoteFields.price: price,
    NoteFields.createdtime: createdTime.toIso8601String(),
  };
}
