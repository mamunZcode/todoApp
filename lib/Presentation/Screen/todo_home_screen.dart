import 'package:flutter/material.dart';
import '../../Core/Services/firestore_services.dart';
class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({super.key});

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}
class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  FireStoreService fireStoreService = FireStoreService();
  TextEditingController todoController = TextEditingController();
  List<Map<String, dynamic>> todoData = [];
  ///create delete function
  void delete(String docId) async{
    await fireStoreService.deleteDocument('todos', docId);
    setTodoData();
  }
  void clear(){
    todoController.text='';
  }
  void setTodoData() async {
    final docs = await fireStoreService.getAllTodos();
    setState(() {
      todoData =docs;
    });
  }
  void saveData() async {
    const collectionName = 'todos'; // 🔹 set your collection name
    final todoText = todoController.text.trim();
    if (todoText.isEmpty) {
      print("Todo is empty");
      return;
    }
    await fireStoreService.addNewTodoData(collectionName, {
      'todoName': todoText,
      'CreateByMamun': DateTime.now().toIso8601String(),
    });
    setTodoData();
  }
  @override
  void initState() {
    setTodoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: PreferredSize(
          preferredSize:const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.pinkAccent,
            title: const Text("TODO App"),
            bottom: const TabBar(
              indicatorColor:Colors.grey,
              dividerColor: Colors.pink,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: [
                Text("List Item",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                Text("Remove Item",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
            actions: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    print('profile click');
                  },
                  child: const Padding(
                    padding:  EdgeInsets.only(left: 8.0,right: 8.0,top: 12.0 ),
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                        minRadius: 8.0,
                        child: Icon(Icons.person,size: 28.0,
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              openBottomShit();
            });
          },
          child:const Icon(Icons.add),
        ),
        ///show add list
        body:  TabBarView(
          children: [
            ///Add item to task Design
            ListView.builder(
              itemCount: todoData.length,
              itemBuilder: (context, index) {
                final todo = todoData[index];
                if (todo == null) {
                  return const ListTile(title: Text("Invalid data"));
                }
                final docId = todo['doc_id'];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black54,width: 1)
                  ),
                  child: ListTile(
                    iconColor: Colors.redAccent,
                    textColor: Colors.green,
                    title: Text(todo['todoName'] ?? 'No name',style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      onPressed: () {
                        delete(docId);
                        print('delete');
                      },
                      icon: const Icon(Icons.delete),

                    ),

                  ),
                );
              },
            ),
            ///Remove item to task Design
           const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                 child: Text('yo Habibi'),
                )
              ],
            )
          ],
        )
      ),
    );
  }
  void openBottomShit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey  ,
          title: Text("Add Task"),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(
              labelText: "Task name",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                saveData();
                clear();
                print('Add');
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
