import 'package:app_initial_structure/core/di/injection.dart';
import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/buttons/primary_button.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:app_initial_structure/core/widgets/inputs/custom_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';
import 'bloc/profile_detail_bloc.dart';
import 'bloc/profile_detail_event.dart';
import 'bloc/profile_detail_state.dart';

@RoutePage()
class ProfileDetailPage extends StatelessWidget {
  final String fieldName;

  const ProfileDetailPage({@PathParam('fieldName') required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<ProfileDetailBloc>()..add(const LoadProfileDetail()),
      child: const _ProfileDetailView(),
    );
  }
}

class _ProfileDetailView extends StatelessWidget {
  const _ProfileDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            backgroundColor: AppColors.black,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: CustomAppBar(
            title: state.isEditMode ? 'Edit Profile' : 'Profile Detail',
            showBackButton: true,
            backgroundColor: AppColors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  _ProfileHeader(
                    initials: state.profile?.initials ?? 'EW',
                    name: state.profile?.fullName ?? '',
                    email: state.profile?.email ?? '',
                    isEditMode: state.isEditMode,
                  ),
                  SizedBox(height: 20.h),
                  if (state.profile != null)
                    if (!state.isEditMode)
                      _ProfileViewMode(profile: state.profile!)
                    else
                      _ProfileEditMode(state: state),
                ],
              ),
            ),
          ),
          bottomNavigationBar:state.isEditMode ? Padding(
            padding:  EdgeInsets.all(20.h),
            child: _SaveButton(isSaving: state.isSaving),
          ) : null,
        );
      },
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final String initials;
  final String name;
  final String email;
  final bool isEditMode;

  const _ProfileHeader({
    required this.initials,
    required this.name,
    required this.email,
    required this.isEditMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 30.h),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50.h,
                  backgroundColor: AppColors.white,
                  child: Text(
                    initials,
                    style: AppTextStyles.instance.h1.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isEditMode)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 1.5),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: AppColors.white,
                        size: 16.h,
                      ),
                    ),
                  ),
              ],
            ),
            !isEditMode ?
              GestureDetector(
                onTap: () {
                  context.read<ProfileDetailBloc>().add(const ToggleEditMode());
                },
                child: Iconify(
                  SimpleIcons.editSquareIcon,
                  color: AppColors.white,
                  size: 30.h,
                ),
              ) : SizedBox(width: 30.h)
          ],
        ),

        SizedBox(height: 20.h),
        Text(
          name,
          style: AppTextStyles.instance.h4.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          email,
          style: AppTextStyles.instance.bodyMedium.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

class _ProfileViewMode extends StatelessWidget {
  final dynamic profile;

  const _ProfileViewMode({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Details',
          style: AppTextStyles.instance.h5.white,
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 1.5),
            borderRadius: BorderRadius.circular(20.h),
          ),
          child: Column(
            children: [
              _ProfileField(
                icon: Icons.person,
                label: 'Name',
                value: profile.fullName,
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.email,
                label: 'Email',
                value: profile.email,
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.phone,
                label: 'Contact No.',
                value: '${profile.countryCode} ${profile.contactNo}',
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.language,
                label: 'Language',
                value: profile.language,
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.location_on,
                label: 'Address',
                value: profile.address,
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.location_city,
                label: 'City',
                value: profile.city,
              ),
              _Divider(),
              _ProfileField(
                icon: Icons.map,
                label: 'State',
                value: profile.state,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileField({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white, size: 24.h),
          SizedBox(width: 15.h),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.instance.bodyMedium.copyWith(
                color: AppColors.white.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.white.withOpacity(0.3), height: 1);
  }
}

class _ProfileEditMode extends StatelessWidget {
  final ProfileDetailState state;

  const _ProfileEditMode({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(icon: Icons.person, label: 'Full Name'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: 'Ethan Walker',
          controller: TextEditingController(
            text: state.fullName,
          )..selection = TextSelection.collapsed(offset: state.fullName.length),
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateFullName(value));
          },
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.email, label: 'Email'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: 'ethanwalker@gmail.com',
          controller: TextEditingController(text: state.email)
            ..selection = TextSelection.collapsed(offset: state.email.length),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateEmail(value));
          },
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.phone, label: 'Contact No.'),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(28.h),
              ),
              child: Row(
                children: [
                  Text('🇮🇳', style: TextStyle(fontSize: 20.h)),
                  SizedBox(width: 5.h),
                  Text(
                    '+91',
                    style: AppTextStyles.instance.bodyMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                    size: 20.h,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: CustomTextField(
                hint: '98XXXXXXXX',
                controller: TextEditingController(text: state.contactNo)
                  ..selection = TextSelection.collapsed(
                    offset: state.contactNo.length,
                  ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  context.read<ProfileDetailBloc>().add(UpdateContactNo(value));
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.language, label: 'Language'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: 'English',
          controller: TextEditingController(
            text: state.language,
          )..selection = TextSelection.collapsed(offset: state.language.length),
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateLanguage(value));
          },
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.location_on, label: 'Address'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: '18, Iscon Arcade, Near Iscon Temple',
          controller: TextEditingController(text: state.address)
            ..selection = TextSelection.collapsed(offset: state.address.length),
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateAddress(value));
          },
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.location_city, label: 'City'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: 'Ahmedabad',
          controller: TextEditingController(text: state.city)
            ..selection = TextSelection.collapsed(offset: state.city.length),
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateCity(value));
          },
        ),
        SizedBox(height: 20.h),
        _FieldLabel(icon: Icons.map, label: 'State'),
        SizedBox(height: 10.h),
        CustomTextField(
          hint: 'Gujarat',
          controller: TextEditingController(text: state.state)
            ..selection = TextSelection.collapsed(offset: state.state.length),
          onChanged: (value) {
            context.read<ProfileDetailBloc>().add(UpdateState(value));
          },
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FieldLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.white, size: 20.h),
        SizedBox(width: 10.h),
        Text(
          label,
          style: AppTextStyles.instance.bodyMediumSemibold.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  final bool isSaving;

  const _SaveButton({required this.isSaving});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: isSaving ? 'Saving...' : 'Save',
      onPressed:
          isSaving
              ? null
              : () {
                context.read<ProfileDetailBloc>().add(const SaveProfile());
              },
      width: double.infinity,
    );
  }
}
