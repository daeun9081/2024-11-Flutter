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
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
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

class _MyListState extends State<MyList> {
  //마이리스트 상태 관리

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
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text('Item $index'),
                      );
                    })),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('완료한 일', style: TextStyle(fontSize: 20)),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text('New $index'),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
