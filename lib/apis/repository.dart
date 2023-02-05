import 'package:kmp_togo_mobile/apis/account/account_api.dart';
import 'package:kmp_togo_mobile/apis/auth/memberType_api.dart';
import 'package:kmp_togo_mobile/apis/ppob/ppob_api.dart';
import 'package:kmp_togo_mobile/apis/product/product_api.dart';
import 'package:kmp_togo_mobile/apis/profile/addressBook_api.dart';
import 'package:kmp_togo_mobile/apis/wallet/topup/topup_api.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/address/addressBook.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidProduct.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidType.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameH.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameS.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqPLN.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidProduct.dart';
import 'package:kmp_togo_mobile/models/product/productBuy_model.dart';
import 'package:kmp_togo_mobile/models/product/productInq_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate2_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate_model.dart';
import 'package:kmp_togo_mobile/models/product/product_model.dart';
import 'package:kmp_togo_mobile/models/response/success/success_models.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/coin_model.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/topup_model.dart';

class Repository {
  final memberTypeApi = MemberTypeApi();
  final accountApi = AccountApi();
  final addressBookApi = AddressBookApi();
  final ppobPostpaidApi = PPOBPostPaidApi();
  final ppobPrepaidApi = PPOBPrePaidApi();
  final productApi = ProductApi();
  final coinApi = TopUpApi();

  Future<ItemModelMemberType> fetchAllMemberType() =>
      memberTypeApi.fetchAllMemberType();

  Future<ItemModelAccountInfo> fetchAccountInfo() =>
      accountApi.fetchAccountInfo();

  Future<ItemModelUserAddressBook> fetchMyAddress() =>
      addressBookApi.fetchMyAddress();
  Future<dynamic> addUpdateAddressBook(
      id,
          name,
          contactName,
          phoneNumber,
          detailAddress,
          provinceId,
          cityId,
          subdistrictId,
          postalCode,
          isUpdate) =>
      addressBookApi.addUpdateAddressBook(
          id,
          name,
          contactName,
          phoneNumber,
          detailAddress,
          provinceId,
          cityId,
          subdistrictId,
          postalCode,
          isUpdate);

  Future<ItemModelPostPaidType> fetchAllPostPaidType() =>
      ppobPostpaidApi.fetchAllPostPaidType();

  Future<ItemModelPrePaidProduct> fetchPrePaidProduct() =>
      ppobPrepaidApi.fetchPrePaidProduct();
  Future<ItemModelPrepaidPLN> prePaidInquiryPLN(customerId) =>
      ppobPrepaidApi.prePaidInqueryPLN(customerId);
  Future<ItemModelPrepaidGameH> prePaidInquiryGameHP(code, type, customerId) =>
      ppobPrepaidApi.prePaidInquiryGameHP(code);
  Future<ItemModelPrepaidGameS> prePaidInquiryGameServer(gameCode) =>
      ppobPrepaidApi.prePaidInquiryGameServer(gameCode);
  Future<ItemModelPPOBCheckOut> prePaidCheckout(
          type, customerId, operator, product, String pinValue) =>
      ppobPrepaidApi.prePaidCheckout(
          type, customerId, operator, product, pinValue);

  Future<ItemModelPostPaidProduct> fetchPostPaidProduct(productName) =>
      ppobPostpaidApi.fetchPostPaidProduct(productName);
  Future<dynamic> postPaidInquiry(code, customerId) =>
      ppobPostpaidApi.postPaidInquiry(code, customerId);
  Future<ItemModelPPOBCheckOut> postPaidCheckout(
          code, type, customerId, String pinValue) =>
      ppobPostpaidApi.postPaidCheckout(code, type, customerId, pinValue);

  Future<ItemModelProduct> fetchAllProduct(productSelling) =>
      productApi.fetchAllProduct(productSelling);

  Future<ItemModelProductInquiry> buyProductInquiry(
          skuId, qty, storeId, addressBookId, code) =>
      productApi.buyProductInquiry(skuId, qty, storeId, addressBookId, code);
  Future<dynamic> buyProductInquiryCart(items) =>
      productApi.buyProductInquiryCart(items);

  Future<ItemModelBuyProduct> buyProduct(dataInquiry, pinValue) =>
      productApi.buyProduct(dataInquiry, pinValue);

  Future<ItemModelCreateProduct> createProductWithVariant(
          isUpdate,
          id,
          storeId,
          name,
          categoryId,
          subCategoryId,
          description,
          price,
          sku,
          productSelling,
          file) =>
      productApi.createProductWithVariant(
          isUpdate,
          id,
          storeId,
          name,
          categoryId,
          subCategoryId,
          description,
          price,
          sku,
          productSelling,
          file);

  Future<ItemModelProductWtVarian> createProductWtVariant(
          isUpdate,
          id,
          storeId,
          name,
          description,
          price,
          stock,
          weight,
          categoryId,
          subCategoryId,
          productSelling,
          file) =>
      productApi.createProductWtVariant(
          isUpdate,
          id,
          storeId,
          name,
          description,
          price,
          stock,
          weight,
          categoryId,
          subCategoryId,
          productSelling,
          file);

  Future<ItemModelSuccess> deleteProduct(id) => productApi.deleteProduct(id);

  Future<ItemModelTopup> fetchTopUp() => coinApi.fetchTopUp();

  Future<ItemModelCoinPriceInq> fetchCoinPriceInq() =>
      coinApi.fetchCoinPriceInq();

  Future<ItemModelBuyCoin> buyCoin(coin, pinValue) =>
      coinApi.buyCoin(coin, pinValue);
  Future<ItemModelSellCoin> sellCoin(coin, pinValue) =>
      coinApi.sellCoin(coin, pinValue);
}
