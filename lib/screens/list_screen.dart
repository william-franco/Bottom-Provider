import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bottom_provider/providers/list_provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  final String title = 'List';

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => list.decrement(),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.all(19.0),
          title: Text(
            title,
            style: const TextStyle(fontSize: 26.0),
          ),
        ),
      ),
      body: _buildBody(context, list),
      floatingActionButton: _floatingAB(context, list),
    );
  }

  Widget _buildBody(BuildContext context, ListProvider list) {
    return list.numbers.isEmpty
        ? const Center(child: Text('The list is empty.'))
        : CupertinoScrollbar(
            child: SafeArea(
              child: ListView.separated(
                itemCount: list.numbers.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return Ink(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('$index'),
                      ),
                      title: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          );
  }

  Widget _floatingAB(BuildContext context, ListProvider list) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      key: const Key('addItem_FAB'),
      tooltip: 'Increment',
      onPressed: () => list.increment(),
    );
  }
}
