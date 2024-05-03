// import 'package:dspuiproject/db/note.dart';
// import 'package:dspuiproject/db/notedata.dart';
// import 'package:dspuiproject/db/notes_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:dsp_app/db/note.dart';
// import 'package:dsp_app/db/notes_database.dart';
// import 'package:dsp_app/db/notedata.dart';
//
//
//
// class NotesPage extends StatefulWidget {
//   @override
//   _NotesPageState createState() => _NotesPageState();
// }
//
// class _NotesPageState extends State<NotesPage> {
//   late List<Note> notes;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     refreshNotes();
//   }
//
//   // @override
//   // void dispose() {
//   //   NotesDatabase.instance.close();
//   //
//   //   super.dispose();
//   // }
//
//   Future refreshNotes() async {
//     setState(() => isLoading = true);
//
//     this.notes = await NotesDatabase.instance.readAllNotes();
//
//     setState(() => isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Data',
//         style: TextStyle(fontSize: 24),
//       ),
//       actions: [Icon(Icons.search), SizedBox(width: 12)],
//     ),
//     body: Center(
//       child: isLoading
//           ? CircularProgressIndicator()
//           : notes.isEmpty
//           ? Text(
//         'No Data',
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       )
//           : buildNotes(),
//     ),
//     floatingActionButton: FloatingActionButton(
//       backgroundColor: Colors.black,
//       child: Icon(Icons.add),
//       onPressed: () async {
//         await  addNote();
//         // await Navigator.of(context).push(
//         //   MaterialPageRoute(builder: (context) => VerifyPageTwo()),
//         // );
//
//         refreshNotes();
//       },
//     ),
//   );
//
//   Widget buildNotes() => StaggeredGridView.countBuilder(
//     padding: EdgeInsets.all(8),
//     itemCount: notes.length,
//     staggeredTileBuilder: (index) => StaggeredTile.fit(2),
//     crossAxisCount: 4,
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//     itemBuilder: (context, index) {
//       final note = notes[index];
//
//       return GestureDetector(
//         onTap: () async {
//           // await Navigator.of(context).push(MaterialPageRoute(
//           //   builder: (context) => NoteDetailPage(noteId: note.id!),
//           // ));
//
//           refreshNotes();
//         },
//         child: NoteCardWidget(note: note, index: index),
//       );
//     },
//   );
//
//
//   Future addNote() async {
//     final note = Note(
//       testId: 1,
//       testName: "POTASSIUM, SERUM (B045)",
//       parameterCovered: "parameter",
//       specialPreparation: "special",
//       sampleRequired: "yes required",
//       price: "1",
//       createdTime: DateTime.now(),
//     );
//
//
//     print("new data add");
//     await NotesDatabase.instance.create(note);
//     //Navigator.of(context).pop();
//   }
// }
