import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mi_primer_app/new_habit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHabitosPage extends StatefulWidget {
  const HomeHabitosPage({super.key});

  @override
  State<HomeHabitosPage> createState() => _HomeHabitosPageState();
}

class _HomeHabitosPageState extends State<HomeHabitosPage> {
  final List<Habit> habits = [];
  late final SharedPreferences prefs;
  String? action;

  // Escritura de datos
  // Lectura de datos
  // initState -> leer si tenemos informacion almacenada

  @override
  void initState() {
    super.initState();
    initShared();
  }

  initShared() async {
    prefs = await SharedPreferences.getInstance();
    getData();
  }

  saveData() async {
    await prefs.setString('test', 'Test 2');
    getData();
  }

  getData() {
    setState(() {
      action = prefs.getString('test') ?? "Sin data";
    });
    log(action!);
  }

  void _addHabit(String name, String desc) {
    setState(() {
      habits.add(
        Habit(
          name: name,
          description: desc,
        ),
      );
    });
  }

  void changeStatus(int index) {
    setState(() {
      habits[index].isComplete = !habits[index].isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestor de habitos ($action)"),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          String _name = habits[index].name;
          String _desc = habits[index].description;
          bool _isComplete = habits[index].isComplete;

          return ListTile(
            onTap: () {
              changeStatus(index);
            },
            title: Text(_name),
            subtitle: Text(_desc),
            trailing: _isComplete
                ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
                : const Icon(Icons.circle_outlined),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "floating-1",
            onPressed: () {
              saveData();
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "floating-2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewHabit(
                    submitHabit: _addHabit,
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class Habit {
  String name;
  String description;
  bool isComplete;

  Habit({
    required this.name,
    required this.description,
    this.isComplete = false,
  });

  @override
  String toString() {
    return "name: $name, description: $description, isComplete: $isComplete";
  }
}