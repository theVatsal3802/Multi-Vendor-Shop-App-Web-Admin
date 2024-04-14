import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/banner_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/category_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/dashboard_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/order_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/product_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/vendors_screen.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = const DashboardScreen();

  void screenSelector(AdminMenuItem item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedScreen = const DashboardScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _selectedScreen = const VendorsScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedScreen = const WithdrawalScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedScreen = const OrdersScreen();
        });
        break;
      case CategoryScreen.routeName:
        setState(() {
          _selectedScreen = const CategoryScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedScreen = const ProductScreen();
        });
        break;
      case BannerScreen.routeName:
        setState(() {
          _selectedScreen = const BannerScreen();
        });
        break;
      default:
        setState(() {
          _selectedScreen = const DashboardScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: const Text(
          "Multi-Vendor Shop Admin Panel",
          textScaler: TextScaler.noScaling,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: "DashBoard",
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,
          ),
          AdminMenuItem(
            title: "Vendors",
            icon: Icons.people,
            route: VendorsScreen.routeName,
          ),
          AdminMenuItem(
            title: "Withdrawal",
            icon: Icons.monetization_on,
            route: WithdrawalScreen.routeName,
          ),
          AdminMenuItem(
            title: "Orders",
            icon: Icons.shopping_cart,
            route: OrdersScreen.routeName,
          ),
          AdminMenuItem(
            title: "Categories",
            icon: Icons.category,
            route: CategoryScreen.routeName,
          ),
          AdminMenuItem(
            title: "Products",
            icon: Icons.shop,
            route: ProductScreen.routeName,
          ),
          AdminMenuItem(
            title: "Upload Banners",
            icon: Icons.add_photo_alternate,
            route: BannerScreen.routeName,
          ),
        ],
        selectedRoute: "",
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              "Manage Seamlessly",
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: Center(
            child: Text(
              "©️ Vatsal Adhiya | ${DateTime.now().year}",
              textScaler: TextScaler.noScaling,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedScreen,
    );
  }
}
