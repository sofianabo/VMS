import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWithSuggestions extends StatefulWidget {
  final ValueChanged<String> onItemSelected;
  final VoidCallback? click;

  const SearchWithSuggestions({
    Key? key,
    required this.onItemSelected,
    this.click,
  }) : super(key: key);

  @override
  _SearchWithSuggestionsState createState() => _SearchWithSuggestionsState();
}

class _SearchWithSuggestionsState extends State<SearchWithSuggestions> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final List<String> items = [
    "Exam Table",
    "Dashboard",
    "Enroll Requests",
    "School Time Table",
    "All Students",
    "Study Year Students",
    "All Guardians",
    "Student Attendance",
    "Students Attendance Managment",
    "Teacher Management",
    "Teacher Status",
    "Teacher Attendance Managment",
    "Employee Management",
    "Employee Attendance",
    "Employee Attendance Manage",
    "Virtual User Management",
    "Session Management",
    "Grade Management",
    "Subject Management",
    "Class Management",
    "Division Management",
    "Curriculum Management",
    "School Data Management",
    "Electronic Library",
    "Transaction",
    "Illness Screen",
    "Vaccine Screen",
  ];

  List<String> _filteredItems = [];

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      _hideOverlay();
      return;
    }

    _filteredItems = items.where((item) {
      final localized = item.tr.toLowerCase();
      return item.toLowerCase().contains(query.toLowerCase()) ||
          localized.contains(query.toLowerCase());
    }).toList();

    if (_filteredItems.isNotEmpty) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    _hideOverlay();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 220,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 50),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _filteredItems.map((item) {
                return GestureDetector(
                  onTap: () {
                    _controller.text = item.tr;
                    widget.onItemSelected(item);
                    _hideOverlay();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[300]!)),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.tr, // تطبيق .tr هنا لترجمة النص
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: 220,
        height: 40,
        child: TextField(
          controller: _controller,
          onChanged: _filterSearchResults,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: "Search".tr,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: GestureDetector(
              onTap: () {
                if (_controller.text.isNotEmpty) {
                  _controller.clear();
                  if (widget.click != null) {
                    widget.click!();
                  }
                }
              },
              child: Icon(
                _controller.text.isNotEmpty && _controller.text != ""
                    ? Icons.clear
                    : Icons.search,
                color: const Color(0xffB3B3B3),
                size: 16,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Theme.of(context).highlightColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xffB3B3B3)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
