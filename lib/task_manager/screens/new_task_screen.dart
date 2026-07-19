import 'dart:convert';

import 'package:batch_17/task_manager/data/model/api_response.dart';
import 'package:batch_17/task_manager/data/service/api_caller.dart';
import 'package:batch_17/task_manager/providers/task_provider.dart';
import 'package:batch_17/task_manager/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/task_model.dart';
import '../data/model/task_status_count_model.dart';
import '../widget/task_card.dart';
import '../widget/task_count_by_status.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   final taskProvider = Provider.of<TaskProvider>(context,listen: false);
   taskProvider.getAllTaskCount();
   taskProvider.getTaskByStatus('New');
  }







  @override
  Widget build(BuildContext context) {
    List<String> statusOrder = [
      'New',
      'Progress',
      'Completed',
      'Cancelled'
    ];
    return Scaffold(
      body: Consumer<TaskProvider>(
        builder: (context,taskProvider,child) {
          if(taskProvider.isLoading){
            Center(child: CircularProgressIndicator());
          }
          
          return Column(
          
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: statusOrder.length,
          
                      itemBuilder: (context, index){
          
                        final status = statusOrder[index];
          
                        final task = taskProvider.taskCountList.firstWhere((e)=>e.sId == status, orElse: ()=> TaskStatusCountModel(
                          sId: status,
                          sum: 0
                        ));
                    return TaskCountByStatus(title: task.sId.toString(), count: task.sum ?? 0,);
          
          
                  }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox( width: 20,);
                  },),
                ),
              ),


              taskProvider.isLoading ? Center(child: CircularProgressIndicator()) :     Expanded(
                child: ListView.builder(
                    itemCount: taskProvider.newTask.length,
                    itemBuilder: (context,index){
                      final task = taskProvider.newTask[index];
                      return  TaskCard(taskModel: task, CardColor: Colors.blue, refreshParent: () async {
                       await taskProvider.getTaskByStatus('New');
                       await taskProvider.getAllTaskCount();
                      },);
                    }),
              )
          
          
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskScreen()));

      },child: Icon(Icons.add),),
    );
  }
}


