import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? assetName;
  final List<Map<String, dynamic>> dataFuture;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.dataFuture,
    this.icon,
    this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
        color: context.brightness == Brightness.dark
            ? const Color.fromARGB(255, 87, 85, 85)
            : Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.none,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: [
            ExpansionTile(
              collapsedIconColor: context.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey,
              iconColor: context.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey,
              leading: icon != null
                  ? Icon(icon, color: Colors.blueAccent)
                  : SvgPicture.asset(
                      assetName!,
                      width: 24,
                      height: 24,
                      // ignore: deprecated_member_use
                      color: Colors.blueAccent,
                    ),
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: context.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              children: dataFuture
                  .map(
                    (item) => Column(
                      children: [
                        Divider(
                          height: 2,
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                        ListTile(
                          title: Text(
                            item['descricao'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: context.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          trailing: Text(
                            "${item['value']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
