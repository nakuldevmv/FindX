// import 'package:findx/Data/fileTypes.dart';
// import 'package:findx/Functions/googleQueryGen.dart';
// import 'package:flutter/material.dart';

// class CheckBox extends StatefulWidget {
//   const CheckBox({super.key});

//   @override
//   CheckBoxState createState() => CheckBoxState();
// }

// class CheckBoxState extends State<CheckBox> {
//   // Track selection status for each file format
//   Map<String, bool> selectedFormats = {};

//   @override
//   void initState() {
//     super.initState();
//     // Initialize selection status for each file format to false
//     for (var formats in fileFormats.values) {
//       for (var format in formats) {
//         selectedFormats[format] = false;
//       }
//     }
//   }

//   // Generate the selected formats query string
//   String getSelectedFormatsString() {
//     // Collect selected formats
//     List<String> selectedList = selectedFormats.entries.where((entry) => entry.value).map((entry) => "filetype:${entry.key}").toList();
//     String val = '';
//     // Format the output string
//     if (selectedList.isEmpty) {
//       val = 'No file types selected';
//     } else if (selectedList.length == 1) {
//       val = selectedList.first;
//     } else {
//       val = "(${selectedList.join(" OR ")})";
//     }
//     return val;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // String GlobalQuery = getSelectedFormatsString();
//     // print(GlobalQuery);
//     double deviceheight = MediaQuery.of(context).size.height;

//     return SizedBox(
//       height: deviceheight - 150,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//         child: ListView(
//           children: [
//             // Display categories with checkboxes
//             ...fileFormats.entries.map((categoryEntry) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     categoryEntry.key,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Divider(),
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: categoryEntry.value.map((format) {
//                       return FilterChip(
//                         label: Text(format),
//                         selected: selectedFormats[format] ?? false,
//                         onSelected: (bool isSelected) {
//                           setState(() {
//                             selectedFormats[format] = isSelected;
//                           });
//                         },
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               );
//             }),
//             // const SizedBox(height: 20),

//             // // Button to show selected formats
//             // ElevatedButton(
//             //   onPressed: () {
//             //     String query = getSelectedFormatsString();
//             //     googleQueryGen(query); // Pass the query to googleQueryGen
//             //     ScaffoldMessenger.of(context).showSnackBar(
//             //       SnackBar(content: Text(query)),
//             //     );
//             //   },
//             //   child: const Text('Show Selected Formats'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
