import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:flutter_vscode/src/features/presentation/WelcomePage/View/WelcomePage.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/ProfileTab/ViewModel/ProfileTabViewModel.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final ProfileTabViewModel _ViewModel;
  _ProfileTabState({ProfileTabViewModel? ViewModel})
      : _ViewModel = ViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    //Init view model
    _ViewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));

    return Scaffold(
      body: Column(children: [
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'ProfileDetail'),
            child: _header()),
        _contentProfile(context)
      ]),
    );
  }
  Widget _header() {
    return Container(
      height: 250,
      color: bgGrey,
      padding: const EdgeInsets.all(50),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://user-images.githubusercontent.com/138251036/277202656-8f6ee5e6-d9cc-4de4-9389-7e8524524d15.jpg'),
            radius: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    header_text(
                        texto: 'Cesar Andia',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          color: gris,
                        ))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 20,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 108.0,
                  height: 20.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: rosa,
                          elevation: 0.5),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/crown.png'),
                            width: 16,
                            height: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: header_text(
                                texto: 'Vip Member',
                                color: blanco,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/noti.png'),
              width: 29,
              height: 29,
            ),
            title:
            header_text(texto: 'Notifications', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/payicon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(
                texto: 'Payment methods', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(texto: 'History', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(texto: 'Promo Code', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(texto: 'Settings', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title:
            header_text(texto: 'Invite Friends', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(texto: 'Help Center', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: header_text(texto: 'About us', fontWeight: FontWeight.w400),
            trailing: Icon(
              Icons.chevron_right,
              color: gris,
            ),
          ),
          ListTile(
              leading: const Image(
                image: AssetImage('assets/logout.png'),
                width: 29,
                height: 29,
              ),
              title: header_text(texto: 'Log out', fontWeight: FontWeight.w400),
              trailing: Icon(
                Icons.chevron_right,
                color: gris,
              ),
              onTap: () => _signOut(context))
        ],
      ),
    );
  }

  void _signOut(BuildContext context) async {
    await ShowAlertDialog(
        context,
        const AssetImage('assets/logout.png'),
        'Log Out in Progress...',
        'Do you want to log out?',
        createElevatedButton(
            context: context,
            labelButton: 'Log Out',
            color: naranja,
            func: () {
              _ViewModel.signOut().then((_) {
                Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => WelcomePage(),transitionDuration:const Duration(seconds: 0)));
              } );
            }));
  }

}

