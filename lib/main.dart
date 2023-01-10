import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';

void main() {
  runApp(const MyApp());
}

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
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          if(idx == 0){
            return Container(
              child: Text("오늘하루", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            );
          } else if(idx == 1){
            return Container(
              child: Column(
                children: List.generate(todos.length, (_idx){
                  Todo t = todos[_idx];
                  
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(t.color),
                      borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(t.title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text(t.done == 0 ? "미완료" : "완료", style: TextStyle(color: Colors.white),)
                        ],
                        ),
                        Container(height: 12),
                        Text(t.memo, style: TextStyle(color: Colors.white),)
                    ],
                    ),
                  );
                }),
            ));
          }
        
        else if(idx == 2){
            return Container(
              child: Text("완료된 하루", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            );
          } else if(idx == 3){
            return Container(
              child: Column(
                children: List.generate(todos.length, (_idx){
                  Todo t = todos[_idx];
                  
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(t.color),
                      borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(t.title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text(t.done == 0 ? "미완료" : "완료", style: TextStyle(color: Colors.white),)
                        ],
                        ),
                        Container(height: 12),
                        Text(t.memo, style: TextStyle(color: Colors.white),)
                    ],
                    ),
                  );
                }),
            ));
          }
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
