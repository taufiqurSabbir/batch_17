import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
   ScorePage({super.key});
  
  final doc = FirebaseFirestore.instance.collection('matches').doc('live_match');


   void addRun(int run) {
     doc.update({
       "runs": FieldValue.increment(run)
     });
   }

   void addWicket() {
     doc.update({
       "wickets": FieldValue.increment(1)
     });
   }



  // void addRun(){
  //   doc.update({
  //     "runs": FieldValue.increment(1)
  //   });
  // }
  //
  //  void addFour() {
  //    doc.update({
  //      "runs": FieldValue.increment(4)
  //    });
  //  }
  //
  //  void addSix() {
  //    doc.update({
  //      "runs": FieldValue.increment(4)
  //    });
  //  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live score app'),
        backgroundColor: Colors.orange,
      ),

      body: StreamBuilder<DocumentSnapshot>(
        stream: doc.snapshots(),
        builder: (context, asyncSnapshot) {
          final data = asyncSnapshot.data?.data() as Map<String , dynamic>;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('${data['teamA']} vs ${data['teamB']}', style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 40,),

                Text('${data['runs']} runs / ${data['wickets']}',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold
                ),
                ),

                Text('Over : ${data['overs']}',
                style: TextStyle(
                  fontSize: 28
                ),
                ),

                Text(' ${data['status']}',
                style: TextStyle(color: Colors.green,fontSize: 22),
                ),

                SizedBox(height: 40,),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ElevatedButton(onPressed: (){
                      addRun(1);
                    }, child: Text('+1 run')),
                    ElevatedButton(onPressed: (){
                      addRun(4);
                    }, child: Text('Four')),
                    ElevatedButton(onPressed: (){
                      addRun(6);
                    }, child: Text('Six')),
                    ElevatedButton(onPressed: (){
                      addWicket();
                    }, child: Text('Wicket')),
                    ElevatedButton(onPressed: (){}, child: Text('Next Ball')),
                    ElevatedButton(onPressed: (){

                    }, child: Text('Reset')),
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
