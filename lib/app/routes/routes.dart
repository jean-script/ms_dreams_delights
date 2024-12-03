import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/binder/revenues_binder.dart';
import 'package:ms_dreams_delights/app/pages/estoque_page.dart';
import 'package:ms_dreams_delights/app/pages/home_page.dart';
import 'package:ms_dreams_delights/app/pages/pedidos_page.dart';
import 'package:ms_dreams_delights/app/pages/product_page.dart';
import 'package:ms_dreams_delights/app/pages/receitas_created_page.dart';
import 'package:ms_dreams_delights/app/pages/revenue_detail.dart';
import 'package:ms_dreams_delights/app/pages/splash_page.dart';

class MyRoutes {
  static const String SPLASH_PAGE = '/';
  static const String HOME_PAGE = '/home';
  static const String REVENUES_CREATE_PAGE = '/revenues/create';
  static const String REVENUES_DETAIL_PAGE = '/revenues/detail';
  static const String PEDIDOS_PAGE = '/pedidos';
  static const String PRODUTOS_PAGE = '/produtos';
  static const String ESTOQUE_PAGE = '/estoque';

  static List<GetPage> get() => [
        GetPage(
          name: SPLASH_PAGE,
          page: () => const SplashPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: HOME_PAGE,
          page: () => const HomePage(),
          transition: Transition.noTransition,
          binding: RevenuesBinder(),
        ),
        GetPage(
          name: REVENUES_CREATE_PAGE,
          page: () => const ReceitasCreatedPage(),
          transition: Transition.noTransition,
          // binding: RevenuesBinder(),
        ),
        GetPage(
          name: REVENUES_DETAIL_PAGE,
          page: () => const RevenueDetail(),
          transition: Transition.noTransition,
          // binding: RevenuesBinder(),
        ),
        GetPage(
          name: PEDIDOS_PAGE,
          page: () => const PedidosPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: PRODUTOS_PAGE,
          page: () => const ProductPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: ESTOQUE_PAGE,
          page: () => const EstoquePage(),
          transition: Transition.noTransition,
          // binding: StockBinder(),
        ),
      ];
}
