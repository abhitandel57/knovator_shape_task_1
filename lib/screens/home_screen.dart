import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knovator_shape_task_1/constant/image_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<int, String> selectedShapeList = {};

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shape Task",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: selectedShapeList.entries.map((e) {
                  return shapeItem(e.value, 40, () {
                    onItemClick(e.key);
                  }, padding: 10);
                }).toList(),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shapeItem(
                  square,
                  30,
                  () {
                    setState(() {
                      selectedShapeList[count] = square;
                      count+=1;
                    });
                  },
                  color: Colors.white,
                ),
                shapeItem(
                  circle,
                  30,
                  () {
                    setState(() {
                      selectedShapeList[count] = circle;
                      count+=1;
                    });
                  },
                  color: Colors.white,
                ),
                shapeItem(
                  triangle,
                  30,
                  () {
                    setState(() {
                      selectedShapeList[count] = triangle;
                      count+=1;
                    });
                  },
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shapeItem(String e, double size, Function() onClick,
      {Color? color, double? padding}) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: padding != null ? EdgeInsets.all(padding) : EdgeInsets.zero,
        child: SvgPicture.asset(
          e,
          height: size,
          width: size,
          color: color ?? Colors.black,
        ),
      ),
    );
  }

  onItemClick(int index){
      if(index != 0){
        selectedShapeList[index] = selectedShapeList[index-1].toString();
        setState(() {});
      }
    }
}
