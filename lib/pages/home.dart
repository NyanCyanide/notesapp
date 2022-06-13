import 'package:flutter/material.dart';
import 'package:notesapp/db/database.dart';
import 'package:notesapp/models/note_model.dart';
import 'dart:math';

const colors = [
  Color(0xFF9FF1A2),
  Color(0xFFE4E762),
  Color(0xFFE08D8D),
  Color(0xFF9FC8E7)
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool keyboardOpen = false;
  bool openPinned = true;
  bool openNotes = true;
  TextEditingController searchText = TextEditingController();

  late List notes;

  @override
  void initState() {
    notes = getNotes();
    super.initState();
  }

  List getNotes() {
    return ([
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This is my first flutter app',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString()),
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This ',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString()),
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This is my first flutter app',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString()),
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This is my first flutter app',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString()),
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This is my first flutter app',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString()),
      NoteModel(
          id: 12,
          title: 'New Note',
          description: 'This is my first flutter app',
          creationDate: '12th Jun 22',
          pinned: false,
          color: Colors.accents.toString())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 38.0,
                  child: TextField(
                    controller: searchText,
                    style: const TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: const Color.fromARGB(255, 255, 230, 0),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 15.0),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searchText.clear();
                            keyboardOpen = !keyboardOpen;
                          });
                        },
                        icon: Icon(keyboardOpen ? Icons.clear : null,
                            color: Colors.white),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 93, 92, 92),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Pinned',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            openPinned = !openPinned;
                          });
                        },
                        icon: Icon(openPinned
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                        color: const Color.fromARGB(255, 255, 230, 0),
                        iconSize: 30.0,
                        splashRadius: 0.1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0.0,
                  color: Colors.white,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Visibility(
                  visible: openPinned,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: getNotes().length,
                      itemBuilder: (context, index) => InkWell(
                        // borderRadius: BorderRadius.circular(20.0),
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: colors[Random().nextInt(colors.length)],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // margin: const EdgeInsets.symmetric(vertical: 10.0),
                          // padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text('${notes[index].title}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      notes[index].description.length < 21
                                          ? '${notes[index].description}'
                                          : '${notes[index].description.substring(0, 20)}'
                                              '...',
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            openNotes = !openNotes;
                          });
                        },
                        icon: Icon(openNotes
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                        color: const Color.fromARGB(255, 255, 230, 0),
                        iconSize: 30.0,
                        splashRadius: 0.1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0.0,
                  color: Colors.white,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Visibility(
                  visible: openNotes,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: getNotes().length,
                      itemBuilder: (context, index) => InkWell(
                        // borderRadius: BorderRadius.circular(20.0),
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: colors[Random().nextInt(colors.length)],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // margin: const EdgeInsets.symmetric(vertical: 10.0),
                          // padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text('${notes[index].title}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      notes[index].description.length < 21
                                          ? '${notes[index].description}'
                                          : '${notes[index].description.substring(0, 20)}'
                                              '...',
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notes');
        },
        backgroundColor: const Color.fromARGB(255, 236, 154, 58),
        child: const Icon(Icons.add, color: Colors.black, size: 50.0),
      ),
    );
  }
}

// Just in case
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool keyboardOpen = false;
//   bool openPinned = true;
//   bool openNotes = true;
//   TextEditingController searchText = TextEditingController();

//   getNotes() async {
//     final notes = await DatabaseProvider.db.getNotes();
//     return notes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//           child: Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text(
//                   'Notes',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.white,
//                   thickness: 2,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10.0),
//                   height: 38.0,
//                   child: TextField(
//                     controller: searchText,
//                     style: const TextStyle(color: Colors.white, fontSize: 15.0),
//                     textAlignVertical: TextAlignVertical.bottom,
//                     cursorColor: const Color.fromARGB(255, 255, 230, 0),
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       hintStyle:
//                           const TextStyle(color: Colors.white, fontSize: 15.0),
//                       prefixIcon: const Icon(Icons.search, color: Colors.white),
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             searchText.clear();
//                             keyboardOpen = !keyboardOpen;
//                           });
//                         },
//                         icon: Icon(keyboardOpen ? Icons.clear : null,
//                             color: Colors.white),
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 93, 92, 92),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       const Text(
//                         'Pinned',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             openPinned = !openPinned;
//                           });
//                         },
//                         icon: Icon(openPinned
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down),
//                         color: const Color.fromARGB(255, 255, 230, 0),
//                         iconSize: 30.0,
//                         splashRadius: 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   height: 0.0,
//                   color: Colors.white,
//                   thickness: 1,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       const Text(
//                         'Notes',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             openNotes = !openNotes;
//                           });
//                         },
//                         icon: Icon(openNotes
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down),
//                         color: const Color.fromARGB(255, 255, 230, 0),
//                         iconSize: 30.0,
//                         splashRadius: 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   height: 0.0,
//                   color: Colors.white,
//                   thickness: 1,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/notes');
//         },
//         backgroundColor: const Color.fromARGB(255, 236, 154, 58),
//         child: const Icon(Icons.add, color: Colors.black, size: 50.0),
//       ),
//     );
//   }
// }


// Seocnd helper

// Container(
//                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       const Text(
//                         'Pinned',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             openPinned = !openPinned;
//                           });
//                         },
//                         icon: Icon(openPinned
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down),
//                         color: const Color.fromARGB(255, 255, 230, 0),
//                         iconSize: 30.0,
//                         splashRadius: 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   height: 0.0,
//                   color: Colors.white,
//                   thickness: 1,
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Visibility(
//                   visible: openPinned,
//                   child: Expanded(
//                     child: ListView.builder(
//                       itemCount: getNotes().length,
//                       itemBuilder: (context, index) => InkWell(
//                         // borderRadius: BorderRadius.circular(20.0),
//                         onTap: () {},
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5.0),
//                           padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                           decoration: BoxDecoration(
//                             color: colors[Random().nextInt(colors.length)],
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           // margin: const EdgeInsets.symmetric(vertical: 10.0),
//                           // padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text('${notes[index].title}',
//                                         style: const TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text(
//                                       notes[index].description.length < 21
//                                           ? '${notes[index].description}'
//                                           : '${notes[index].description.substring(0, 20)}'
//                                               '...',
//                                       style: const TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       const Text(
//                         'Notes',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             openNotes = !openNotes;
//                           });
//                         },
//                         icon: Icon(openNotes
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down),
//                         color: const Color.fromARGB(255, 255, 230, 0),
//                         iconSize: 30.0,
//                         splashRadius: 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   height: 0.0,
//                   color: Colors.white,
//                   thickness: 1,
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Visibility(
//                   visible: openNotes,
//                   child: Expanded(
//                     child: ListView.builder(
//                       itemCount: getNotes().length,
//                       itemBuilder: (context, index) => InkWell(
//                         // borderRadius: BorderRadius.circular(20.0),
//                         onTap: () {},
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5.0),
//                           padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                           decoration: BoxDecoration(
//                             color: colors[Random().nextInt(colors.length)],
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           // margin: const EdgeInsets.symmetric(vertical: 10.0),
//                           // padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text('${notes[index].title}',
//                                         style: const TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text(
//                                       notes[index].description.length < 21
//                                           ? '${notes[index].description}'
//                                           : '${notes[index].description.substring(0, 20)}'
//                                               '...',
//                                       style: const TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )