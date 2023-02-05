import 'package:kmp_togo_mobile/models/member_model.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_membertype.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/history/providerhistory.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/providers/wallet/topup/provider_topup.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:kmp_togo_mobile/apis/repository.dart' as repo;

final api = repo.Repository();

List<SingleChildWidget> multiProvider = [
  ChangeNotifierProvider(create: (_) => ProviderAuthLogin()),
  ChangeNotifierProvider(create: (_) => ProviderAuthChangePIN()),
  ChangeNotifierProvider(create: (_) => ProviderRegister()),
  ChangeNotifierProvider(create: (_) => ProviderNft()),
  ChangeNotifierProvider(create: (_) => ProviderMemberType(api)),
  ChangeNotifierProvider(create: (_) => ProviderAccountInfo(api)),
  ChangeNotifierProvider(create: (_) => ProviderProduct(api)),
  ChangeNotifierProvider(create: (_) => ProviderCreateProductWithVariant(api)),
  ChangeNotifierProvider(create: (_) => ProviderHistory()),
  ChangeNotifierProvider(create: (_) => CartProvider()),
  ChangeNotifierProvider(create: (_) => ProviderApiText()),
  ChangeNotifierProvider(create: (_) => ProviderTopup(api)),
  ChangeNotifierProvider(create: (_) => ProviderWithDraw()),
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Repository())
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<ItemModelMemberType?>(
    create: (context) => ProviderMemberType(api).catPhotoStream,
    initialData: null,
  ),
];
