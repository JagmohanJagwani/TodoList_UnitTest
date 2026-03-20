import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo UI',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // 🔹 LOAD TASKS
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("tasks");

    if (data != null) {
      List decoded = jsonDecode(data);
      setState(() {
        tasks = decoded.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    }
  }

  // 🔹 SAVE TASKS
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    String encoded = jsonEncode(tasks);
    await prefs.setString("tasks", encoded);
  }

  // 🔹 ADD TASK
  void _addTask() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      tasks.add({
        "title": _controller.text.trim(),
        "done": false,
      });
    });

    _saveTasks();
    _controller.clear();
    Navigator.pop(context);
  }

  // 🔹 TOGGLE TASK
  void _toggleTask(int index) {
    setState(() {
      tasks[index]["done"] = !tasks[index]["done"];
    });

    _saveTasks();
  }

 
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add New Task"),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: "Enter task title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: _addTask,
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("My ToDo List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning 👋",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Jagmohan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: tasks[index]["done"],
                        onChanged: (value) => _toggleTask(index),
                      ),
                      title: Text(
                        tasks[index]["title"],
                        style: TextStyle(
                          decoration: tasks[index]["done"]
                              ? TextDecoration.lineThrough
                              : null,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
