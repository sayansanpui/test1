import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class MultipleSelectMenu extends StatefulWidget {
  final String labelName;
  final String? hint;
  final List? items;
  final String? api;
  final double? width;
  final String? firstItem;
  final ValueChanged<List<String>> onChanged;
  final String searchKey;

  MultipleSelectMenu(
      {super.key,
      required this.labelName,
      required this.hint,
      this.items = const [],
      this.api,
      this.width,
      this.firstItem,
      required this.onChanged,
      required this.searchKey});

  @override
  State<MultipleSelectMenu> createState() => _MultipleSelectMenuState();
}

// ignore: camel_case_types
class _MultipleSelectMenuState extends State<MultipleSelectMenu> {
  List<String> _selectedItems = [];
  List<String> _dropdownItems = [];
  List<String> _tempSelectedItems = [];
  bool _isLoading = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.api != null) {
      fetchData();
    } else {
      _isLoading = false;
      _dropdownItems = List<String>.from(widget.items as Iterable);
    }

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(widget.api!));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _dropdownItems =
              data.map((item) => item[widget.searchKey].toString()).toList();
          if (widget.firstItem != null) {
            _dropdownItems.insert(0, widget.firstItem!);
          }
          _isLoading = false; // Data fetched, stop loading
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading on error
      });
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonFormField<String>(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: Text(_selectedItems.isEmpty
                          ? "Select values"
                          : _selectedItems.join(', ')),
                      value: null,
                      isExpanded: true,
                      items: _dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Checkbox(
                                      value: _tempSelectedItems.contains(item),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            _tempSelectedItems.add(item);
                                          } else {
                                            _tempSelectedItems.remove(item);
                                          }
                                        });
                                      },
                                      activeColor: Colors.grey[300],
                                      checkColor: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }).toList()
                        ..add(
                          DropdownMenuItem<String>(
                            enabled: false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _tempSelectedItems =
                                          List.from(_selectedItems);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selectedItems =
                                          List.from(_tempSelectedItems);
                                      widget.onChanged(_selectedItems);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      onChanged: (_) {},
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
