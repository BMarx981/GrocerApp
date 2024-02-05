// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroceryItemsTable extends GroceryItems
    with TableInfo<$GroceryItemsTable, GroceryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroceryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, quantity, price, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grocery_items';
  @override
  VerificationContext validateIntegrity(Insertable<GroceryItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroceryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroceryItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
    );
  }

  @override
  $GroceryItemsTable createAlias(String alias) {
    return $GroceryItemsTable(attachedDatabase, alias);
  }
}

class GroceryItemData extends DataClass implements Insertable<GroceryItemData> {
  final int id;
  final String? name;
  final int? quantity;
  final double? price;
  final String? location;
  const GroceryItemData(
      {required this.id, this.name, this.quantity, this.price, this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    return map;
  }

  GroceryItemsCompanion toCompanion(bool nullToAbsent) {
    return GroceryItemsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
    );
  }

  factory GroceryItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroceryItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      price: serializer.fromJson<double?>(json['price']),
      location: serializer.fromJson<String?>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'quantity': serializer.toJson<int?>(quantity),
      'price': serializer.toJson<double?>(price),
      'location': serializer.toJson<String?>(location),
    };
  }

  GroceryItemData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> location = const Value.absent()}) =>
      GroceryItemData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        quantity: quantity.present ? quantity.value : this.quantity,
        price: price.present ? price.value : this.price,
        location: location.present ? location.value : this.location,
      );
  @override
  String toString() {
    return (StringBuffer('GroceryItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, quantity, price, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroceryItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.location == this.location);
}

class GroceryItemsCompanion extends UpdateCompanion<GroceryItemData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<int?> quantity;
  final Value<double?> price;
  final Value<String?> location;
  const GroceryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
  });
  GroceryItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
  });
  static Insertable<GroceryItemData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
    });
  }

  GroceryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<int?>? quantity,
      Value<double?>? price,
      Value<String?>? location}) {
    return GroceryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroceryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int id;
  final String? name;
  const RecipeData({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory RecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  RecipeData copyWith({int? id, Value<String?> name = const Value.absent()}) =>
      RecipeData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData && other.id == this.id && other.name == this.name);
}

class RecipesCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> id;
  final Value<String?> name;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<RecipeData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  RecipesCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RecipeGroceryItemsTable extends RecipeGroceryItems
    with TableInfo<$RecipeGroceryItemsTable, RecipeGroceryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeGroceryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES recipes(id)');
  static const VerificationMeta _groceryItemIdMeta =
      const VerificationMeta('groceryItemId');
  @override
  late final GeneratedColumn<int> groceryItemId = GeneratedColumn<int>(
      'grocery_item_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES grocery_items(id)');
  @override
  List<GeneratedColumn> get $columns => [recipeId, groceryItemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_grocery_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipeGroceryItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    }
    if (data.containsKey('grocery_item_id')) {
      context.handle(
          _groceryItemIdMeta,
          groceryItemId.isAcceptableOrUnknown(
              data['grocery_item_id']!, _groceryItemIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, groceryItemId};
  @override
  RecipeGroceryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeGroceryItemData(
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id']),
      groceryItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grocery_item_id']),
    );
  }

  @override
  $RecipeGroceryItemsTable createAlias(String alias) {
    return $RecipeGroceryItemsTable(attachedDatabase, alias);
  }
}

class RecipeGroceryItemData extends DataClass
    implements Insertable<RecipeGroceryItemData> {
  final int? recipeId;
  final int? groceryItemId;
  const RecipeGroceryItemData({this.recipeId, this.groceryItemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || recipeId != null) {
      map['recipe_id'] = Variable<int>(recipeId);
    }
    if (!nullToAbsent || groceryItemId != null) {
      map['grocery_item_id'] = Variable<int>(groceryItemId);
    }
    return map;
  }

  RecipeGroceryItemsCompanion toCompanion(bool nullToAbsent) {
    return RecipeGroceryItemsCompanion(
      recipeId: recipeId == null && nullToAbsent
          ? const Value.absent()
          : Value(recipeId),
      groceryItemId: groceryItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(groceryItemId),
    );
  }

  factory RecipeGroceryItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeGroceryItemData(
      recipeId: serializer.fromJson<int?>(json['recipeId']),
      groceryItemId: serializer.fromJson<int?>(json['groceryItemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<int?>(recipeId),
      'groceryItemId': serializer.toJson<int?>(groceryItemId),
    };
  }

  RecipeGroceryItemData copyWith(
          {Value<int?> recipeId = const Value.absent(),
          Value<int?> groceryItemId = const Value.absent()}) =>
      RecipeGroceryItemData(
        recipeId: recipeId.present ? recipeId.value : this.recipeId,
        groceryItemId:
            groceryItemId.present ? groceryItemId.value : this.groceryItemId,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeGroceryItemData(')
          ..write('recipeId: $recipeId, ')
          ..write('groceryItemId: $groceryItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, groceryItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeGroceryItemData &&
          other.recipeId == this.recipeId &&
          other.groceryItemId == this.groceryItemId);
}

class RecipeGroceryItemsCompanion
    extends UpdateCompanion<RecipeGroceryItemData> {
  final Value<int?> recipeId;
  final Value<int?> groceryItemId;
  final Value<int> rowid;
  const RecipeGroceryItemsCompanion({
    this.recipeId = const Value.absent(),
    this.groceryItemId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeGroceryItemsCompanion.insert({
    this.recipeId = const Value.absent(),
    this.groceryItemId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<RecipeGroceryItemData> custom({
    Expression<int>? recipeId,
    Expression<int>? groceryItemId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (groceryItemId != null) 'grocery_item_id': groceryItemId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeGroceryItemsCompanion copyWith(
      {Value<int?>? recipeId, Value<int?>? groceryItemId, Value<int>? rowid}) {
    return RecipeGroceryItemsCompanion(
      recipeId: recipeId ?? this.recipeId,
      groceryItemId: groceryItemId ?? this.groceryItemId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (groceryItemId.present) {
      map['grocery_item_id'] = Variable<int>(groceryItemId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeGroceryItemsCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('groceryItemId: $groceryItemId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShoppingListsTable extends ShoppingLists
    with TableInfo<$ShoppingListsTable, ShoppingListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES shopping_lists(id)');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES grocery_items(id)');
  @override
  List<GeneratedColumn> get $columns => [listId, name, itemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_lists';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {listId, itemId};
  @override
  ShoppingListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingListData(
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id']),
    );
  }

  @override
  $ShoppingListsTable createAlias(String alias) {
    return $ShoppingListsTable(attachedDatabase, alias);
  }
}

class ShoppingListData extends DataClass
    implements Insertable<ShoppingListData> {
  final int? listId;
  final String? name;
  final int? itemId;
  const ShoppingListData({this.listId, this.name, this.itemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || listId != null) {
      map['list_id'] = Variable<int>(listId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<int>(itemId);
    }
    return map;
  }

  ShoppingListsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingListsCompanion(
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      itemId:
          itemId == null && nullToAbsent ? const Value.absent() : Value(itemId),
    );
  }

  factory ShoppingListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingListData(
      listId: serializer.fromJson<int?>(json['listId']),
      name: serializer.fromJson<String?>(json['name']),
      itemId: serializer.fromJson<int?>(json['itemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'listId': serializer.toJson<int?>(listId),
      'name': serializer.toJson<String?>(name),
      'itemId': serializer.toJson<int?>(itemId),
    };
  }

  ShoppingListData copyWith(
          {Value<int?> listId = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<int?> itemId = const Value.absent()}) =>
      ShoppingListData(
        listId: listId.present ? listId.value : this.listId,
        name: name.present ? name.value : this.name,
        itemId: itemId.present ? itemId.value : this.itemId,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingListData(')
          ..write('listId: $listId, ')
          ..write('name: $name, ')
          ..write('itemId: $itemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(listId, name, itemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingListData &&
          other.listId == this.listId &&
          other.name == this.name &&
          other.itemId == this.itemId);
}

class ShoppingListsCompanion extends UpdateCompanion<ShoppingListData> {
  final Value<int?> listId;
  final Value<String?> name;
  final Value<int?> itemId;
  final Value<int> rowid;
  const ShoppingListsCompanion({
    this.listId = const Value.absent(),
    this.name = const Value.absent(),
    this.itemId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingListsCompanion.insert({
    this.listId = const Value.absent(),
    this.name = const Value.absent(),
    this.itemId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<ShoppingListData> custom({
    Expression<int>? listId,
    Expression<String>? name,
    Expression<int>? itemId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (listId != null) 'list_id': listId,
      if (name != null) 'name': name,
      if (itemId != null) 'item_id': itemId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingListsCompanion copyWith(
      {Value<int?>? listId,
      Value<String?>? name,
      Value<int?>? itemId,
      Value<int>? rowid}) {
    return ShoppingListsCompanion(
      listId: listId ?? this.listId,
      name: name ?? this.name,
      itemId: itemId ?? this.itemId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListsCompanion(')
          ..write('listId: $listId, ')
          ..write('name: $name, ')
          ..write('itemId: $itemId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $GroceryItemsTable groceryItems = $GroceryItemsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeGroceryItemsTable recipeGroceryItems =
      $RecipeGroceryItemsTable(this);
  late final $ShoppingListsTable shoppingLists = $ShoppingListsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [groceryItems, recipes, recipeGroceryItems, shoppingLists];
}
