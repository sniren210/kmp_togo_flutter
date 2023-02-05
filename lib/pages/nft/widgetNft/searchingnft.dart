import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/cardsearching.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchinfNFT extends StatefulWidget {
  SearchinfNFT();

  @override
  State<SearchinfNFT> createState() => _SearchinfNFTState();
}

class _SearchinfNFTState extends State<SearchinfNFT> {
  bool? loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getAllNFT(context);
      setState(() {
        loading = _getkategoriProvider.loadinggetNFTALL;
      });
    });

    super.initState();
  }

  final TextEditingController _cariC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Disini'),
      ),
      body: Consumer<ProviderNft>(
          builder: (BuildContext context, v, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: _cariC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 4.w,
                    ),
                    hintText: 'Cari NFT',
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: v.dataAllNFT?.data?.length,
                itemBuilder: (context, int index) {
                  if (_cariC.text.isNotEmpty) {
                    if (v.dataAllNFT!.data![index].name!
                        .toLowerCase()
                        .contains(_cariC.text.toLowerCase())) {
                      return CardSearching(
                        images: v.dataAllNFT?.data?[index].imagePath,
                        title: v.dataAllNFT?.data?[index].name ?? "",
                        expired:
                            v.dataAllNFT?.data?[index].expirationDate ?? "",
                        buyer: v.dataAllNFT?.data?[index].avlUnit.toString(),
                        buyer_est:
                            v.dataAllNFT?.data?[index].qtyUnit.toString(),
                        nftSerialId: v.dataAllNFT!.data![index].nftUnit!
                                .where((element) => element.ownerId == null)
                                .isNotEmpty
                            ? v.dataAllNFT!.data![index].nftUnit
                                ?.where((element) => element.ownerId == null)
                                .first
                                .nftSerialId
                                .toString()
                            : '',
                        priceCoins: v.dataAllNFT!.data![index].nftUnit!
                                .where((element) => element.ownerId == null)
                                .isNotEmpty
                            ? v.dataAllNFT!.data![index].nftUnit
                                ?.where((element) => element.ownerId == null)
                                .first
                                .priceCoin
                                .toString()
                            : '',
                        lockNft: v.dataAllNFT!.data![index].nftUnit!
                                .where((element) => element.ownerId == null)
                                .isNotEmpty
                            ? v.dataAllNFT!.data![index].nftUnit
                                ?.where((element) => element.ownerId == null)
                                .first
                                .holdLimitTill
                                .toString()
                            : '',
                        monthlyPercentage: v.dataAllNFT!.data![index].nftUnit!
                                .where((element) => element.ownerId == null)
                                .isNotEmpty
                            ? v.dataAllNFT!.data![index].nftUnit
                                ?.where((element) => element.ownerId == null)
                                .first
                                .monthlyPercentage
                                .toString()
                            : '',
                        gasfee: v.dataAllNFT?.data?[index].gasfee.toString(),
                        admfee: v.dataAllNFT?.data?[index].admfee.toString(),
                        owner: v.dataAllNFT!.data![index].nftUnit!
                                .where((element) => element.ownerId == null)
                                .isNotEmpty
                            ? v.dataAllNFT!.data![index].nftUnit
                                ?.where((element) => element.ownerId == null)
                                .first
                                .ownerId
                                .toString()
                            : '',
                        deskripsi: v.dataAllNFT?.data?[index].description,
                      );
                    } else {
                      return Container();
                    }
                  }
                  return CardSearching(
                    images: v.dataAllNFT?.data?[index].imagePath,
                    title: v.dataAllNFT?.data?[index].name ?? "",
                    expired: v.dataAllNFT?.data?[index].expirationDate ?? "",
                    buyer: v.dataAllNFT?.data?[index].avlUnit.toString(),
                    buyer_est: v.dataAllNFT?.data?[index].qtyUnit.toString(),
                    nftSerialId: v.dataAllNFT!.data![index].nftUnit!
                            .where((element) => element.ownerId == null)
                            .isNotEmpty
                        ? v.dataAllNFT!.data![index].nftUnit
                            ?.where((element) => element.ownerId == null)
                            .first
                            .nftSerialId
                            .toString()
                        : '',
                    priceCoins: v.dataAllNFT!.data![index].nftUnit!
                            .where((element) => element.ownerId == null)
                            .isNotEmpty
                        ? v.dataAllNFT!.data![index].nftUnit
                            ?.where((element) => element.ownerId == null)
                            .first
                            .priceCoin
                            .toString()
                        : '',
                    lockNft: v.dataAllNFT!.data![index].nftUnit!
                            .where((element) => element.ownerId == null)
                            .isNotEmpty
                        ? v.dataAllNFT!.data![index].nftUnit
                            ?.where((element) => element.ownerId == null)
                            .first
                            .holdLimitTill
                            .toString()
                        : '',
                    monthlyPercentage: v.dataAllNFT!.data![index].nftUnit!
                            .where((element) => element.ownerId == null)
                            .isNotEmpty
                        ? v.dataAllNFT!.data![index].nftUnit
                            ?.where((element) => element.ownerId == null)
                            .first
                            .monthlyPercentage
                            .toString()
                        : '',
                    gasfee: v.dataAllNFT?.data?[index].gasfee.toString(),
                    admfee: v.dataAllNFT?.data?[index].admfee.toString(),
                    owner: v.dataAllNFT!.data![index].nftUnit!
                            .where((element) => element.ownerId == null)
                            .isNotEmpty
                        ? v.dataAllNFT!.data![index].nftUnit
                            ?.where((element) => element.ownerId == null)
                            .first
                            .ownerId
                            .toString()
                        : '',
                    deskripsi: v.dataAllNFT?.data?[index].description,
                  );
                },
              ))
            ],
          ),
        );
      }),
    );
  }
}
