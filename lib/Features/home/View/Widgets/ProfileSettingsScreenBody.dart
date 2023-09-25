import 'package:booklyapp/Features/home/Presentation/Manager/Auth_Cubit/auth_cubit.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Layout_Cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import 'Custom_Button.dart';

class ProfileSettingsScreenBody extends StatelessWidget {
  const ProfileSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var layoutcubit = BlocProvider.of<LayoutCubit>(context);

        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SucsessdeleteAccount) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('delete Account Succsessfully'),
                backgroundColor: Colors.green,
              ));
              GoRouter.of(context).push(Approuter.registerscreen);
            } else if (state is FaliuredeleteAccount) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errmessage),
                backgroundColor: Colors.yellow,
              ));
              GoRouter.of(context).push(Approuter.registerscreen);
            } else if (state is SignOutSucsess) {
              GoRouter.of(context).push(Approuter.registerscreen);
            } else if (state is SignOutFaliure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errmessage),
                backgroundColor: Colors.yellow,
              ));
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
                      height: device.height * 0.08,
                    ),
                    Row(
                      children: [
                        Text(
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
                        Text(
                          "Email :",
                        ),
                        Text(layoutcubit.usermodel?.email ??
                            " There is no Email")
                      ],
                    ),
                    SizedBox(
                      height: device.height * 0.1,
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
                        authCubit.deleteAccount();
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
