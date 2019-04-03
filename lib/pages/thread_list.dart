import 'package:flutter/material.dart';
import '../widgets/threads.dart';
import '../services/global_service.dart';

class ThreadListPage extends StatefulWidget {
  final GlobalService _service;

  ThreadListPage(this._service);

  @override
  State<StatefulWidget> createState() {
    return _TreadListState();
  }
}

class _TreadListState extends State<ThreadListPage> {
  @override
  initState() {
    super.initState();
  }

  Widget _buildList() {
    return Threads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}
