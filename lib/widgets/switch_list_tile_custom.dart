import 'package:flutter/material.dart';

class SwitchListTileCustom extends StatefulWidget {
  const SwitchListTileCustom({
    super.key,
    required this.title,
    required this.description,
    required this.onSelect,
    required this.filterValue,
  });

  final String title;
  final String description;
  final bool filterValue;

  final void Function(bool filterValue, String filterType) onSelect;

  @override
  State<SwitchListTileCustom> createState() => _SwitchListTileCustomState();
}

class _SwitchListTileCustomState extends State<SwitchListTileCustom> {
  bool _filterStateValue = false;

  @override
  void initState() {
    _filterStateValue = widget.filterValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;

    return SwitchListTile(
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: isDark ? Colors.white : Colors.grey[900]),
      ),
      subtitle: Text(
        widget.description,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.grey[900],
        ),
      ),
      activeColor: isDark ? Colors.green[700] : Theme.of(context).primaryColor,
      inactiveTrackColor: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
      value: _filterStateValue,
      onChanged: (value) {
        widget.onSelect(value, widget.title);
        _filterStateValue = value;
      },
    );
  }
}
