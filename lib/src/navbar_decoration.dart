import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';

class NavbarItem {
  const NavbarItem(
    this.iconData,
    this.text, {
    this.backgroundColor,
    this.child,
    this.selectedIcon,
    this.unselectedIcon,
    this.badge = const NavbarBadge(),
  });

  /// IconData for the navbar item
  final IconData iconData;

  /// label for the navbar item
  final String text;

  /// background color for the navbar item when type is [NavbarType.shifting]
  /// ignored otherwise
  final Color? backgroundColor;

  /// When child is specified, the item will be rendered as a floating navbar
  /// ignoring iconData and text
  final Widget? child;

  /// Widget to show when the item is selected
  final Widget? selectedIcon;

  /// Your initial badge configuration for this item, this is totally optional
  final NavbarBadge badge;

  /// Widget to show when the item is unselected
  final Widget? unselectedIcon;

  @override
  bool operator ==(Object other) {
    bool result =
        other is NavbarItem &&
        runtimeType == other.runtimeType &&
        iconData == other.iconData &&
        text == other.text &&
        child.runtimeType == other.child.runtimeType &&
        selectedIcon.runtimeType == other.selectedIcon.runtimeType &&
        unselectedIcon.runtimeType == other.unselectedIcon.runtimeType &&
        backgroundColor == other.backgroundColor &&
        badge == other.badge;
    if ((other as NavbarItem).selectedIcon.runtimeType == Icon && result) {
      result =
          (selectedIcon as Icon).color == (other.selectedIcon as Icon).color &&
          (selectedIcon as Icon).icon == (other.selectedIcon as Icon).icon &&
          (selectedIcon as Icon).size == (other.selectedIcon as Icon).size;
    }
    return identical(this, other) || result;
  }

  @override
  int get hashCode =>
      iconData.hashCode ^
      text.hashCode ^
      child.hashCode ^
      selectedIcon.hashCode ^
      unselectedIcon.hashCode ^
      backgroundColor.hashCode ^
      badge.hashCode;
}

/// Decoration class for the navbar [NavbarType.standard]
/// if you are using Navbartype.notched then use [NotchedDecoration] instead.
class NavbarDecoration {
  /// The type of the Navbar to be displayed
  /// [BottomNavigationBarType.fixed] or [BottomNavigationBarType.shifting]
  final BottomNavigationBarType? navbarType;
  final Widget? selectedIcon;
  final Widget? unselectedIcon;
  final Widget? child;

  /// The backgroundColor of the Navbar
  final Color? backgroundColor;

  /// Defines whether the Navbar is extended in Desktop mode
  /// defaults to false
  final bool isExtended;

  /// The smallest possible width for the navbar when `NavbarRouter.isDesktop` is True, this width is regardless of the navbar's icon or label size.
  /// The default is 72.
  final double minWidth;

  /// Width when `isExtended` is True, The default value is 256.
  final double minExtendedWidth;

  /// The color of the unselected item
  final Color? unselectedItemColor;

  /// The elevation shadown on the edges of bottomnavigationbar
  final double? elevation;

  /// The color of the unselected item icon
  final Color? unselectedIconColor;

  /// The icon color of the selected NavbarItem
  /// if NavbarItem.selectedIcon is specified then this is ignored
  final Color? selectedIconColor;

  /// Whether or not to show the unselected label text
  /// When in DesktopMode, either isExtended is False or showUnselectedLabels is True
  final bool showUnselectedLabels;

  /// The color of the unselected label text
  final Color? unselectedLabelColor;

  /// whether or not to show the selected label text
  final bool? showSelectedLabels;

  /// haptic feedback when the item is selected
  final bool? enableFeedback;

  /// margin for floating navbar
  /// defaults to EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
  final EdgeInsetsGeometry? margin;

  /// the text style of the selected label
  final TextStyle? selectedLabelTextStyle;

  /// the text style of the unselected labels
  final TextStyle? unselectedLabelTextStyle;

  /// iconTheme for the selected icon
  final IconThemeData? selectedIconTheme;

  /// iconTheme for the unselected icon
  final IconThemeData? unselectedIconTheme;

  final Color? indicatorColor;

  /// BorderRadius for floating navbar
  final BorderRadius? borderRadius;

  /// Specifies when each [NavigationDestination]'s label should appear.
  /// This is used to determine the behavior of [NavigationBar]'s destinations
  final NavigationDestinationLabelBehavior? labelBehavior;

  final double? height;

  final ShapeBorder? indicatorShape;

  NavbarDecoration({
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.enableFeedback,
    this.isExtended = false,
    this.selectedIcon,
    this.unselectedIcon,
    this.child,
    this.indicatorColor,
    this.navbarType,
    this.height = 80,
    this.margin,
    this.minExtendedWidth = 256,
    this.minWidth = 72,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
    this.indicatorShape,
    this.showSelectedLabels,
    this.showUnselectedLabels = true,
    this.selectedIconColor,
    this.selectedIconTheme,
    this.selectedLabelTextStyle,
    this.unselectedIconTheme,
    this.unselectedLabelTextStyle,
    this.unselectedIconColor,
    this.unselectedItemColor,
    this.unselectedLabelColor,
  });

