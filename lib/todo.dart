class ToDo{
  String? id;
  String? todoText;
  late bool isDone;


ToDo({
  required this.id,
  required this.todoText,
  this.isDone = false,
  
});

static List<ToDo> todoList(){
  return [
    ToDo(id: '01', todoText: 'Excercise',),
    ToDo(id: '02', todoText: 'Coding',),
    ToDo(id: '03', todoText: 'Buy Groceries',),
    ToDo(id: '04', todoText: 'Team Meeting',),
    ToDo(id: '05', todoText: 'Lunch', ),    
    ToDo(id: '06', todoText: 'Check Emails',),
    ToDo(id: '07', todoText: 'Testing',),
    ToDo(id: '08', todoText: 'Fixing Bug',),
    ToDo(id: '09', todoText: 'Gaming',),
    ToDo(id: '10', todoText: 'Sleep',),
  ];
}
} 
