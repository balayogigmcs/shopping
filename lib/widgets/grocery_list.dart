import 'package:flutter/material.dart';
import 'package:shopping/data/dummy_items.dart';
import 'package:shopping/widgets/newitem.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  void _addItem(){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const NewItem()));
    // remember as here statefulwidget , noneed of adding context in _addItem()
    // if it statelessWidget as doesnot know about context so instead we write here _addItem()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(groceryItems[index].name),
                leading: Container(
                  height: 24,
                  width: 24,
                  color: groceryItems[index].category.color,
                ),
                trailing: Text(groceryItems[index].quantity.toString()),
              )),
    );
  }
}
