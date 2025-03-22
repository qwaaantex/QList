import 'package:flutter/cupertino.dart';

class ProviderList extends ChangeNotifier {
  final List _notes = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerEditing = TextEditingController();
  final GlobalKey<AnimatedListState> _animatedList =
      GlobalKey<AnimatedListState>();
  List get notes => _notes;
  TextEditingController get controller => _controller;
  TextEditingController get controllerediting => _controllerEditing;
  GlobalKey get animatedList => _animatedList;

  void addNotes(text) {
    if (text.isNotEmpty) {
      _notes.add(text);
      _animatedList.currentState?.insertItem(
        _notes.length - 1,
        duration: Duration(milliseconds: 400),
      );
      notifyListeners();
    }
  }

  void editNotes(text, index, context) {
    if (_notes.isNotEmpty) {
      _notes.removeAt(index);
      _notes.insert(index, text);
      notifyListeners();
    }
  }

  void clearAllNotes() {
    _controller.clear();
  }

  void remoteNotesAll() {
    _notes.clear();
    notifyListeners();
  }

  void remoteNotes(index) {
    _notes.isEmpty ? null : _notes.removeAt(index);

    notifyListeners();
  }
}
