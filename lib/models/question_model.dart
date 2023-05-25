class Question{
  var id;
  var title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int answer;
  Question({
    required this.id,
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer
});

  String toString(){
    return 'Question(id: $id, title: $title, option1: $option1)';
  }
}