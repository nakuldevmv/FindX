import 'package:findx/widgets/checkBox.dart';
import 'package:flutter/material.dart';

class findX extends StatelessWidget {
  const findX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //heading
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        "FindX",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //select file type
            const Column(
              children: [
                Text("Select File Type"),
                checkBox()
              ],
            )

            //search bar
          ],
        ),
      ),
    );
  }
}
