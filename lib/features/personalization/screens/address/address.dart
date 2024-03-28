import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/features/personalization/controllers/address_controller.dart';
import 'package:e_mart/features/personalization/models/address_model.dart';
import 'package:e_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/formatters/formatter.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addrController = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.primary,
          child: const Icon(Iconsax.add, color: TColors.white),
          onPressed: () => Get.to(() => const AddNewAddress())),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: addrController.addresses.length,
              itemBuilder: (_, index) =>
                  TSingleAddress(address: addrController.addresses[index]),
              separatorBuilder: (_, __) =>
                  const SizedBox(height: TSizes.spaceBtwSections),
            );
          }),
        ),
      ),
    );
  }
}

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final addrController = Get.put(AddressController());
    // final bool selectedAddress =
    //     addrController.selectedAddressId.value == address.id!;

    return Obx(
      () => GestureDetector(
        onTap: () => addrController.selectedAddressId.value = address.id!,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: addrController.selectedAddressId.value == address.id!
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: addrController.selectedAddressId.value == address.id!
              ? Colors.transparent
              : dark
                  ? TColors.darkerGrey
                  : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                    addrController.selectedAddressId.value == address.id!
                        ? Iconsax.tick_circle5
                        : null,
                    color: addrController.selectedAddressId.value == address.id!
                        ? dark
                            ? TColors.light
                            : TColors.dark.withOpacity(0.6)
                        : null),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${address.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSizes.sm / 2,
                  ),
                  Text(
                    TFormatter.formatPhoneNumber(address.phoneNumber!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: TSizes.sm / 2,
                  ),
                  Text(
                    '${address.street}, ${address.postalCode}, ${address.district}, ${address.state}, India',
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
