import 'package:architecture_repository_example/controllers/person_controller.dart';
import 'package:architecture_repository_example/models/person_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  void addData(){
    setState(() {
      personController.add(PersonModel(nombre: nameController.text, edad: int.parse(ageController.text)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personas", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                CustomInput(textController: nameController, textType: TextInputType.name, label: "Nombre"),
                const SizedBox(height: 20),
                CustomInput(textController: ageController, textType: TextInputType.number, label: "Edad"),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: addData, 
                    icon: const Icon(Icons.person_add), 
                    label: const Text("Agregar"),
                    ),
                )
              ],
            ),
          ),
          Expanded(
            child: PeopleListView(personController: personController),
          )
        ],
      ),
    );
  }
}

class PeopleListView extends StatelessWidget {
  const PeopleListView({
    Key? key, required this.personController,
  }) : super(key: key);

  final PersonController personController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: personController.getPeople(),
      builder: (BuildContext context, AsyncSnapshot<List<PersonModel>> snapshot) { 
        List<PersonModel> peopleList = snapshot.data??[];
        return ListView.builder(
        itemCount: peopleList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 32.0),
            child: ListTile(
              title: Text(peopleList[index].nombre), 
              subtitle: Text(peopleList[index].edad.toString()), 
              leading: const Icon(Icons.person), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
              tileColor: Colors.grey[200],
              ),
          );
        },
      );      
     },
    );   
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.textController, required this.textType, required this.label});

  final TextEditingController textController;
  final TextInputType textType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: textType,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}

