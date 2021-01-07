import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DataBaseManagement  {
  static String dbName = "schedule_management.db";
  static String tName = "schedule";
  static int dbVersion = 1;
  static Database db;

  static Future<void> createDataBase() async {
    //数据创建
    var databasePath = await getDatabasesPath();
    var path = join(databasePath,dbName);
    print("===== ${path}");
    //打开数据库  表无需重复计算
    var database = await openDatabase(path,version: dbVersion);
    db = database;
    var createTable = '''create table ${tName}(
    uuid int primary key,
    client_user_id text,
    serverid int,
    ahead_time int,
    business_key text,
    customers text,
    deleted boolean,
    start_date int,
    end_date int,
    finished boolean,
    original_start_date int,
    original_end_date int,
    remarks text,
    reminder_time int,
    repetitive text,
    repetitive_end_date int,
    title text,
    type text,
    update_time int,
    isupload boolean
    )''';
    database.execute(createTable);

  }

  //查询数据库中是否有某个表
  Future<bool> checkTableHaveData(String tableName) async{
    if(tableName.length == 0){
      tableName = tableName;
    }
    //查表整张表
    var sql = '''select * from ${tableName}''';
    List<Map<String,dynamic>> list = await db.query(sql);
    return list.length > 0;
  }

  //删除表操作
  Future<bool> deleteTable() async{
    var sql = 'drop table ${tName}';
    db.execute(sql);
  }

  //插入数据
  Future<int> insertData() async{
    // INSERT INTO table (number, nick) VALUES (?, ?)
    /*
    uuid int primary key,
    client_user_id text,
    serverid int,
    ahead_time int,
    business_key text,
    customers text,
    deleted boolean,
    start_date int,
    end_date int,
    finished boolean,
    original_start_date int,
    original_end_date int,
    remarks text,
    reminder_time int,
    repetitive text,
    repetitive_end_date int,
    title text,
    type text,
    update_time int
    isupload boolean
    */

    var sql = '''insert into ${tName} (
      'uuid',
      'client_user_id',
      'serverid',
      'ahead_time',
      'business_key',
      'customers',
      'deleted',
      'start_date',
      'end_date',
      'finished',
      'original_start_date',
      'original_end_date',
      'remarks',
      'reminder_time',
      'repetitive',
      'repetitive_end_date',
      'title',
      'type',
      'update_time',
      'isupload'
    ) values(
      123,
      2222,
      100,
      1000,
      0,
      '12345_555_felix',
      false,
      1234567890000,
      1234567890000,
      '我要听音乐',
      3333333,
      '每天',
      33249888540584032,
      '听音乐',
      'abc',
      300000000,
      false
    )''';

    //添加数据
    var number = await db.rawInsert(sql);

    return number;
  }

}