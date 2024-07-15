import 'package:flutter/material.dart';
import 'package:todo_list_app/model/task.dart';


class deleteDailog extends StatelessWidget {

  final Task task;
  final onDeleteTask;

  const deleteDailog({
    super.key, 
    required this.task,
    required this.onDeleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Are you sure to delete this task ? ", style: TextStyle(color: Colors.black26, fontSize: 20),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[500], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: (){Navigator.pop(context);}, 
                    child: Text("Cancel", style: TextStyle(color: Colors.white),),
                  ), 

                  SizedBox(width: 10,),    

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red[500], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: (){
                      onDeleteTask(task.id);
                      Navigator.pop(context);
                    }, 
                    child: Text("Delete", style: TextStyle(color: Colors.white),),
                  ),          
                ],
              )
            ],),
        ),
      ),
    );
  }
}