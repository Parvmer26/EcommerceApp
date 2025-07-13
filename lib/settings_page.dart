import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return SwitchListTile(
              title: Text("Dark mode"),
              subtitle: Text("change theme to dark mode"),
              onChanged: (value) {
                themeProvider.updateTheme(value: value);
              },
              value: themeProvider.getThemeValue()
          );
        },)
    );
  }
}
