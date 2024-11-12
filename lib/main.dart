import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: const MyList(title: 'ListView Test'),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key, required this.title});

  final String title;

  @override
  State<MyList> createState() => _MyListState();
}

class ListManager {
  final List<String> todayTasks = ["테스트1", "테스트2", "테스트3"];
  final List<String> completedTasks = ["테스트4", "테스트5"];

  void addTodayTask(String task) {
    todayTasks.add(task);
  }

  void addCompletedTask(String task) {
    completedTasks.add(task);
  }

  String completeTask(int index) {
    if (index < todayTasks.length) {
      final task = todayTasks.removeAt(index);
      completedTasks.add(task);
      return task;
    }
    return "";
  }

  String undoCompleteTask(int index) {
    if (index < completedTasks.length) {
      final task = completedTasks.removeAt(index);
      todayTasks.add(task);
      return task;
    }
    return "";
  }
}

class _MyListState extends State<MyList> {
  //마이리스트 상태 관리
  final ListManager listManager = ListManager();
  int newNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('오늘 할 일', style: TextStyle(fontSize: 20)),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: listManager.todayTasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(listManager.todayTasks[index]),
                        trailing: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                listManager.completeTask(index);
                              });
                            }),
                      );
                    })),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('완료한 일', style: TextStyle(fontSize: 20)),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: listManager.completedTasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.check_circle),
                        title: Text(listManager.completedTasks[index]),
                        trailing: IconButton(
                            icon: const Icon(Icons.undo),
                            onPressed: () {
                              setState(() {
                                listManager.undoCompleteTask(index);
                              });
                            }),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            listManager.addTodayTask("새로운 할일 ${newNumber + 1}");
            newNumber += 1;
          });
        },
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
    );
  }
}
