import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitefirstproject/db/notes_database.dart';
import 'package:sqflitefirstproject/model/note.dart';
import 'package:sqflitefirstproject/pages/notepage.dart';

class Editnote extends StatefulWidget {
  const Editnote({Key? key}) : super(key: key);

  @override
  State<Editnote> createState() => _EditnoteState();
}

class _EditnoteState extends State<Editnote> {
  late Note note;
  late  String? title="Loading";
  late String? description="Loading";
  bool isLoading=false;
  @override
  void initState(){
    super.initState();
    fetchNotes();
  }
  Future fetchNotes()async{
    setState(() {
      isLoading=true;
    });
    note=await NotesDatabase.instance.readNote(Get.arguments);
    setState(() {
      title=note.title;
      description=note.description;
    });
    setState(() {
      isLoading=false;
    });
  }
Future updatenote()async{
    note=note.copy(title: title,description: description,createdTime:DateTime.now());
    await NotesDatabase.instance.update(note);
    Get.offAll(NotesHome());
}
Future deletenotes()async{
    // note=note.copy(title: title,description: description,createdTime:DateTime.now());
    await NotesDatabase.instance.delete(Get.arguments);
    Get.offAll(NotesHome());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          GestureDetector(
            onTap: ()=>{
              deletenotes()
            },
              child: Icon(Icons.delete,size: 35,)
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: ()=>{
              updatenote()
            },
              child: Icon(Icons.save,size: 35,)),
          SizedBox(width: 10,),

        ],
      ),
      body: isLoading?Center(child: CircularProgressIndicator(),)
          :Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(border:InputBorder.none ),
              style: TextStyle(color: Colors.yellow),
              maxLines: null,
              initialValue: title,
              onChanged: (text)=>{
                title=text
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(border:InputBorder.none ),
              // style: TextStyle(color: Colors.yellow),
              maxLines: null,
              initialValue: description,
              onChanged: (text)=>{
                description=text
              },
            ),
          ],
        ),

      )
    );
  }
}
