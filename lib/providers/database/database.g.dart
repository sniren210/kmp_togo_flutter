// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int productId;
  final int? initialPrice;
  final int? productPrice;
  int? quantity;
  final String? productName;
  final String? unitTag;
  final String? image;
  final int userId;
  CartData(
      {required this.id,
      required this.productId,
      this.initialPrice,
      this.productPrice,
      this.quantity,
      this.productName,
      this.unitTag,
      this.image,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || initialPrice != null) {
      map['initial_price'] = Variable<int>(initialPrice);
    }
    if (!nullToAbsent || productPrice != null) {
      map['product_price'] = Variable<int>(productPrice);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || productName != null) {
      map['product_name'] = Variable<String>(productName);
    }
    if (!nullToAbsent || unitTag != null) {
      map['unit_tag'] = Variable<String>(unitTag);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: Value(id),
      productId: Value(productId),
      initialPrice: initialPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(initialPrice),
      productPrice: productPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(productPrice),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
      unitTag: unitTag == null && nullToAbsent
          ? const Value.absent()
          : Value(unitTag),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      userId: Value(userId),
    );
  }

  factory CartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      initialPrice: serializer.fromJson<int?>(json['initialPrice']),
      productPrice: serializer.fromJson<int?>(json['productPrice']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      productName: serializer.fromJson<String?>(json['productName']),
      unitTag: serializer.fromJson<String?>(json['unitTag']),
      image: serializer.fromJson<String?>(json['image']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'initialPrice': serializer.toJson<int?>(initialPrice),
      'productPrice': serializer.toJson<int?>(productPrice),
      'quantity': serializer.toJson<int?>(quantity),
      'productName': serializer.toJson<String?>(productName),
      'unitTag': serializer.toJson<String?>(unitTag),
      'image': serializer.toJson<String?>(image),
      'userId': serializer.toJson<int>(userId),
    };
  }

  CartData copyWith(
          {int? id,
          int? productId,
          Value<int?> initialPrice = const Value.absent(),
          Value<int?> productPrice = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<String?> productName = const Value.absent(),
          Value<String?> unitTag = const Value.absent(),
          Value<String?> image = const Value.absent(),
          int? userId}) =>
      CartData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        initialPrice:
            initialPrice.present ? initialPrice.value : this.initialPrice,
        productPrice:
            productPrice.present ? productPrice.value : this.productPrice,
        quantity: quantity.present ? quantity.value : this.quantity,
        productName: productName.present ? productName.value : this.productName,
        unitTag: unitTag.present ? unitTag.value : this.unitTag,
        image: image.present ? image.value : this.image,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('initialPrice: $initialPrice, ')
          ..write('productPrice: $productPrice, ')
          ..write('quantity: $quantity, ')
          ..write('productName: $productName, ')
          ..write('unitTag: $unitTag, ')
          ..write('image: $image, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, initialPrice, productPrice,
      quantity, productName, unitTag, image, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.initialPrice == this.initialPrice &&
          other.productPrice == this.productPrice &&
          other.quantity == this.quantity &&
          other.productName == this.productName &&
          other.unitTag == this.unitTag &&
          other.image == this.image &&
          other.userId == this.userId);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int?> initialPrice;
  final Value<int?> productPrice;
  final Value<int?> quantity;
  final Value<String?> productName;
  final Value<String?> unitTag;
  final Value<String?> image;
  final Value<int> userId;
  const CartCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.initialPrice = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.productName = const Value.absent(),
    this.unitTag = const Value.absent(),
    this.image = const Value.absent(),
    this.userId = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    this.initialPrice = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.productName = const Value.absent(),
    this.unitTag = const Value.absent(),
    this.image = const Value.absent(),
    required int userId,
  })  : productId = Value(productId),
        userId = Value(userId);
  static Insertable<CartData> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? initialPrice,
    Expression<int>? productPrice,
    Expression<int>? quantity,
    Expression<String>? productName,
    Expression<String>? unitTag,
    Expression<String>? image,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (initialPrice != null) 'initial_price': initialPrice,
      if (productPrice != null) 'product_price': productPrice,
      if (quantity != null) 'quantity': quantity,
      if (productName != null) 'product_name': productName,
      if (unitTag != null) 'unit_tag': unitTag,
      if (image != null) 'image': image,
      if (userId != null) 'user_id': userId,
    });
  }

  CartCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int?>? initialPrice,
      Value<int?>? productPrice,
      Value<int?>? quantity,
      Value<String?>? productName,
      Value<String?>? unitTag,
      Value<String?>? image,
      Value<int>? userId}) {
    return CartCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      initialPrice: initialPrice ?? this.initialPrice,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
      productName: productName ?? this.productName,
      unitTag: unitTag ?? this.unitTag,
      image: image ?? this.image,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (initialPrice.present) {
      map['initial_price'] = Variable<int>(initialPrice.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<int>(productPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (unitTag.present) {
      map['unit_tag'] = Variable<String>(unitTag.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('initialPrice: $initialPrice, ')
          ..write('productPrice: $productPrice, ')
          ..write('quantity: $quantity, ')
          ..write('productName: $productName, ')
          ..write('unitTag: $unitTag, ')
          ..write('image: $image, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _initialPriceMeta =
      const VerificationMeta('initialPrice');
  @override
  late final GeneratedColumn<int> initialPrice = GeneratedColumn<int>(
      'initial_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productPriceMeta =
      const VerificationMeta('productPrice');
  @override
  late final GeneratedColumn<int> productPrice = GeneratedColumn<int>(
      'product_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unitTagMeta =
      const VerificationMeta('unitTag');
  @override
  late final GeneratedColumn<String> unitTag = GeneratedColumn<String>(
      'unit_tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        initialPrice,
        productPrice,
        quantity,
        productName,
        unitTag,
        image,
        userId
      ];
  @override
  String get aliasedName => _alias ?? 'cart';
  @override
  String get actualTableName => 'cart';
  @override
  VerificationContext validateIntegrity(Insertable<CartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('initial_price')) {
      context.handle(
          _initialPriceMeta,
          initialPrice.isAcceptableOrUnknown(
              data['initial_price']!, _initialPriceMeta));
    }
    if (data.containsKey('product_price')) {
      context.handle(
          _productPriceMeta,
          productPrice.isAcceptableOrUnknown(
              data['product_price']!, _productPriceMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    }
    if (data.containsKey('unit_tag')) {
      context.handle(_unitTagMeta,
          unitTag.isAcceptableOrUnknown(data['unit_tag']!, _unitTagMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      initialPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initial_price']),
      productPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_price']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name']),
      unitTag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_tag']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(attachedDatabase, alias);
  }
}

class ResponseFromAPIData extends DataClass
    implements Insertable<ResponseFromAPIData> {
  final String method;
  final String path;
  final String status;
  final String responseBody;
  final String? data;
  const ResponseFromAPIData(
      {required this.method,
      required this.path,
      required this.status,
      required this.responseBody,
      this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['method'] = Variable<String>(method);
    map['path'] = Variable<String>(path);
    map['status'] = Variable<String>(status);
    map['response_body'] = Variable<String>(responseBody);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    return map;
  }

  ResponseFromAPICompanion toCompanion(bool nullToAbsent) {
    return ResponseFromAPICompanion(
      method: Value(method),
      path: Value(path),
      status: Value(status),
      responseBody: Value(responseBody),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
    );
  }

  factory ResponseFromAPIData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResponseFromAPIData(
      method: serializer.fromJson<String>(json['method']),
      path: serializer.fromJson<String>(json['path']),
      status: serializer.fromJson<String>(json['status']),
      responseBody: serializer.fromJson<String>(json['responseBody']),
      data: serializer.fromJson<String?>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'method': serializer.toJson<String>(method),
      'path': serializer.toJson<String>(path),
      'status': serializer.toJson<String>(status),
      'responseBody': serializer.toJson<String>(responseBody),
      'data': serializer.toJson<String?>(data),
    };
  }

  ResponseFromAPIData copyWith(
          {String? method,
          String? path,
          String? status,
          String? responseBody,
          Value<String?> data = const Value.absent()}) =>
      ResponseFromAPIData(
        method: method ?? this.method,
        path: path ?? this.path,
        status: status ?? this.status,
        responseBody: responseBody ?? this.responseBody,
        data: data.present ? data.value : this.data,
      );
  @override
  String toString() {
    return (StringBuffer('ResponseFromAPIData(')
          ..write('method: $method, ')
          ..write('path: $path, ')
          ..write('status: $status, ')
          ..write('responseBody: $responseBody, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(method, path, status, responseBody, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResponseFromAPIData &&
          other.method == this.method &&
          other.path == this.path &&
          other.status == this.status &&
          other.responseBody == this.responseBody &&
          other.data == this.data);
}

class ResponseFromAPICompanion extends UpdateCompanion<ResponseFromAPIData> {
  final Value<String> method;
  final Value<String> path;
  final Value<String> status;
  final Value<String> responseBody;
  final Value<String?> data;
  const ResponseFromAPICompanion({
    this.method = const Value.absent(),
    this.path = const Value.absent(),
    this.status = const Value.absent(),
    this.responseBody = const Value.absent(),
    this.data = const Value.absent(),
  });
  ResponseFromAPICompanion.insert({
    required String method,
    required String path,
    required String status,
    required String responseBody,
    this.data = const Value.absent(),
  })  : method = Value(method),
        path = Value(path),
        status = Value(status),
        responseBody = Value(responseBody);
  static Insertable<ResponseFromAPIData> custom({
    Expression<String>? method,
    Expression<String>? path,
    Expression<String>? status,
    Expression<String>? responseBody,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (method != null) 'method': method,
      if (path != null) 'path': path,
      if (status != null) 'status': status,
      if (responseBody != null) 'response_body': responseBody,
      if (data != null) 'data': data,
    });
  }

  ResponseFromAPICompanion copyWith(
      {Value<String>? method,
      Value<String>? path,
      Value<String>? status,
      Value<String>? responseBody,
      Value<String?>? data}) {
    return ResponseFromAPICompanion(
      method: method ?? this.method,
      path: path ?? this.path,
      status: status ?? this.status,
      responseBody: responseBody ?? this.responseBody,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (responseBody.present) {
      map['response_body'] = Variable<String>(responseBody.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResponseFromAPICompanion(')
          ..write('method: $method, ')
          ..write('path: $path, ')
          ..write('status: $status, ')
          ..write('responseBody: $responseBody, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $ResponseFromAPITable extends ResponseFromAPI
    with TableInfo<$ResponseFromAPITable, ResponseFromAPIData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResponseFromAPITable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
      'method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responseBodyMeta =
      const VerificationMeta('responseBody');
  @override
  late final GeneratedColumn<String> responseBody = GeneratedColumn<String>(
      'response_body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [method, path, status, responseBody, data];
  @override
  String get aliasedName => _alias ?? 'response_from_a_p_i';
  @override
  String get actualTableName => 'response_from_a_p_i';
  @override
  VerificationContext validateIntegrity(
      Insertable<ResponseFromAPIData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('method')) {
      context.handle(_methodMeta,
          method.isAcceptableOrUnknown(data['method']!, _methodMeta));
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('response_body')) {
      context.handle(
          _responseBodyMeta,
          responseBody.isAcceptableOrUnknown(
              data['response_body']!, _responseBodyMeta));
    } else if (isInserting) {
      context.missing(_responseBodyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {method, path};
  @override
  ResponseFromAPIData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResponseFromAPIData(
      method: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      responseBody: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response_body'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data']),
    );
  }

  @override
  $ResponseFromAPITable createAlias(String alias) {
    return $ResponseFromAPITable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CartTable cart = $CartTable(this);
  late final $ResponseFromAPITable responseFromAPI =
      $ResponseFromAPITable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cart, responseFromAPI];
}
