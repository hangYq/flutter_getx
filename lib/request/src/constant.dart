// TODO(YH): ignore
// ignore: avoid_classes_with_only_static_members
class BRequestHeaders {
  static String bClientToken = 'Client-Token';
  static String bTimestamp = 'timestamp';
  static String bAppSession = 'appSession';
  // 注意：b-cookie-id 个命名是最符合 RFC 规范的，其余都有欠缺
  static String bCookieId = 'b-cookie-id';
  static String bSignature = 'signature';
  static String bClientDeviceId = 'Client-DeviceId';
  static String bDatatype = 'b-datatype';
  // static String bContentType = 'Content-Type';
  @Deprecated('基于 jwt 的用户系统上线后，应逐步废弃 memberId 字段')
  static String bMemberId = 'memberId';
  static String bVersion = 'b-version';
}

// TODO(YH): ignore
// ignore: avoid_classes_with_only_static_members
// class RequestHeaders {
//   static String contentType = 'Content-Type';
// }

const String pbContentType = 'application/x-protobuf';

// TODO(YH): ignore
// ignore: avoid_classes_with_only_static_members
class BHttpMethods {
  static String fetch = 'GET';
  static String post = 'POST';
}
