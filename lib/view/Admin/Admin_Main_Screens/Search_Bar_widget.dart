import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWithSuggestions extends StatefulWidget {
  final ValueChanged<String> onItemSelected;
  final VoidCallback? click;
  bool enabled;
  bool isFull;
  double size;

  SearchWithSuggestions({
    Key? key,
    required this.onItemSelected,
    required this.enabled,
    this.isFull = false,
    this.click,
    this.size = 220,
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
    // ... بقية العناصر
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
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: widget.isFull ? MediaQuery.of(context).size.width : size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 50),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
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
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[300]!)),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.tr,
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
        width: widget.size,
        height: 40,
        child: TextField(
          enabled: widget.enabled,
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
