import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/global_service.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  bool _offlineMode = true;

  @override
  initState() {
    super.initState();
  }

  Widget _buildMockEnableRow(Function offlineModeAction) {
    return new SwitchListTile(
      value: _offlineMode,
      onChanged: (bool value) {
        setState(() {
          _offlineMode = value;
          offlineModeAction(value);
        });
      },
      title: new Text('Offline mode (local data generation)',
          style: new TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: ScopedModelDescendant<GlobalService>(
          builder:
              (BuildContext context, Widget widget, GlobalService service) {
            return Container(
              padding: new EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[_buildMockEnableRow(service.setOfflineMode)],
              ),
            );
          },
        ));
  }
}
