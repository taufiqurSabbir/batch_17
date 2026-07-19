

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widget/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getTaskByStatus('Cancelled');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
          builder: (context,taskProvider,child) {
            return Column(

              children: [
             taskProvider.isLoading ? Center(child: CircularProgressIndicator(),) :  Expanded(
                  child: ListView.builder(
                      itemCount: taskProvider.cancelledTask.length,
                      itemBuilder: (context,index){
                        final task = taskProvider.cancelledTask[index];
                        return TaskCard(taskModel: task, CardColor: Colors.blue, refreshParent: () async {
                          await taskProvider.getTaskByStatus('Cancelled');
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
