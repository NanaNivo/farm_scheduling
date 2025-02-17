import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget? child;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(T, int) onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>>? items;
  final DropdownStyle? dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle? dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon? icon;
  final bool? hideIcon;

  final bool? textOnly;

  final Widget? prefixIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool? leadingIcon;

 const CustomDropdown({
    this.hideIcon = false,
     this.child,
     this.items,
    this.textOnly = false,
    this.dropdownStyle ,
    this.dropdownButtonStyle ,
    this.icon,
    this.prefixIcon,
    this.leadingIcon = false,
    required this.onChange,
  }) ;

  @override
  CustomDropdownState<T> createState() => CustomDropdownState<T>();
}




class CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
 late AnimationController _animationController;
 late Animation<double> _expandAnimation;
 late Animation<double> _rotateAnimation;

  bool get isRTL => Directionality.of(context) == TextDirection.rtl;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    Function eq = const DeepCollectionEquality.unordered().equals;
    if (!eq(oldWidget.items,widget.items)) {
      print('${oldWidget.items} ${widget.items}');
      _currentIndex = -1;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    if (_currentIndex >= widget.items!.length) {
      _currentIndex = -1;
    }
    return CompositedTransformTarget(
      link: this._layerLink,
      child: InkWell(
        onTap: _toggleDropdown,
        child: Container(
          padding: style?.padding,
          width: style?.width,
          height: style?.height,
          decoration: BoxDecoration(
            color: style?.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: style!.shadowColor!,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, style.elevation!), // changes position of shadow
              ),
            ],
            borderRadius: style.borderRadius,
          ),
          child: Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color:
                _currentIndex == -1 ? style.primaryColor : style.selectedColor ?? Colors.black,
              ),
              // This sets the icon color to the container color
              // This sets the font color to the container color
            ),
            child: Row(
              mainAxisAlignment: style.mainAxisAlignment ?? MainAxisAlignment.center,
              textDirection: Directionality.of(context),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_currentIndex == -1) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.prefixIcon != null) widget.prefixIcon??SizedBox(),
                      widget.child??SizedBox(),
                    ],
                  )
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.prefixIcon != null) widget.prefixIcon??SizedBox(),
                      if (widget.textOnly!)
                        Text(
                          widget.items![_currentIndex].item!,
                          style: style.selectedTextStyle ??
                              const TextStyle(fontWeight: FontWeight.bold),
                        )
                      else
                        widget.items![_currentIndex].child!,
                    ],
                  )
                ],
                if (!widget.hideIcon!)
                  RotationTransition(
                    turns: _rotateAnimation,
                    child: widget.icon ?? Icon(FontAwesomeIcons.caretDown),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox?.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size!.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle?.width ?? size.width,
                child: CompositedTransformFollower(
                  offset: widget.dropdownStyle?.offset ?? Offset(0, size.height + 5),
                  link: this._layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle?.elevation ?? 0,
                    borderRadius: widget.dropdownStyle?.borderRadius ?? BorderRadius.zero,
                    color: widget.dropdownStyle?.color,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle?.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height - topOffset - 15,
                            ),
                        child: ListView(
                          padding: widget.dropdownStyle?.padding ?? EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.items!.asMap().entries.map((item) {
                            return InkWell(
                              onTap: () {
                                setState(() => _currentIndex = item.key);
                                widget.onChange(item.value.value!, item.key);
                                _toggleDropdown();
                              },
                              // ignore: null_aware_in_condition
                              child: item.value.child,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      this._overlayEntry!.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry!);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T>  {
  final T? value;
  final Widget? child;
  final String? item;

  const DropdownItem({Key? key, this.value, this.child, this.item});// : super(key: key);

  @override
  bool operator ==(Object other) {
    return other is DropdownItem && other.value == value && other.item == item;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return child;
  // }

  @override
  int get hashCode => value.hashCode ^ item.hashCode;
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? shadowColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final BorderRadius? borderRadius;
  final Color? selectedColor;
  final TextStyle? selectedTextStyle;

  const DropdownButtonStyle({
    this.selectedTextStyle,
    this.mainAxisAlignment,
    this.backgroundColor,
    this.shadowColor,
    this.borderRadius,
    this.selectedColor,
    this.primaryColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}
