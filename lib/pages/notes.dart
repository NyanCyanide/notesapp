import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 255, 230, 0), size: 20.0),
                      label: const Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 255, 230, 0)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 230, 0),
                            fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 0.0,
                  color: Color.fromARGB(255, 255, 230, 0),
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  cursorColor: const Color.fromARGB(255, 255, 230, 0),
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  onChanged: (value) {
                    titleText = value;
                  },
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    cursorColor: const Color.fromARGB(255, 255, 230, 0),
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                    onChanged: (value) {
                      descriptionText = value;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class Notes extends StatefulWidget {
//   const Notes({Key? key}) : super(key: key);

//   @override
//   State<Notes> createState() => _NotesState();
// }

// class _NotesState extends State<Notes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//           child: Expanded(
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     TextButton.icon(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back_ios,
//                           color: Color.fromARGB(255, 255, 230, 0), size: 20.0),
//                       label: const Text(
//                         'Notes',
//                         style: TextStyle(
//                             fontSize: 15.0,
//                             color: Color.fromARGB(255, 255, 230, 0)),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Done',
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 255, 230, 0),
//                             fontSize: 15.0),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Divider(
//                   height: 0.0,
//                   color: Color.fromARGB(255, 255, 230, 0),
//                   thickness: 1,
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 const TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Title',
//                     hintStyle: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                   cursorColor: Color.fromARGB(255, 255, 230, 0),
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Description',
//                       hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
//                     ),
//                     cursorColor: Color.fromARGB(255, 255, 230, 0),
//                     style: TextStyle(fontSize: 18.0, color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
