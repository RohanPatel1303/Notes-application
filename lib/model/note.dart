final String tableNotes='notes';
class Notefields{
  static final List<String> values=[
    id,isImportant,number,title,description,time
  ];
  static final String id="_id";
  static final String isImportant="isImportant";
  static final String number="number";
  static final String title="title";
  static final String description="description";
  static final String time="time";

}
class Note{
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime
});
  Map<String, Object?> toJson()=>{
    Notefields.id:id,
    Notefields.description:description,
    Notefields.number:number,
    Notefields.title:title,
    Notefields.isImportant:isImportant?1:0,
    Notefields.time:createdTime.toIso8601String()
  };
  static Note fromJson(Map<String,Object?>json)=>Note(
    id: json[Notefields.id] as int?,
      isImportant: json[Notefields.isImportant]==1,
      number: json[Notefields.number] as int,
      title: json[Notefields.title] as String,
      description:json[Notefields.description]as String,
      createdTime: DateTime.parse(json[Notefields.time] as String)
  );
  Note copy({
    int? id,
    bool?isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  })=>Note(
      id:id??this.id,
      isImportant: isImportant??this.isImportant,
      number: number??this.number,
      title: title??this.title,
      description: description??this.description,
      createdTime: createdTime??this.createdTime
  );

}