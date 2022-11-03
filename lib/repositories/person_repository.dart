import 'package:architecture_repository_example/models/person_model.dart';
import 'package:architecture_repository_example/repositories/person_interface.dart';
import 'package:architecture_repository_example/service/person_database_fake.dart';

class PersonRepository implements IPersonInterface{

  final PersonDatabaseFake _db; 

  PersonRepository(this._db);

  @override
  Future<void> add(PersonModel personModel) async{    
   final personJson = personModel.toJson();
   await _db.add(personJson);
  }

  @override
  Future<List<PersonModel>> getPeople() async{
    final List<PersonModel> peopleList = [];
    final List<Map<String, dynamic>> dataJson = await _db.getData();
    for (var element in dataJson) {
      peopleList.add(PersonModel.fromJson(element));
    }
    return peopleList;
  }
}