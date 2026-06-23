import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class TmAppbar extends StatelessWidget implements PreferredSize{
  const TmAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.PColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'),
          ),

          SizedBox(width: 10,),
          Column(
            children: [
              Text('Taufiqur Sabbir',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white
                  )
              ),
              Text('tau@rfgr.com',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white
                ),
              )
            ],
          )


        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
