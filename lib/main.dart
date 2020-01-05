import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:track_to_trace/pages/login_page.dart';
import 'package:track_to_trace/pages/product.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(
    CupertinoApp(onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case '/main':
          return CupertinoPageRoute(
              builder: (_) => CupertinoStoreHomePage(), settings: settings);
        default:
          return CupertinoPageRoute(
              builder: (_) => LoginPage(), settings: settings);
      }
    }),
  );
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            title: Text('Main'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('History'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return ProductList(
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductList(
                ),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Container(),
              );
            });
        }
      },
    );
  }
}

class ProductList extends StatelessWidget {

  const ProductList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Shipped Pack'),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
                  child: ListView(
            children: <Widget>[
              ProductRowItem(),
              ProductRowItem(),
              ProductRowItem(),
              ProductRowItem(),
            ],
          ),
        ),
      ),
    );
  }
}
