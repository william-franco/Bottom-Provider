import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bottom_provider/providers/counter_provider.dart';
import 'package:bottom_provider/providers/list_provider.dart';
import 'package:bottom_provider/providers/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  final String title = 'Settings';

  Future<void> _themeDialog(BuildContext context) async {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Theme'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RadioListTile<ThemeMode>(
                  title: const Text('Light Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.light,
                  onChanged: theme.setLightTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('Dark Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.dark,
                  onChanged: theme.setDarkTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('System Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.system,
                  onChanged: theme.setSystemTheme,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _clearCount(BuildContext context) async {
    final counter = Provider.of<CounterProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Count'),
          content: const Text('Do you want delete all items?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                counter.removeAll();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _clearList(BuildContext context) async {
    final list = Provider.of<ListProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear List'),
          content: const Text('Do you want delete all items of list?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                list.removeAll();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.all(19.0),
          title: Text(
            title,
            style: const TextStyle(fontSize: 26.0),
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Theme'),
              subtitle: const Text('Choose theme of app.'),
              onTap: () => _themeDialog(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Clear Counter'),
              subtitle: const Text('This option will erase all items.'),
              onTap: () => _clearCount(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Clear List'),
              subtitle: const Text('This option will erase all items of list.'),
              onTap: () => _clearList(context),
            ),
          ],
        ),
      ),
    );
  }
}
