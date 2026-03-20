import 'package:flutter_test/flutter_test.dart';

void main() {

  // TEST 1: Add Task
  test('Add task should increase list length', () {
    List<Map<String, dynamic>> tasks = [];

    tasks.add({"title": "Test Task", "done": false});

    expect(tasks.length, 1);
    expect(tasks[0]["title"], "Test Task");
    expect(tasks[0]["done"], false);
  });

  // TEST 2: Toggle Task
  test('Toggle task should change done status', () {
    List<Map<String, dynamic>> tasks = [
      {"title": "Task 1", "done": false}
    ];

    tasks[0]["done"] = !tasks[0]["done"];

    expect(tasks[0]["done"], true);
  });

}

