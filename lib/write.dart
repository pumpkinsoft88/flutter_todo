import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'data/todo.dart';

class TodoWritePage extends StatefulWidget {

  final Todo todo;

  const TodoWritePage({Key key, this.todo}) : super(key: key);

  @override
  State<TodoWritePage> createState() {
    return _TodoWritePageState();
  }
}

class _TodoWritePageState extends State<TodoWritePage> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text("저장", style: TextStyle(color: Colors.white),),
            onPressed: () {
              // 페이지 저장시 사용
              
            },
            )
        ],
      ),
      body: ListView.builder(itemBuilder: (ctx, idx){
        if(idx==0){
          return Container(
            child: Text("제목"),
          );
        }  else if(idx==1){
            return Container(
              child: TextField(
                controller: nameController,
              ),
            );
            }
            return Container();
gi            // CH02-3_TODO화면만들기 Step 2 23분 37초 부터 다시 시작
        },
      itemCount: 6,
      ),
    );
  }
}
