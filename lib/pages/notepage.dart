import 'package:flutter/material.dart';
import 'package:sqflitefirstproject/constants/imagepaths.dart';
import 'package:sqflitefirstproject/db/notes_database.dart';
import 'package:sqflitefirstproject/model/note.dart';
import 'package:get/get.dart';
import 'package:sqflitefirstproject/pages/createnote.dart';
import 'package:sqflitefirstproject/pages/editnote.dart';
class NotesHome extends StatefulWidget {
  const NotesHome({Key? key}) : super(key: key);
  @override
  State<NotesHome> createState() => _NotesHomeState();
}
class _NotesHomeState extends State<NotesHome> {
  late List <Note> notes=[];
  @override
  void initState(){
    super.initState();
    fetchNotes();
  }
  Future fetchNotes()async{
    this.notes=await NotesDatabase.instance.readAllNotes();
    print(notes);
    setState(() {});

  }
  Widget build(BuildContext context) {
    bool isDarkMode=MediaQuery.of(context).platformBrightness == Brightness.dark;;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode?Colors.black:Colors.white,
        // color: Theme.of(context).brightness=Brightness.light?Colors.white:Colors.black,
        image: const DecorationImage(
          image: AssetImage(bgimg),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("Notes"),),
        body: Container(
          // color: isDarkMode?Colors.black:Colors.grey,
          padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
          child: notes != []
              ?ListView.builder(
            itemCount: notes.length,
              itemBuilder: (BuildContext context ,int index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: ()=>{
                      Get.to(Editnote(),arguments: notes[index].id)
                    },
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      shadowColor: isDarkMode?Colors.white:Colors.black,
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        tileColor: isDarkMode?Colors.black12:Colors.white,
                        title:Text(notes[index].title),
                        subtitle: Text(notes[index].description),
                      ),
                    ),
                  ),
                );
          }
          )
            : const Text("No Data Found"),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{
            Get.to(CreateNote())
          },
          elevation: 5,
          child: Icon(Icons.add),
        ),
      )
    );
  }
}
