import 'package:findx/Data/fileTypes.dart';
import 'package:findx/Functions/googleQueryGen.dart';
import 'package:flutter/material.dart';

class FindX extends StatefulWidget {
  const FindX({super.key});

  @override
  State<FindX> createState() => _FindXState();
}

class _FindXState extends State<FindX> {
  Map<String, bool> selectedFormats = {};
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize selection status for each file format to false
    for (var formats in fileFormats.values) {
      for (var format in formats) {
        selectedFormats[format] = false;
      }
    }
  }

  // Generate the selected formats query string
  String getSelectedFormatsString() {
    // Collect selected formats
    List<String> selectedList = selectedFormats.entries.where((entry) => entry.value).map((entry) => "filetype:${entry.key}").toList();
    String val = '';
    // Format the output string
    if (selectedList.isEmpty) {
      val = '';
    } else if (selectedList.length == 1) {
      val = selectedList.first;
    } else {
      val = "(${selectedList.join(" OR ")})";
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    String userInput = '';

    String submitInput() {
      setState(() {
        userInput = _controller.text;
      });
      // _controller.clear();
      return userInput;
    }

    return Scaffold(
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              width: deviceWidth,
              child: deviceWidth > 500
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "FindX",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 17),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 40,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorHeight: 20,
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    labelText: 'Search..',
                                    labelStyle: TextStyle(color: Color.fromARGB(255, 165, 165, 165)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(color: Color.fromARGB(134, 255, 0, 0), width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                                    ),
                                  ),
                                  cursorColor: const Color.fromARGB(255, 134, 134, 134), // Change cursor color when focused
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  googleQueryGen(context, getSelectedFormatsString(), submitInput());
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        color: Colors.blueGrey),
                                    child: const Icon(
                                      Icons.search_rounded,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "FindX",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 17),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 40,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorHeight: 20,
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    labelText: 'Search..',
                                    labelStyle: TextStyle(color: Color.fromARGB(255, 165, 165, 165)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(color: Color.fromARGB(134, 255, 0, 0), width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                                    ),
                                  ),
                                  cursorColor: const Color.fromARGB(255, 134, 134, 134), // Change cursor color when focused
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  googleQueryGen(context, getSelectedFormatsString(), submitInput());
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        color: Colors.blueGrey),
                                    child: const Icon(
                                      Icons.search_rounded,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            ),

            // Select file type
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                  child: Text(
                    "Select the file type you would like to search from the options below.",
                    style: TextStyle(color: Colors.black87, fontSize: kDefaultFontSize),
                  ),
                ),
                SizedBox(
                  height: deviceWidth > 500 ? deviceHeight - 150 : deviceHeight - 180,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: ListView(
                      children: [
                        // Display categories with checkboxes
                        ...fileFormats.entries.map((categoryEntry) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categoryEntry.key,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: categoryEntry.value.map((format) {
                                  return FilterChip(
                                    label: Text(format),
                                    selected: selectedFormats[format] ?? false,
                                    onSelected: (bool isSelected) {
                                      setState(() {
                                        selectedFormats[format] = isSelected;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
