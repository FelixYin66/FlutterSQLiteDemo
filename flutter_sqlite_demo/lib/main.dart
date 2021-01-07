import 'package:flutter/material.dart';
import 'database_management.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "SQLiteDemo",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
        ),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          FlatButton(onPressed: (){
            createDataBase();
          }, child: Text("创建数据库")),
          FlatButton(onPressed: (){
            insterData();
          }, child: Text("添加数据")),
          FlatButton(onPressed: (){
            deleteData();
          }, child: Text("删除数据")),
          FlatButton(onPressed: (){
            modifyData();
          }, child: Text("修改数据")),
          FlatButton(onPressed: (){
            searchData();
          }, child: Text("查询数据"))
        ],
      ),
    );
  }

  void createDataBase(){
    print("创建数据库");
    DataBaseManagement.createDataBase();
  }

  void insterData(){
    print("插入数据");
  }

  void deleteData(){
    print("删除数据");
  }

  void modifyData(){
    print("修改数据");
  }

  void searchData(){
    print("查询数据");
  }

}


