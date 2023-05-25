import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../utility/utility.dart';

import '../styles/styles.dart';

class AddQuestion extends StatefulWidget {

  AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  Map<String,dynamic> Question = {'title':"",'option1':{},'option2':{},'option3':{},'option4':{},'answer':''};
  InputOnChange(MapKey,MapValue){
    setState(() {
      Question.update(MapKey, (value) => MapValue);
    });
  }
  FormOnSubmit() async{
    if (Question['title'] == ''){
      ErrorToast('Title not provided');
    }
    else if (Question['option1'] == ''){
      ErrorToast('option1 not provided');
    }
    else if (Question['option2'] == ''){
      ErrorToast('option2 not provided');
    }
    else if (Question['option3'] == ''){
      ErrorToast('option3 not provided');
    }
    else if (Question['option4'] == ''){
      ErrorToast('option4 not provided');
    }
    else if (Question['answer'] == ''){
      ErrorToast('answer not provided');
    }
    else{
      print('Inside the else blcok');
      await addQuestion();
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      SuccessToast('Question added successfully!!');
    }

  }
  Future<void> addQuestion() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);
    await FirebaseFirestore.instance.collection('questions').doc().set({
      'title':Question['title'],
      'option1':Question['option1'],
      'option2':Question['option2'],
      'option3':Question['option3'],
      'option4':Question['option4'],
      'answer':Question['answer'],
      'uid':uid
    });
  }





  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 123, 1),
        foregroundColor: Colors.white,
        elevation: 1,
        title: Text('Add a Question',style: TextHead4(colorWhite),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: height*0.17,),
              Column(
                children: [
                  Text('Write the Question information',style: TextHead4(colorBlack),),
                  SizedBox(height: 15.0,),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 45
                        ),
                        labelText: 'Question Title',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.redAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                        )
                    ),
                    onChanged: (value){
                      InputOnChange('title', value);
                    },
                  ),
                  SizedBox(height: 15.0,),

                  TextFormField(
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 45
                        ),
                        labelText: 'Option1',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.redAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                        )
                    ),
                    onChanged: (value){
                      InputOnChange('option1', value);
                    },
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 45
                        ),
                        labelText: 'Option2',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.redAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                        )
                    ),
                    onChanged: (value){
                      InputOnChange('option2', value);
                    },
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 45
                        ),
                        labelText: 'Option3',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.redAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                        )
                    ),
                    onChanged: (value){
                      InputOnChange('option3', value);
                    },
                  ),
                  SizedBox(height: 15.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: 45
                        ),
                        labelText: 'Option4',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.redAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.greenAccent)
                        )
                    ),
                    onChanged: (value){
                      InputOnChange('option4', value);
                    },
                  ),
                  DropdownButton(
                      isExpanded: true,
                      value: Question['answer'],
                      items: [
                        DropdownMenuItem(value:'' ,child: Text('Correct Answer')),
                        DropdownMenuItem(value: '1',child: Text('1')),
                        DropdownMenuItem(value: '2',child: Text('2')),
                        DropdownMenuItem(value: '3',child: Text('3')),
                        DropdownMenuItem(value: '4',child: Text('4')),
                      ],
                      onChanged: (value){
                        InputOnChange('answer', value);

                      }),

                  SizedBox(height: 15.0,),
                  ElevatedButton(
                      onPressed: (){
                        FormOnSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width*0.9, 45),
                          backgroundColor: Color.fromRGBO(255, 0, 123, 1),
                          foregroundColor: Colors.white
                      ),
                      child: Text('Submit',style: TextHead1(colorWhite),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
