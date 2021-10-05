import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bottom_provider/providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  final String title = 'Counter';

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Decrement',
            icon: const Icon(Icons.history),
            key: const Key('decrementButton'),
            onPressed: () => counter.decrement(),
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
      body: _buildBody(context, counter),
      floatingActionButton: _floatingAB(context, counter),
    );
  }

  Widget _buildBody(BuildContext context, CounterProvider counter) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${counter.count}',
              key: const Key('counterState'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingAB(BuildContext context, CounterProvider counter) {
    return FloatingActionButton(
      tooltip: 'Increment',
      child: const Icon(Icons.add),
      key: const Key('incrementFAB'),
      onPressed: () => counter.increment(),
    );
  }
}