  // copyWith
  NavbarDecoration copyWith({
    BottomNavigationBarType? navbarType,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool? isExtended,
    Color? unselectedItemColor,
    double? elevation,
    Widget? selectedIcon,
    Widget? unselectedIcon,
    Widget? child,
    double? height,
    double? minWidth,
    double? minExtendedWidth,
    Color? unselectedIconColor,
    bool? showUnselectedLabels,
    Color? unselectedLabelColor,
    bool? showSelectedLabels,
    bool? enableFeedback,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
    Color? selectedIconColor,
    EdgeInsetsGeometry? margin,
    NavigationDestinationLabelBehavior? labelBehavior,
    TextStyle? selectedLabelTextStyle,
    TextStyle? unselectedLabelTextStyle,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
  }) => NavbarDecoration(
    navbarType: navbarType ?? this.navbarType,
    selectedIcon: selectedIcon ?? this.selectedIcon,
    unselectedIcon: unselectedIcon ?? this.unselectedIcon,
    child: child ?? this.child,
    height: height ?? this.height,
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderRadius: borderRadius ?? this.borderRadius,
    isExtended: isExtended ?? this.isExtended,
    margin: margin ?? this.margin,
    minExtendedWidth: minExtendedWidth ?? this.minExtendedWidth,
    minWidth: minWidth ?? this.minWidth,
    unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
    elevation: elevation ?? this.elevation,
    unselectedIconColor: unselectedIconColor ?? this.unselectedIconColor,
    selectedIconColor: selectedIconColor ?? this.selectedIconColor,
    showUnselectedLabels: showUnselectedLabels ?? this.showUnselectedLabels,
    unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
    showSelectedLabels: showSelectedLabels ?? this.showSelectedLabels,
    enableFeedback: enableFeedback ?? this.enableFeedback,
    indicatorColor: indicatorColor ?? this.indicatorColor,
    labelBehavior: labelBehavior ?? this.labelBehavior,
    indicatorShape: indicatorShape ?? this.indicatorShape,
    selectedLabelTextStyle:
        selectedLabelTextStyle ?? this.selectedLabelTextStyle,
    unselectedLabelTextStyle:
        unselectedLabelTextStyle ?? this.unselectedLabelTextStyle,
    selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
    unselectedIconTheme: unselectedIconTheme ?? this.unselectedIconTheme,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavbarDecoration &&
          runtimeType == other.runtimeType &&
          backgroundColor == other.backgroundColor &&
          borderRadius == other.borderRadius &&
          isExtended == other.isExtended &&
          unselectedItemColor == other.unselectedItemColor &&
          elevation == other.elevation &&
          minWidth == other.minWidth &&
          minExtendedWidth == other.minExtendedWidth &&
          unselectedIconColor == other.unselectedIconColor &&
          selectedIconColor == other.selectedIconColor &&
          showUnselectedLabels == other.showUnselectedLabels &&
          unselectedLabelColor == other.unselectedLabelColor &&
          showSelectedLabels == other.showSelectedLabels &&
          enableFeedback == other.enableFeedback &&
          indicatorColor == other.indicatorColor &&
          labelBehavior == other.labelBehavior &&
          indicatorShape == other.indicatorShape &&
          selectedLabelTextStyle == other.selectedLabelTextStyle &&
          unselectedLabelTextStyle == other.unselectedLabelTextStyle &&
          selectedIconTheme == other.selectedIconTheme &&
          unselectedIconTheme == other.unselectedIconTheme &&
          selectedIcon == other.selectedIcon &&
          unselectedIcon == other.unselectedIcon &&
          child == other.child;

  @override
  int get hashCode =>
      backgroundColor.hashCode ^
      borderRadius.hashCode ^
      isExtended.hashCode ^
      unselectedItemColor.hashCode ^
      elevation.hashCode ^
      minWidth.hashCode ^
      minExtendedWidth.hashCode ^
      unselectedIconColor.hashCode ^
      selectedIconColor.hashCode ^
      showUnselectedLabels.hashCode ^
      unselectedLabelColor.hashCode ^
      showSelectedLabels.hashCode ^
      enableFeedback.hashCode ^
      indicatorColor.hashCode ^
      labelBehavior.hashCode ^
      indicatorShape.hashCode ^
      selectedLabelTextStyle.hashCode ^
      unselectedLabelTextStyle.hashCode ^
      selectedIconTheme.hashCode ^
      unselectedIconTheme.hashCode ^
      selectedIcon.hashCode ^
      unselectedIcon.hashCode ^
      child.hashCode;
}

class NotchedDecoration extends NavbarDecoration {
  NotchedDecoration({
    super.backgroundColor,
    super.elevation,
    bool? showUnselectedLabels = true,
    super.unselectedLabelTextStyle,
    super.unselectedIconColor,
    super.selectedIconColor,
    super.unselectedLabelColor,
    super.selectedIconTheme,
  }) : super(showUnselectedLabels: showUnselectedLabels!);

