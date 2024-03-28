import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/personalization/controllers/address_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final addrController = Get.put(AddressController());

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Form(
                key: addrController.addrFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: addrController.name,
                      validator: (value) =>
                          TValidator.validateEmptyText('Name', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      validator: (value) =>
                          TValidator.validatePhoneNumber(value),
                      controller: addrController.phone,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.mobile),
                          labelText: 'Phone Number'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                TValidator.validateEmptyText('Street', value),
                            controller: addrController.street,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: 'Street'),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                TValidator.validatePostalCode(value),
                            controller: addrController.postal,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: 'Postal Code'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                TValidator.validateEmptyText('District', value),
                            controller: addrController.district,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: 'District'),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                TValidator.validateState(value),
                            controller: addrController.state,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: 'State'),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: TSizes.spaceBtwInputFields,
                    // ),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //       prefixIcon: Icon(Iconsax.global),
                    //       labelText: 'Country'),
                    // ),
                    const SizedBox(
                      height: TSizes.defaultSpace,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              addrController.addNewAddress();
                            },
                            child: const Text('Save'))),
                  ],
                ),
              ))),
    );
  }
}
