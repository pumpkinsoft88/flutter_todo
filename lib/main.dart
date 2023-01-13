import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/data/util.dart';
import 'package:todo/write.dart';

void main() {
  runApp(const MyApp());
}

// CH02-5 TODO 기록화면 만들기 0:00부터 시작하기
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [
    Todo(
      title: "패스트 캠퍼스 강의듣기",
      memo: "앱개발 입문강의 듣기",
      color: Colors.redAccent.value,
      done: 0,
      category: "공부",
      date: 20230109,
    ),
    Todo(
      title: "패스트 캠퍼스 강의듣기2",
      memo: "앱개발 입문강의 듣기",
      color: Colors.blue.value,
      done: 1,
      category: "공부",
      date: 20230109,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () async {
            Todo todo = await Navigator.of(context).push(MaterialPageRoute(
                builder: (cdx) => TodoWritePage(
                      todo: Todo(
                        title: "",
                        color: 0,
                        memo: "",
                        done: 0,
                        category: "",
                        date: Utils.getFormatTime(DateTime.now()),
                      ),
                    )));

            setState(() {
              todos.add(todo);
            });
          }),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          if (idx == 0) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: const Text(
                "오늘하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else if (idx == 1) {
            List<Todo> undone = todos.where((t) {
              return t.done == 0;
            }).toList();

            return Container(
                child: Column(
              children: List.generate(undone.length, (idx) {
                Todo t = undone[idx];

                return InkWell(
                  child: TodoCardWidget(t: t),
                  onTap: () {
                    setState(() {
                      if (t.done == 0) {
                        t.done = 1;
                      } else {
                        t.done = 0;
                      }
                    });
                  },
                  onLongPress: () async {
                    Todo todo = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (cdx) => TodoWritePage(todo: t)));
                    setState(() {});
                  },
                );
              }),
            ));
          } else if (idx == 2) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: const Text(
                "완료된 하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else if (idx == 3) {
            List<Todo> done = todos.where((t) {
              return t.done == 1;
            }).toList();

            return Container(
                child: Column(
              children: List.generate(done.length, (idx) {
                Todo t = done[idx];

                return InkWell(
                  child: TodoCardWidget(t: t),
                  onTap: () {
                    setState(() {
                      if (t.done == 0) {
                        t.done = 1;
                      } else {
                        t.done = 0;
                      }
                    });
                  },
                  onLongPress: () async {
                    Todo todo = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (cdx) => TodoWritePage(todo: t)));
                    setState(() {});
                  },
                );
              }),
            ));
          }

          return Container();
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: "오늘",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: "기록",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "더보기",
          ),
        ],
      ),
    );
  }
}

class TodoCardWidget extends StatelessWidget {
  final Todo t;
  const TodoCardWidget({Key key, this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(t.color), borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                t.done == 0 ? "미완료" : "완료",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          Container(height: 12),
          Text(
            t.memo,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
