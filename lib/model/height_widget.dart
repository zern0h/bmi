import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HeightWidget extends StatefulWidget {

  final Function(int) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 12,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          side: const BorderSide(
          color: MyColors.btnBorderColor,
        ),
        borderRadius: BorderRadius.circular(15.0),),
        child: Column(
          children:  [
            const SizedBox(height: 20,),
            const Text(
              "HEIGHT",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: MyColors.btnBorderColor,),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_height.toString(), style: const TextStyle(fontSize: 40, color: MyColors.btnBorderColor,),
                ),
                const SizedBox(width: 10,),
                const Text("cm", style:TextStyle(fontSize: 20, color: MyColors.btnBorderColor,),
                )
              ],
            ),
            Slider(
              min:0,
              max:240,
              value: _height.toDouble(),
              thumbColor: MyColors.titleTextColor,
              activeColor: MyColors.titleTextColor,
              inactiveColor: MyColors.testTextColor,

              onChanged: (value){
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);

              },
            )
          ],
        )),
    );
  }
}
