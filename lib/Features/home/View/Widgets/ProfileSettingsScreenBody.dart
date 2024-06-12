import 'package:booklyapp/Features/home/Presentation/Manager/Auth_Cubit/auth_cubit.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Layout_Cubit/layout_cubit.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import 'Custom_Button.dart';

class ProfileSettingsScreenBody extends StatefulWidget {
  const ProfileSettingsScreenBody({super.key});

  @override
  State<ProfileSettingsScreenBody> createState() =>
      _ProfileSettingsScreenBodyState();
}

class _ProfileSettingsScreenBodyState extends State<ProfileSettingsScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
    var layoutcubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SucsessdeleteAccount) {
          constants.customsnackBar(context, "Account deleted", Colors.green);
          GoRouter.of(context).push(Approuter.registerscreen);
        } else if (state is FaliuredeleteAccount) {
          constants.customsnackBar(context, state.errmessage, Colors.green);
          GoRouter.of(context).push(Approuter.registerscreen);
        } else if (state is SignOutSucsess) {
          constants.customsnackBar(context, "Sign Out sucsess", Colors.green);
          GoRouter.of(context).push(Approuter.registerscreen);
        } else if (state is SignOutFaliure) {
          constants.customsnackBar(context, state.errmessage, Colors.yellow);
          GoRouter.of(context).push(Approuter.registerscreen);
        }
      },
      builder: (context, state) {
        var authCubit = BlocProvider.of<AuthCubit>(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: device.width * 0.05,
                vertical: device.height * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AssetsData.Logo,
                    height: 35,
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: device.height * 0.12,
                ),
                Row(
                  children: [
                    const Text(
                      "Name :",
                    ),
                    Text(layoutcubit.usermodel?.name ?? " There is no Name")
                  ],
                ),
                SizedBox(
                  height: device.height * 0.06,
                ),
                Row(
                  children: [
                    const Text(
                      "Email :",
                    ),
                    Text(layoutcubit.usermodel?.email ?? " There is no Email")
                  ],
                ),
                SizedBox(
                  height: device.height * 0.45,
                ),
                Custom_Button(
                  device: device,
                  txt: "Sign Out",
                  onPressed: () {
                    authCubit.signOut();
                  },
                ),
                SizedBox(
                  height: device.height * 0.04,
                ),
                Custom_Button(
                  device: device,
                  txt: "Delete This Account",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text(
                              'Are you sure you want to delete this Account?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(
                                    false); // Dismiss the dialog and return false.
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                authCubit.deleteAccount();
                              },
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
