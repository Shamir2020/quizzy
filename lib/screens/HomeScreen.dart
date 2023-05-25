import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/styles/styles.dart';
import 'globalVariable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Sorry bhaia for not completing this simple project
// Like I said, I was sick for several days. I had migraines, abdominal cramps, cough and fever
//This is why I couldnt give time to this project
// I felt better today and did this much in one day.
// If I wasn't sick, I could surely complete both the projects

class _HomeScreenState extends State<HomeScreen> {
  var QuestionList = [];
  int index = 0;
  int length = 0;
  int score = 0;
  GetQuestions() async{
    FirebaseFirestore.instance.collection("questions").get().then(
          (querySnapshot) {
        print("Successfully Fetched the questions!");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          var question = docSnapshot.data();
          print(question);
          setState(() {
            QuestionList.add(question);
            length += 1;
          });
          print(QuestionList);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
  bool showScore = false;



  @override
  void initState() {
    // TODO: implement initState
    GetQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(0, 255, 200, 1),
        title: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'profile');
            }, icon: Icon(Icons.person)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quizzy',style: TextHead4(colorBlack),),
                SizedBox(height: 3,),
                Text('Learn & Evolve',style: TextHead4(colorBlack),)
              ],
            )
            
          ],
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showScore)Text('Your Score is ${score}'),
          if (!showScore)Question(QuestionList[index],index,length,score),

        ],
      ),
    );
  }
}


class Question extends StatefulWidget {
  var Q;
  var index;
  var length;
  var score;
  Question(this.Q,this.index,this.length,this.score,{Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width*0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.Q['title'],style: TextHead1(colorBlack),),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black
                ),
                onPressed: (){
                  if (widget.Q['answer'] == 1){
                    widget.score += 1;
                    indexAll = widget.index + 1;
                    scoreAll = widget.score;
                  }

                }
                , child: Text(widget.Q['option1'],style: TextHead4(colorWhite),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black
                ),
                onPressed: (){
                  if (widget.Q['answer'] == 2){
                    widget.score += 1;
                  }
                }
                , child: Text(widget.Q['option2'],style: TextHead4(colorWhite),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black
                ),
                onPressed: (){
                  if (widget.Q['answer'] == 3){
                    widget.score += 1;
                  }
                }
                , child: Text(widget.Q['option3'],style: TextHead4(colorWhite),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black
                ),
                onPressed: (){
                  if (widget.Q['answer'] == 4){
                    widget.score += 1;
                  }
                }
                , child: Text(widget.Q['option4'],style: TextHead4(colorWhite),))
          ],
        ),
      ),
    );
  }
}
