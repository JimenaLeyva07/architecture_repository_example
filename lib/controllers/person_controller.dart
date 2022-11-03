import 'package:architecture_repository_example/models/person_model.dart';
import 'package:architecture_repository_example/repositories/person_repository.dart';
import 'package:architecture_repository_example/service/person_database_fake.dart';

class PersonController {
  late PersonRepository _personRepository;
  
  PersonController(PersonDatabaseFake db){
    _personRepository = PersonRepository(db);
  }

  Future<void> add(PersonModel personModel) async{
    _personRepository.add(personModel);
  }

  Future<List<PersonModel>> getPeople() async{
    return _personRepository.getPeople();
  }
}

final PersonController personController = PersonController(PersonDatabaseFake());