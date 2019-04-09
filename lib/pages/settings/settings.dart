import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/global_service.dart';
import '../../helpers/app_mode.dart';

class SettingsPage extends StatefulWidget {
  final bool isOfflineMode;

  SettingsPage(this.isOfflineMode);

  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  bool _offlineMode;

  @override
  initState() {
    _offlineMode = widget.isOfflineMode;
    super.initState();
  }

  Widget _buildMockEnableRow(Function setAppModeAction) {
    return new SwitchListTile(
      value: _offlineMode,
      onChanged: (bool value) {
        setState(() {
          _offlineMode = value;
          setAppModeAction(value ? AppModeType.offline : AppModeType.online);
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
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: ScopedModelDescendant<GlobalService>(
          builder:
              (BuildContext context, Widget widget, GlobalService service) {
            return Container(
              padding: new EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[_buildMockEnableRow(service.setAppMode)],
              ),
            );
          },
        ));
  }
}
