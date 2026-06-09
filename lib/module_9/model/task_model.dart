class Task{
  final int ? id;
  final String title;
  final bool isDone;

  Task({this.id , required this.title , required this.isDone});


  Map<String, dynamic>toMap(){
    return {
      'id' : id,
      'title' : title,
      'isDone' : isDone ? 1 : 0,
    };
  }



  factory Task.formMap(Map<String,dynamic>map){
    return Task(
        id: map['id'],
        title: map['title'], isDone: map['isDone'] == 1);
  }
}



