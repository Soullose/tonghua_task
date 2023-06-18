import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/basic_storage_provider.dart';
import '../utils/nanoid/nanoid.dart';
import 'mqtt_connection_status_provider.dart';

part 'mqtt_provider.g.dart';

const subscribeTopics = ['wms/scheduler/#'];

@Riverpod(keepAlive: true)
class Mqtt extends _$Mqtt {
  late final MqttServerClient client;

  @override
  build() {
    final ip = ref.watch(ipAddressProvider);
    client = MqttServerClient.withPort(ip, nanoid(), 1883);
    ref.onDispose(() {
      if (kDebugMode) {
        print('onDispose');
      }
      disconnect();
    });
  }

  FutureOr<MqttConnectionState> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.setProtocolV311();
    client.connectTimeoutPeriod = 2000;
    client.autoReconnect = true;
    client.resubscribeOnAutoReconnect = false;

    /// Add an auto reconnect callback.
    /// This is the 'pre' auto re connect callback, called before the sequence starts.
    client.onAutoReconnect = onAutoReconnect;

    /// Add an auto reconnect callback.
    /// This is the 'post' auto re connect callback, called after the sequence
    /// has completed. Note that re subscriptions may be occurring when this callback
    /// is invoked. See [resubscribeOnAutoReconnect] above.
    client.onAutoReconnected = onAutoReconnected;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    ref.read(mqttClientConnectStatusProvider.notifier).state =
        MqttConnectionState.connecting;

    MqttClientConnectionStatus? mqttConnectionStatus =
        await client.connect().catchError(
      (error) {
        ref.read(mqttClientConnectStatusProvider.notifier).state =
            MqttConnectionState.faulted;
        return null;
      },
    );

    return mqttConnectionStatus?.state ?? MqttConnectionState.faulted;
  }

  void onConnected() {
    for (var topic in subscribeTopics) {
      subscribe(topic);
    }

    client.updates?.listen(
      (List<MqttReceivedMessage<MqttMessage>> messages) {
        for (MqttReceivedMessage mqttReceivedMessage in messages) {
          // get the topic
          final topic = mqttReceivedMessage.topic;
          // get the message
          final payload = mqttReceivedMessage.payload as MqttPublishMessage;
          final String message =
              const Utf8Decoder().convert(payload.payload.message);
          // try to parse the payload as json
          dynamic payloadDecoded;
          try {
            payloadDecoded = jsonDecode(message);
            log('received topic: "$topic", message<dynamic>: "$message"');

            List<String> topicList = topic.split("/");
            String i = topicList[2];
            String j = topicList[3];
            if (kDebugMode) {
              print('$i $j $payloadDecoded');
            }
            // if that fails, it's probably a string
          } on FormatException catch (_) {
            payloadDecoded = message;
            log('received topic: "$topic", message<string>: "$message"');
          }
        }
      },
    );

    ref.read(mqttClientConnectStatusProvider.notifier).state =
        MqttConnectionState.connected;
  }

  void disconnect() {
    client.disconnect();
    ref.read(mqttClientConnectStatusProvider.notifier).state =
        MqttConnectionState.disconnected;
  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  /// The pre auto re connect callback
  void onAutoReconnect() {
    if (kDebugMode) {
      print(
          'EXAMPLE::onAutoReconnect client callback - Client auto reconnection sequence will start');
    }
  }

  /// The post auto re connect callback
  void onAutoReconnected() {
    if (kDebugMode) {
      print(
          'EXAMPLE::onAutoReconnected client callback - Client auto reconnection sequence has completed');
    }
  }

  void onDisconnected() {
    ref.read(mqttClientConnectStatusProvider.notifier).state =
        MqttConnectionState.disconnected;
  }

  void onSubscribed(String topic) {
    if (kDebugMode) {
      print('Subscribed to topic $topic');
    }
  }

  void pong() {
    if (kDebugMode) {
      print('Ping response');
    }
  }
}
