import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Listt extends StatelessWidget {
  const Listt({super.key,required this.taskName, required this.taskComplete, this.onChange, this.deleteFuction,});
  final String taskName;
  final bool taskComplete;
  final Function(bool?)? onChange;
  final Function(BuildContext?)?  deleteFuction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top:20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
         SlidableAction(onPressed:
             deleteFuction,
           icon: Icons.delete,
           borderRadius: BorderRadius.circular(15),
         ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(15),

          ),
          //margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                  value: taskComplete,
                  onChanged: onChange,
                  activeColor: Colors.white,
                  checkColor: Colors.pink,
                  side: BorderSide(
                    color: Colors.white,
                  ),
              ),
              Row(
                children: [
                  Text(
                    taskName,style:  TextStyle(
                    color:Colors.white,
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(width: 20,),
                  Icon(taskComplete? Icons.emoji_emotions: Icons.pending_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
