import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({Key? key}) : super(key: key);

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  bool isShowDropdown = false;
  OverlayEntry? entry;
  final LayerLink layerLink = LayerLink();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isShowDropdown = !isShowDropdown;
        if (isShowDropdown) {
          showDropDown();
        } else {
          disposeOverlay();
        }
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: Container(
          height: 100,
        ),
      ),
    );
  }

  void showDropDown() {
    final OverlayState? overlay = Overlay.of(context);
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          height: 100,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(0, size?.height ?? 0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: size?.width ?? MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'This is dropdown widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    overlay?.insert(entry!);
  }

  void disposeOverlay() {
    entry?.remove();
    entry = null;
  }
}
