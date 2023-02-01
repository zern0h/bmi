import 'package:flutter/material.dart';
import '../utils/colors.dart';


class AgeWeightWidget extends StatefulWidget {

  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

  const AgeWeightWidget({Key? key, required this.onChange,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max}) : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

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
        const SizedBox(height: 10,),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 20, color: MyColors.btnBorderColor,),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
        padding: const EdgeInsets.all(15.0),
          child: Row(
          children: [
            InkWell(
              child: const CircleAvatar(
                radius: 12,
                backgroundColor:  MyColors.btnBorderColor,
                child: Icon(Icons.remove, color: Colors.white),
                ),
                onTap: () {
                setState(() {
                if (counter > widget.min) {
                counter--;
                }
                });
                widget.onChange(counter);
                },
                ),
            const SizedBox(
            width: 15,
            ),
            Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
            color: MyColors.btnBorderColor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
            ),
            const SizedBox(
            width: 15,
            ),
            InkWell(
              child: const CircleAvatar(
              radius: 12,
              backgroundColor: MyColors.titleTextColor,
                child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    if (counter < widget.max) {
                      counter++;
                    }
                  });
                  widget.onChange(counter);
                },
    ),
  ],
          )
        )])));
  }
}
