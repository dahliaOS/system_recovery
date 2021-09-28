import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'pages/alertConfirm.dart';
import 'widgets/formAlert.dart';
import 'dart:convert';



String getNetworks(){
  ProcessResult result = Process.runSync('nmcli', ['--terse','-e','no','dev','wifi']);
  var networks = result.stdout;



	networks.split("\n").forEach((network){
	network = network.split(':');
	});
return(networks.toString());
}


