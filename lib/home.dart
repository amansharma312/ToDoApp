import 'package:demo/colors.dart';
import 'package:demo/todo.dart';
import 'package:demo/todo_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final todosList = ToDo.todoList();
List<ToDo> _foundtodo = [];

final _todoController = TextEditingController();

@override
  void initState() {
    _foundtodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: tdBGColor ,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50,bottom: 20),
                      child: const Text(
                        'All ToDos', 
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          )
                          ),
                    ), 
                    for(ToDo todo in _foundtodo.reversed)
                    TodoItem(
                      todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleToDoItem,
                      ),
                  ],
                )
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [ BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0,0.0),
                    spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    hintText: 'Add a new ToDo item',
                    border: InputBorder.none,
                  ),
                ),
                ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text('+', style: TextStyle(fontSize: 40,),),
                      ),
                ),
            ]),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
          todo.isDone = !todo.isDone;
    });}

  void _deleToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });

  }

  void _addToDoItem(String todo){
    setState(() {
    todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), 
    todoText: todo
    ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((item) => item.todoText!
      .toLowerCase().
      contains(enteredKeyword.
      toLowerCase()))
      .toList();
    }

    setState(() {
      _foundtodo = results;
    });

  }

  Widget searchBox(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),

        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: tdGrey),
              ),
              ),
              );
              }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          )
        ],
      ),
    );
  }
}