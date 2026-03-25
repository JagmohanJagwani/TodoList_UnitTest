# ToDo List App with Shared Preferences

## 📌 Group Member Details
- Section: BSSE-6D
- Jagmohan Dass (2380232)
- Saad Ahsan (2380278)
- Abdul Wahid (2380222)
- Muhammad Khizer (2380279)

## 🛠 Project Structure
lib/
├─ main.dart # Main Flutter app with UI and task logic
test/
├─ todo_test.dart # Unit tests for add/toggle task functionality
screenshots/
├─ ui.png # Screenshot of app UI
├─ test.png # Screenshot of unit test results
pubspec.yaml # Project dependencies including shared_preferences


---

## 📷 Screenshots

### App UI
![image alt](https://github.com/JagmohanJagwani/TodoList_UnitTest/blob/71fcd3324a676b8dafbe9ebd777ab6980b00fa4b/Screenshot/ui.png)

### Unit Test Output
![Test Screenshot](https://github.com/JagmohanJagwani/TodoList_UnitTest/blob/71fcd3324a676b8dafbe9ebd777ab6980b00fa4b/Screenshot/test.png)

---

## 📝 Description

This Flutter ToDo List application uses the `shared_preferences` plugin to persist tasks and their "done" status.  

**Features:**
- Add new tasks  
- Toggle task completion  
- Tasks persist even after app restart  

**Unit Tests:**
1. Adding a new task increases the task list.
2. Toggling a task correctly updates its "done" status.

---
