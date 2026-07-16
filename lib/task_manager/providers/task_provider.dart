import 'package:batch_17/task_manager/data/model/task_model.dart';
import 'package:batch_17/task_manager/data/model/task_status_count_model.dart';
import 'package:flutter/material.dart';

import '../data/model/api_response.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class TaskProvider extends ChangeNotifier{
  bool isLoading = false;

  void setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }
  List<TaskStatusCountModel> taskCountList = [];

  List<TaskModel> newTask = [];
  List<TaskModel> progressTask = [];
  List<TaskModel> completeTask = [];
  List<TaskModel> cancelledTask = [];



  Future<void> getAllTaskCount() async {
    setLoading(true);

    final ApiResponse response = await ApiCaller.getRequest(url: TMUrls.getTaskCountURL);

    List<TaskStatusCountModel> taskC = [];



    if(response.isSuccess){
      for(Map<String , dynamic>jsonData in (response.responseData['data'])){
        taskC.add(TaskStatusCountModel.fromJson(jsonData));
      }

      taskC.removeWhere((e)=>e.sId == null);

      taskCountList = taskC;

      setLoading(false);



    }


  }


}