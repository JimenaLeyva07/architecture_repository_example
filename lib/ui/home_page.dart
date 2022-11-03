import 'package:architecture_repository_example/controllers/person_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();


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
                  child: ElevatedButton.icon(onPressed: () {
                    
                  }, icon: const Icon(Icons.person_add), label: const Text("Agregar"),),
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
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 32.0),
          child: ListTile(
            title: Text("Jimena"), 
            subtitle: Text("25"), 
            leading: Icon(Icons.person), 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
            tileColor: Colors.grey[200],
            ),
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

