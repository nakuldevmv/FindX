import 'package:findx/Data/fileTypes.dart';
import 'package:findx/widgets/checkBox.dart';
import 'package:flutter/material.dart';

class findX extends StatefulWidget {
  const findX({super.key});

  @override
  State<findX> createState() => _findXState();
}

class _findXState extends State<findX> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    double devicewidth = MediaQuery.of(context).size.width;
    String userInput = '';

    void submitInput() {
      setState(() {
        userInput = controller.text;
      });
      print(userInput);
      controller.clear(); // Clear the text field after submission
    }

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //heading
            Container(
              height: 100,
              width: devicewidth,
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "FindX",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      submitInput();
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.blueGrey),
                      child: const Icon(Icons.search_rounded),
                    ),
                  )
                ],
              ),
            ),

            //select file type
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                  child: Text("Select File Type"),
                ),
                CheckBox(),
              ],
            )

            //search bar
          ],
        ),
      ),
    );
  }
}
