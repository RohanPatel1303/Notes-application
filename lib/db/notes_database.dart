import 'package:sqflite/sqflite.dart';
import 'package:sqflitefirstproject/model/note.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
class NotesDatabase{
  static final NotesDatabase instance=NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();
 Future<Database> get database async{
   if(_database!=null)
     return _database!;

   _database=await _initDB('notes.db');
   return _database!;
 }
 Future<Database> _initDB(String path_to_file) async{
   final dbPath=await getDatabasesPath();
   final path= join(dbPath,path_to_file);
   return await openDatabase(path,version: 1,onCreate: _createDb);
 }
 Future _createDb(Database db,int version)async{
   final idType='INTEGER PRIMARY KEY AUTOINCREMENT';
   final textType='TEXT NOT NULL';
   final boolType='BOOLEAN NOT NULL';
   final Integer_type="INTEGER NOT NULL";
   await db.execute('''
   CREATE TABLE $tableNotes(
   ${Notefields.id} $idType,
   ${Notefields.title} $textType,
   ${Notefields.description} $textType,
   ${Notefields.time} $textType,
   ${Notefields.isImportant} $boolType,
   ${Notefields.number} $Integer_type
   )
   ''');

 }
  Future<Note> create (Note note) async{
    final db=await instance.database;
    final id=await db.insert(tableNotes,note.toJson());
    return note.copy(id:id);
  }
 Future<Note> readNote(int id) async{
   final db=await instance.database;
   final maps= await db.query(
     tableNotes,
     columns: Notefields.values,
     where: '${Notefields.id} = ?',
     whereArgs: [id],
   );
   if(maps.isNotEmpty){
     return Note.fromJson(maps.first);
   }else{
     throw Exception('Id $id not found');
   }
 }
 Future <List<Note>> readAllNotes() async{
   final db=await instance.database;
   final orderbystring='${Notefields.time} ASC';
   final result =await db.query(tableNotes,orderBy: orderbystring);
   return result.map((json) => Note.fromJson(json)).toList();

 }
 Future<int> update(Note note) async{
   final db=await instance.database;
   return db.update(tableNotes,
   note.toJson(),where: '${Notefields.id}=?',
     whereArgs: [note.id],
   );
 }
 Future<int> delete(int id)async{
   final db=await instance.database;

   return await db.delete(tableNotes,
   where: '${Notefields.id}=?',
   whereArgs: [id],);
 }
 Future close()async{
   final db=await instance.database;
   db.close();
 }
}