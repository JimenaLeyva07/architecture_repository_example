import 'package:flutter/foundation.dart';

class PersonDatabaseFake {

  final List<Map<String, dynamic>> _people = [];

  PersonDatabaseFake._privateConstructor();

  static final PersonDatabaseFake _db = PersonDatabaseFake._privateConstructor();

  factory PersonDatabaseFake(){
    return _db;
  }

  Future<void> add(Map<String, dynamic> person) async{
    _people.add(person);
  }

  Future<List<Map<String, dynamic>>> getData() async{
    return _people;
  }
  
}