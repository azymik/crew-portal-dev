import 'package:flutter/material.dart';

enum Status {
  ok,
  caution,
  warning,
}

class ValidityCard extends StatelessWidget {
  const ValidityCard(
      {required this.code,
      required this.desc,
      required this.expiry,
      super.key});
  final String code;
  final String desc;
  final String expiry;

  DateTime get date {
    final int expiryYear = int.parse(expiry.split('/')[2]) + 2000;
    final int expiryMonth = int.parse(expiry.split('/')[1]);
    final int expiryDay = int.parse(expiry.split('/')[0]);
    return DateTime(expiryYear, expiryMonth, expiryDay);
  }

  Status get status {
    if (date.isBefore(DateTime.now())) {
      return Status.warning;
    }

    if (date.isBefore(DateTime.now().add(const Duration(days: 30)))) {
      return Status.caution;
    }

    return Status.ok;
  }

  @override
  Widget build(BuildContext context) {
    if (status == Status.ok) {
      return Card(
        child: ListTile(
          title: Text(
            desc,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(code),
          trailing: Text(expiry),
        ),
      );
    }
    if (status == Status.caution) {
      return Card(
        color: Colors.amber.shade900,
        child: ListTile(
          title: Text(
            desc,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(code),
          trailing: Text(expiry),
        ),
      );
    }
    return Card(
      color: Colors.red.shade800,
      child: ListTile(
        title: Text(
          desc,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(code),
        trailing: Text(expiry),
      ),
    );
  }
}
