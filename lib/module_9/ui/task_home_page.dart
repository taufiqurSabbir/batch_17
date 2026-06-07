import 'package:flutter/material.dart';
class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter task',
                    border: OutlineInputBorder()
                  ),
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.add))
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context,index){
                return ListTile(
                  leading: Checkbox(value: false, onChanged: (_){}),
                  title: Text('Task-${index}'),
                  
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.orange,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                  
                );
                }
            
            ),
          )
        ],
      ),
    );
  }
}
