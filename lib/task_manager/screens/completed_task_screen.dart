

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widget/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getTaskByStatus('Completed');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
          builder: (context,taskProvider,child) {
            return Column(

              children: [
             taskProvider.isLoading ? Center(child: CircularProgressIndicator()) :   Expanded(
                  child: ListView.builder(
                      itemCount: taskProvider.completeTask.length,
                      itemBuilder: (context,index){
                        final task = taskProvider.completeTask[index];
                        return TaskCard(taskModel: task, CardColor: Colors.blue, refreshParent: () async {
                          await taskProvider.getTaskByStatus('Completed');
                          await taskProvider.getAllTaskCount();
                        },);
                      }),
                )


              ],
            );
          }
      ),
    );
  }
}
