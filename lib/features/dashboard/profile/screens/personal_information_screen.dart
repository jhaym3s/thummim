import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/helpers/hive_repository.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../../../core/configs/storage_box.dart';
import '../../../../core/helpers/shared_preference_manager.dart';
import '../bloc/profile_bloc.dart';

class PersonalInformationScreen extends StatefulWidget {
  static const routeName = "personInformationScreen";
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  HiveRepository _hiveRepository = HiveRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Personal Information",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state is ProfileSuccessState){
                return Column(
              children: [
                SpaceY(24.dy),
                 PersonalInfoTile(
                  title: "Name",
                  text: state.name,
                ),
                SpaceY(16.dy),
                const PersonalInfoTile(
                  title: "Phone Number",
                  text: "+2348135796716",
                ),
                SpaceY(16.dy),
                 PersonalInfoTile(
                  title: "Email Address",
                  text: state.name,
                ),
                SpaceY(16.dy),
                 PersonalInfoTile(
                  title: "Country Of residence",
                  text: SharedPreferencesManager.getString(PrefKeys.userCountry)
                ),
              ],
            );
            }
            if (state is ProfileSuccessState) {
             return CustomText(text: "...", fontSize: 16.sp, fontWeight: FontWeight.w500);
            }
            return CustomText(text: "...", fontSize: 16.sp, fontWeight: FontWeight.w500);
          },
        ),
      ),
    );
  }
}

class PersonalInfoTile extends StatelessWidget {
  const PersonalInfoTile({
    super.key,
    required this.text,
    required this.title,
  });
  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: kWhite,
      height: 94.dy,
      width: kScreenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: title, fontSize: 14.sp, fontWeight: FontWeight.w400),
              CustomText(
                  text: "Edit", fontSize: 14.sp, fontWeight: FontWeight.w400),
            ],
          ),
          SpaceY(16.dy),
          CustomText(text: text, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
