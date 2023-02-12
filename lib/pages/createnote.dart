import 'package:flutter/material.dart';
import 'package:sqflitefirstproject/db/notes_database.dart';
import 'package:sqflitefirstproject/model/note.dart';
import 'package:get/get.dart';
import 'package:sqflitefirstproject/pages/notepage.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  late String title="";
  late String description="";

  Future addNote()async{
    final note=Note(isImportant: true,
        number: 1,
        title: title,
        description: description,
        createdTime: DateTime.now()
    );
    await NotesDatabase.instance.create(note);
    print("Hello The Date is Saved");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
         actions: [

           GestureDetector(
             onTap: ()=>{
               Get.offAll(NotesHome()),
               addNote(),
             },
               child:
               Padding(
                 padding: const EdgeInsets.only(right: 20),
                 child: Icon(Icons.check),
               )
           )
         ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(border:InputBorder.none,hintText: "Title",hintStyle: TextStyle(color: Colors.yellow) ),
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
                decoration: InputDecoration(border:InputBorder.none ,hintText: "Start Shaping Your Ideas"),
                // style: TextStyle(color: Colors.yellow),
                maxLines: null,
                initialValue: description,
                onChanged: (text)=>{
                  description=text
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
