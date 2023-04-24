/*
* 基础组件
*/

import 'package:flutterdemo/Widgets/Layout/center.dart';
import 'package:flutterdemo/Widgets/Layout/padding.dart';
import 'package:flutterdemo/Widgets/other/HttpDemo.dart';
import 'package:flutterdemo/Widgets/other/WxShear.dart';

import 'Widgets/BaseWidget/GridView.dart';
import 'Widgets/Layout/Align.dart';
import 'Widgets/Layout/column.dart';
import 'Widgets/Layout/container.dart';
import 'Widgets/Layout/flow.dart';
import 'Widgets/Layout/wrap.dart';
import 'Widgets/OtherWidget/CustomScrollView.dart';
import 'Widgets/OtherWidget/icon.dart';
import 'Widgets/BaseWidget/image.dart';
import 'Widgets/Layout/row.dart';
import 'Widgets/BaseWidget/text.dart';
import 'Widgets/Cupertino/CupertinoActivityIndicator.dart';
import 'Widgets/Cupertino/CupertinoAlertDialog.dart';
import 'Widgets/Cupertino/CupertinoButton.dart';
import 'Widgets/Cupertino/CupertinoDialog.dart';
import 'Widgets/Cupertino/CupertinoDialogAction.dart';
import 'Widgets/Cupertino/CupertinoFullscreenDialogTransition.dart';
import 'Widgets/Cupertino/CupertinoNavigationBar.dart';
import 'Widgets/Cupertino/CupertinoPageScaffold.dart';
import 'Widgets/Cupertino/CupertinoPageTransition.dart';
import 'Widgets/Cupertino/CupertinoSlider.dart';
import 'Widgets/Cupertino/CupertinoTabBar.dart';
import 'Widgets/Cupertino/CupertinoTabScaffold.dart';
import 'Widgets/Cupertino/CupertinoTabView.dart';
import 'Widgets/Layout/stack.dart';

/*
 * Material Components
 */
import 'Widgets/TipsAndMenu/Dialog.dart';
import 'Widgets/TipsAndMenu/bottomsheet.dart';
import 'Widgets/BaseWidget/card.dart';
import 'Widgets/BaseWidget/checkbox.dart';
import 'Widgets/OtherWidget/chip.dart';
import 'Widgets/OtherWidget/datatable.dart';
import 'Widgets/TipsAndMenu/datepicker.dart';
import 'Widgets/OtherWidget/divider.dart';
import 'Widgets/OtherWidget/expansionpanel.dart';
import 'Widgets/BaseWidget/Button.dart';
import 'Widgets/OtherWidget/floatingActionButton.dart';
import 'Widgets/Material_components/appbar.dart';
import 'Widgets/OtherWidget/bottomnavigationbar.dart';
import 'Widgets/OtherWidget/drawer.dart';
import 'Widgets/other/FileDemo.dart';
import 'Widgets/other/RouteTest.dart';
import 'Widgets/other/ThemeTestRoute.dart';
import 'Widgets/other/WillPopScopeTestRoute.dart';
import 'Widgets/other/focusnode.dart';
import 'Widgets/OtherWidget/iconbutton.dart';
import 'Widgets/BaseWidget/progress.dart';
import 'Widgets/BaseWidget/listtile.dart';
import 'Widgets/Material_components/materialapp.dart';
import 'Widgets/TipsAndMenu/popupmenubutton.dart';
import 'Widgets/OtherWidget/radio.dart';
import 'Widgets/Material_components/scaffold.dart';
import 'Widgets/OtherWidget/slider.dart';
import 'Widgets/TipsAndMenu/snackbar.dart';
import 'Widgets/OtherWidget/stepper.dart';
import 'Widgets/BaseWidget/switch.dart';
import 'Widgets/Material_components/tabbar.dart';
import 'Widgets/Material_components/tabbarview.dart';
import 'Widgets/BaseWidget/textfield.dart';
import 'Widgets/OtherWidget/tooltip.dart';

