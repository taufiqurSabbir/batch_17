import 'package:flutter/material.dart';

import '../widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                  itemBuilder: (context, index){
                return TaskCountByStatus(title: 'New', count: 20,);


              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox( width: 20,);
              },),
            ),
          ),
          
          
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('Task-1${index}',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18
                    ),),


                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy'),
                        Text('Date: 20-10-2000'),
                        Row(
                          children: [
                            Chip(label: Text('New'),
                            backgroundColor: Colors.blue,
                              labelStyle: TextStyle(
                                color: Colors.white
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              ),
                            ),

                          Spacer(),


                            IconButton(onPressed: (){}, icon: Icon(Icons.edit_note, color: Colors.orange,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),

                          ],
                        )
                      ],
                    ),
                  );
                }),
          )


        ],
      ),
    );
  }
}

