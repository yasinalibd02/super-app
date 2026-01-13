// ignore_for_file: library_private_types_in_public_api

import '../base/app_core.dart';
import 'text.dart';

abstract class DropdownModel {
  String get title;
}

class CustomDropDown<T> extends StatefulWidget {
  String selectMethod;
  final List<T> itemsList;
  final void Function(T?)? onChanged;
  final bool showSearchField; // Control visibility of the search field
  final bool isReg; // Control visibility of the search field
  final String subtitle;
  final Decoration? decoration;
  final Color? labelColor;
  final double? inputBoxHeight;
  final Color? dropdownIconColor;
  final Widget? leading;
  final EdgeInsets? fieldPadding;
  final String label;
  CustomDropDown({
    required this.itemsList,
    required this.selectMethod,
    this.onChanged,
    this.inputBoxHeight,
    this.decoration,
    this.labelColor,
    this.label = '',
    this.dropdownIconColor,
    this.leading,
    this.fieldPadding,
    this.showSearchField = false, // Default is false (no search field)
    this.isReg = false, // Default is false (no search field)
    this.subtitle = '',
    super.key,
  });

  @override
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>>
    with SingleTickerProviderStateMixin {
  bool isDropdownOpened = false;
  final LayerLink _layerLink = LayerLink();
  TextEditingController searchController = TextEditingController();
  List<T> filteredItems = [];
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.itemsList;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    if (isDropdownOpened) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var screenHeight = MediaQuery.of(context).size.height;
    var spaceBelow =
        screenHeight - renderBox.localToGlobal(Offset.zero).dy - size.height;
    var spaceAbove = renderBox.localToGlobal(Offset.zero).dy;

    double itemHeight = 48.0;
    int maxVisibleItems = 6;
    double dropdownHeight = _calculateDropdownHeight(
      itemHeight,
      maxVisibleItems,
    );

    double spaceThresholdAbove = dropdownHeight - 20.0;
    bool openUpwards =
        spaceBelow < dropdownHeight && spaceAbove > spaceThresholdAbove;

    if (openUpwards && spaceAbove < dropdownHeight) {
      dropdownHeight = spaceAbove - 10.0;
    }

    _overlayEntry = _createOverlayEntry(
      openUpwards: openUpwards,
      dropdownHeight: dropdownHeight,
    );
    Overlay.of(context).insert(_overlayEntry!);

    setState(() {
      isDropdownOpened = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      isDropdownOpened = false;
      searchController.clear();
      filteredItems = widget.itemsList;
    });
  }

  OverlayEntry _createOverlayEntry({
    bool openUpwards = false,
    double dropdownHeight = 200.0,
  }) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(
                  0.0,
                  openUpwards
                      ? -dropdownHeight - size.height * 0.08
                      : size.height,
                ),
                child: _buildDropdownList(dropdownHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateDropdownHeight(double itemHeight, int maxVisibleItems) {
    return filteredItems.length <= maxVisibleItems
        ? filteredItems.length * itemHeight
        : maxVisibleItems * itemHeight;
  }

  Widget _buildDropdownList(double dropdownHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        elevation: 2,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: AppSize.vertical * 0.5),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              if (widget.showSearchField) _buildSearchField(),
              if (filteredItems.isNotEmpty)
                _buildFilteredItemsList(dropdownHeight)
              else
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomText("No data found", typo: Typo.tm),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.horizontal * 0.5),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            filteredItems = widget.itemsList
                .where(
                  (item) => _getItemTitle(
                    item,
                  ).toLowerCase().contains(value.toLowerCase()),
                )
                .toList();
          });
        },
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildFilteredItemsList(double dropdownHeight) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: dropdownHeight),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final value = filteredItems[index];
          return _buildDropdownItem(value);
        },
      ),
    );
  }

  Widget _buildDropdownItem(T value) {
    final itemTitle = _getItemTitle(value);

    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(value);
        widget.selectMethod = itemTitle;
        _closeDropdown();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: widget.selectMethod == itemTitle
              ? AppColors.primaryColor.withOpacity(0.6)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: CustomText(
            itemTitle,
            typo: Typo.bm,
            color: widget.selectMethod == itemTitle ? Colors.white : null,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != '')
            Column(
              children: [
                Space.height.h10,
                CustomText(widget.label, typo: Typo.ls),
                Space.height.h10,
              ],
            ),
          Container(
            height: widget.inputBoxHeight ?? 44,
            decoration:
                widget.decoration ??
                BoxDecoration(
                  border: Border.all(
                    color: isDropdownOpened
                        ? AppColors.primaryColor
                        : AppColors.textColor.withValues(alpha: 0.2),
                    width: isDropdownOpened ? 1 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
            child: Padding(
              padding:
                  widget.fieldPadding ??
                  const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    isDropdownOpened
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_outlined,
                    color:
                        widget.dropdownIconColor ??
                        (isDropdownOpened
                            ? AppColors.primaryColor
                            : AppColors.textColor.withValues(alpha: 0.7)),
                  ),
                  Expanded(
                    child: CustomText(
                      widget.selectMethod,
                      style: AppStyle.title2.copyWith(
                        color:
                            widget.labelColor ??
                            (isDropdownOpened ? AppColors.primaryColor : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getItemTitle(T item) {
    if (item is DropdownModel) {
      return item.title;
    } else if (item is String) {
      return item;
    } else {
      throw ArgumentError('Unsupported item type: ${item.runtimeType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: _buildDropdownButton(context),
    );
  }
}
