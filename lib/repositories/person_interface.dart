import 'package:architecture_repository_example/models/person_model.dart';

abstract class IPersonInterface{
  Future<void> add(PersonModel personModel);
  Future<List<PersonModel>> getPeople();
}