  factory NotchedDecoration.fromNavbarDecoration(
    NavbarDecoration navbarDecoration,
  ) => NotchedDecoration(
    backgroundColor: navbarDecoration.backgroundColor,
    elevation: navbarDecoration.elevation,
    unselectedIconColor: navbarDecoration.unselectedIconColor,
    showUnselectedLabels: navbarDecoration.showUnselectedLabels,
    selectedIconColor: navbarDecoration.selectedIconColor,
    unselectedLabelColor: navbarDecoration.unselectedLabelColor,
    unselectedLabelTextStyle: navbarDecoration.unselectedLabelTextStyle,
    selectedIconTheme: navbarDecoration.selectedIconTheme,
  );

  /// to navb bar decoration

  NavbarDecoration toNavbarDecoration() => NavbarDecoration(
    backgroundColor: backgroundColor,
    elevation: elevation,
    unselectedItemColor: unselectedItemColor,
    unselectedIconColor: unselectedIconColor,
    showUnselectedLabels: showUnselectedLabels,
    selectedIconColor: selectedIconColor,
    unselectedLabelColor: unselectedLabelColor,
    unselectedLabelTextStyle: unselectedLabelTextStyle,
  );
}

class M3NavbarDecoration extends NavbarDecoration {
  M3NavbarDecoration({
    /// The backgroundColor of the Navbar
    super.backgroundColor,

    /// Defines whether to show/hide labels
    NavigationDestinationLabelBehavior super.labelBehavior,

    /// Color for the indicator shown around the seleccted item
    super.indicatorColor,

    /// Textstyle of the labels
    TextStyle? labelTextStyle,

    /// The elevation shadown on the edges of bottomnavigationbar
    super.elevation,

    /// height of the navbar
    final double? height,

    /// iconTheme for the icons
    IconThemeData? iconTheme,
    super.indicatorShape,
    bool? isExtended,
  }) : super(
         selectedLabelTextStyle: labelTextStyle,
         unselectedLabelTextStyle: labelTextStyle,
         selectedIconTheme: iconTheme,
         isExtended: isExtended ?? false,
         height: height ?? 80.0,
       );

  factory M3NavbarDecoration.fromNavbarDecoration(
    NavbarDecoration navbarDecoration,
  ) => M3NavbarDecoration(
    height: navbarDecoration.height,
    backgroundColor: navbarDecoration.backgroundColor,
    elevation: navbarDecoration.elevation,
    labelTextStyle: navbarDecoration.selectedLabelTextStyle,
    iconTheme: navbarDecoration.selectedIconTheme,
    indicatorColor: navbarDecoration.indicatorColor,
    indicatorShape: navbarDecoration.indicatorShape,
    isExtended: navbarDecoration.isExtended,
    labelBehavior:
        navbarDecoration.labelBehavior ??
        NavigationDestinationLabelBehavior.alwaysShow,
  );

  NavbarDecoration toNavbarDecoration() => NavbarDecoration(
    backgroundColor: backgroundColor,
    elevation: elevation,
    height: height,
    unselectedItemColor: unselectedItemColor,
    unselectedIconColor: unselectedIconColor,
    showUnselectedLabels: showUnselectedLabels,
    unselectedLabelColor: unselectedLabelColor,
    selectedLabelTextStyle: selectedLabelTextStyle,
    unselectedLabelTextStyle: unselectedLabelTextStyle,
    labelBehavior: labelBehavior,
    isExtended: isExtended,
  );
}

class FloatingNavbarDecoration extends NavbarDecoration {
  FloatingNavbarDecoration({
    super.backgroundColor,
    super.unselectedIconColor,
    super.selectedIconColor,
    super.margin,
    super.borderRadius,
    double? height,
    bool? showSelectedLabels,
    bool? isExtended,
  }) : super(
         height: height ?? kFloatingNavbarHeight,
         showSelectedLabels: showSelectedLabels ?? true,
         isExtended: isExtended ?? false,
       );

  factory FloatingNavbarDecoration.fromNavbarDecoration(
    NavbarDecoration navbarDecoration,
  ) => FloatingNavbarDecoration(
    backgroundColor: navbarDecoration.backgroundColor,
    borderRadius: navbarDecoration.borderRadius,
    margin: navbarDecoration.margin,
    showSelectedLabels: navbarDecoration.showSelectedLabels,
    unselectedIconColor: navbarDecoration.unselectedIconColor,
    selectedIconColor: navbarDecoration.selectedIconColor,
    isExtended: navbarDecoration.isExtended,
  );

  /// to navb bar decoration

  NavbarDecoration toNavbarDecoration() => NavbarDecoration(
    backgroundColor: backgroundColor,
    borderRadius: borderRadius,
    unselectedIconColor: unselectedIconColor,
    margin: margin,
    selectedIconColor: selectedIconColor,
    elevation: elevation,
    showSelectedLabels: showSelectedLabels,
    showUnselectedLabels: showSelectedLabels!,
  );
}