/*
* 根目录
*/
import 'package:flutter/material.dart';

import 'Widgets/Material_components/scaffold.dart';
import 'home/home.dart';
import 'main.dart';

class FMRouteManager {
  // 路由总表
  Map<String, WidgetBuilder> _routeMap = {};

  // 拦截参数，用来拦截路由表，进行不同操作
  final _isLogin = true;
  final _otherJudge = true;

  FMRouteManager() {
    _routeMap.addAll(mapForHome());
    _routeMap.addAll(mapForBaseWidgets());
    _routeMap.addAll(mapForMaterialComponents());
    _routeMap.addAll(mapForCupertino());
    _routeMap.addAll(mapForLayout());
    _routeMap.addAll(mapForOther());
  }

  // 自定义路由
  MaterialPageRoute routeWithSetting(RouteSettings setting) {
    // 拦截未登录路由
    if (!_isLogin) {
      return loginRoute(setting);
    }
    // 拦截其他情况路由
    if (!_otherJudge) {
      return ohterRoute(setting);
    }

    print(setting);

    WidgetBuilder? builder = _routeMap[setting.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 未知路由
  MaterialPageRoute unknowRouteWithSetting(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 登录路由
  MaterialPageRoute loginRoute(RouteSettings setting) {
    // 这里可以替换为自定义的 Login 页面
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 拦截其他情况路由
  MaterialPageRoute ohterRoute(RouteSettings setting) {
    // 这里可以替换为自定义的 Login 页面
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 首页表
  Map<String, WidgetBuilder> mapForHome() {
    return {
      "/": (BuildContext context) => FMHomeVC(),
    };
  }

  // BaseWidgets 表
  Map<String, WidgetBuilder> mapForBaseWidgets() {
    return {
      "widget/Image": (BuildContext context) => FMImageVC(),
      "widget/Text": (BuildContext context) => FMTextVC(),
      "widget/Button": (BuildContext context) => FMButtonVC(),
      "widget/Switch": (BuildContext context) => FMSwitchVC(),
      "widget/CheckBox": (BuildContext context) => FMCheckBoxVC(),
      "widget/Icon": (BuildContext context) => FMIconVC(),
      "widget/TextField": (BuildContext context) => FMTextFieldVC(),
      "widget/Listview": (BuildContext context) => FMListTileVC(),
      "widget/GridView": (BuildContext context) => InfiniteGridView(),
      "widget/Progress": (BuildContext context) => FMProgress(),
    };
  }

  // MaterialComponents 表
  Map<String, WidgetBuilder> mapForMaterialComponents() {
    return {
      "/MaterialComponents/Scaffold": (BuildContext context) => FMScaffoldVC(),
      "/MaterialComponents/AppBar": (BuildContext context) => FMAppBarVC(),
      "/MaterialComponents/BottomNavigationBar": (BuildContext context) => FMBottomNavBarVC(),
      "/MaterialComponents/TabBar": (BuildContext context) => FMTabBarVC(),
      "/MaterialComponents/TabBarView": (BuildContext context) => const TabBarViewPage(),
      "/MaterialComponents/MaterialApp": (BuildContext context) => FMMaterialAppVC(),
      "/MaterialComponents/Drawer": (BuildContext context) => FMDrawerVC(),
      "/MaterialComponents/FloatingActionButton": (BuildContext context) =>
          FMFloatingActionButtonVC(),
      "/MaterialComponents/IconButton": (BuildContext context) => FMIconButtonVC(),
      "/MaterialComponents/PopupMenuButton": (BuildContext context) => FMPopupMenuButtonVC(),
      "/MaterialComponents/FocusNode": (BuildContext context) => FMFocusNodeVC(),
      "/MaterialComponents/Radio": (BuildContext context) => FMRadioVC(),
      "/MaterialComponents/Slider": (BuildContext context) => FMSliderVC(),
      "/MaterialComponents/DatePicker": (BuildContext context) => FMDatePickerVC(),
      "/MaterialComponents/Dialog": (BuildContext context) => FMDialogVC(),
      "/MaterialComponents/BottomSheet": (BuildContext context) => FMBottomSheetVC(),
      "/MaterialComponents/ExpansionPanel": (BuildContext context) => FMExpansionPanelVC(),
      "/MaterialComponents/SnackBar": (BuildContext context) => FMSnackBarVC(),
      "/MaterialComponents/Chip": (BuildContext context) => FMChipVC(),
      "/MaterialComponents/ToolTip": (BuildContext context) => FMToolTipVC(),
      "/MaterialComponents/DataTable": (BuildContext context) => FMDataTableVC(),
      "/MaterialComponents/Card": (BuildContext context) => FMCardVC(),
      "/MaterialComponents/Stepper": (BuildContext context) => FMStepperVC(),
      "/MaterialComponents/Divider": (BuildContext context) => FMDividerVC(),
      "/MaterialComponents/CustomScrollViewTest": (BuildContext context) => CustomScrollViewTest(),
    };
  }

  // Cupertino 苹果风格
  Map<String, WidgetBuilder> mapForCupertino() {
    return {
      "/Cupertino/CupertinoActivityIndicator": (BuildContext context) =>
          FMCupertinoActivityIndicatorVC(),
      "/Cupertino/CupertinoAlertDialog": (BuildContext context) => FMCupertinoAlertDialogVC(),
      "/Cupertino/CupertinoButton": (BuildContext context) => FMCupertinoButtonVC(),
      //这个报错
      // "/Cupertino/CupertinoDialog": (BuildContext context) => FMCupertinoDialogVC(),
      "/Cupertino/CupertinoDialogAction": (BuildContext context) => FMCupertinoDialogActionVC(),
      "/Cupertino/CupertinoSlider": (BuildContext context) => FMCupertinoSliderVC(),
      "/Cupertino/CupertinoPageTransition": (BuildContext context) => FMCupertinoPageTransitionVC(),
      "/Cupertino/CupertinoFullscreenDialogTransition": (BuildContext context) =>
          FMCupertinoFullscreenDialogTransitionVC(),
      "/Cupertino/CupertinoNavigationBar": (BuildContext context) => FMCupertinoNavigationBarVC(),
      "/Cupertino/CupertinoTabBar": (BuildContext context) => FMCupertinoTabBarVC(),
      "/Cupertino/CupertinoPageScaffold": (BuildContext context) => FMCupertinoPageScaffoldVC(),
      "/Cupertino/CupertinoTabScaffold": (BuildContext context) => FMCupertinoTabScaffoldVC(),
      "/Cupertino/CupertinoTabView": (BuildContext context) => FMCupertinoTabViewVC(),
    };
  }

  // Widgets.Layout
  Map<String, WidgetBuilder> mapForLayout() {
    return {
      "/Layout/Container": (BuildContext context) => FMContainerVC(),
      "/Layout/Stack": (BuildContext context) => FMStackVC(),
      "/Layout/Row": (BuildContext context) => FMRowVC(),
      "/Layout/Column": (BuildContext context) => FMColumnVC(),
      "/Layout/Center": (BuildContext context) => CenterWidget(),
      "/Layout/Padding": (BuildContext context) => PaddingWidget(),
      "/Layout/Align": (BuildContext context) => AlignWidget(),
      "/Layout/Wrap": (BuildContext context) => WrapTest(),
      "/Layout/Flow": (BuildContext context) => FlowTest(),
    };
  }

  // Widgets.Layout
  Map<String, WidgetBuilder> mapForOther() {
    return {
      "/other/route": (BuildContext context) => FristPage(),
      "/other/willpop": (BuildContext context) => WillPopScopeTestRoute(),
      "/other/ThemeTestRoute": (BuildContext context) => ThemeTestRoute(),
      "/other/file": (BuildContext context) => FileDemo(),
      "/other/http": (BuildContext context) => HttpDemo(),
      "/other/wxshear": (BuildContext context) => WxShear(),
    };
  }
}
