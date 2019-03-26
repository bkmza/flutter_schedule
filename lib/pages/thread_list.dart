import 'package:flutter/material.dart';
import '../widgets/threads.dart';

class ThreadListPage extends StatefulWidget {
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
