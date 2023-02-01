import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

import '../utils/colors.dart';


class GenderWidget extends StatefulWidget {

  final Function(int) onChange;


  const GenderWidget({Key? key, required this.onChange,}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {


  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: MyColors.titleTextColor,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
  topColor: Colors.white,
  backColor: MyColors.titleTextColor,
  borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: MyColors.titleTextColor, width: 3.0,),
              style: _gender ==1? selectedStyle : unselectedStyle,
              onSelected: (){
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              onUnSelected: (){},
              selected: _gender == 1,
              child: Column(
                children: [
                const SizedBox(
                height: 10,
                ),
                  Image.asset("assets/images/xy.png",height:40,width: 50,),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Male",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: MyColors.btnBorderColor,
                  ),)
                ],
              )),
          const SizedBox(
            width: 25,
          ),
          ChoiceChip3D(
              border: Border.all(color: MyColors.titleTextColor, width: 3.0,),
              style: _gender ==2? selectedStyle : unselectedStyle,
              onSelected: (){
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 2,
              onUnSelected: (){},
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset("assets/images/xx.png", height:40,width: 50,),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Female" ,
                    style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: MyColors.btnBorderColor,
                  ),)
                ],
              ))

        ],
      ),
    );
  }
}
