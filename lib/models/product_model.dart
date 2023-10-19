import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    AData? aData;

    Product({
        this.aData,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        aData: json["aData"] == null ? null : AData.fromJson(json["aData"]),
    );

    Map<String, dynamic> toJson() => {
        "aData": aData?.toJson(),
    };
}

class AData {
    int? id;
    String? template;
    String? brandName;
    String? categoryId;
    List<String>? categoryIds;
    List<List<ParentCategoryId>>? parentCategoryIds;
    String? categoryName;
    String? type;
    String? article;
    int? popular;
    List<dynamic>? sizeDetails;
    int? price;
    bool? block;
    int? originalPrice;
    bool? comingSoon;
    DateTime? dateCreate;
    bool? saleaction;
    Currency? currency;
    List<Photo>? photos;
    List<dynamic>? videos;
    List<dynamic>? videoCover;
    bool? favorite;
    int? count;
    bool? subscribe;
    dynamic season;
    String? nameOld;
    String? name;
    Descriptions? descriptions;
    Descriptions? materialDescriptions;
    Map<String, List<Measurement>>? measurements;
    String? measurementsUnit;
    List<dynamic>? model;
    String? stores;
    Map<String, Size>? sizes;
    bool? isFfm;
    Colors? colors;
    List<String>? formatPrice;
    DetailsName? detailsName;
    Details? details;
    bool? soldout;
    bool? available;
    String? url;
    List<String>? care;

    AData({
        this.id,
        this.template,
        this.brandName,
        this.categoryId,
        this.categoryIds,
        this.parentCategoryIds,
        this.categoryName,
        this.type,
        this.article,
        this.popular,
        this.sizeDetails,
        this.price,
        this.block,
        this.originalPrice,
        this.comingSoon,
        this.dateCreate,
        this.saleaction,
        this.currency,
        this.photos,
        this.videos,
        this.videoCover,
        this.favorite,
        this.count,
        this.subscribe,
        this.season,
        this.nameOld,
        this.name,
        this.descriptions,
        this.materialDescriptions,
        this.measurements,
        this.measurementsUnit,
        this.model,
        this.stores,
        this.sizes,
        this.isFfm,
        this.colors,
        this.formatPrice,
        this.detailsName,
        this.details,
        this.soldout,
        this.available,
        this.url,
        this.care,
    });

    factory AData.fromJson(Map<String, dynamic> json) => AData(
        id: json["id"],
        template: json["template"],
        brandName: json["brand_name"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"] == null ? [] : List<String>.from(json["category_ids"]!.map((x) => x)),
        parentCategoryIds: json["parent_category_ids"] == null ? [] : List<List<ParentCategoryId>>.from(json["parent_category_ids"]!.map((x) => List<ParentCategoryId>.from(x.map((x) => ParentCategoryId.fromJson(x))))),
        categoryName: json["category_name"],
        type: json["type"],
        article: json["article"],
        popular: json["popular"],
        sizeDetails: json["size_details"] == null ? [] : List<dynamic>.from(json["size_details"]!.map((x) => x)),
        price: json["price"],
        block: json["block"],
        originalPrice: json["original_price"],
        comingSoon: json["coming_soon"],
        dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
        saleaction: json["saleaction"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
        videoCover: json["video_cover"] == null ? [] : List<dynamic>.from(json["video_cover"]!.map((x) => x)),
        favorite: json["favorite"],
        count: json["count"],
        subscribe: json["subscribe"],
        season: json["season"],
        nameOld: json["name_old"],
        name: json["name"],
        descriptions: json["descriptions"] == null ? null : Descriptions.fromJson(json["descriptions"]),
        materialDescriptions: json["material_descriptions"] == null ? null : Descriptions.fromJson(json["material_descriptions"]),
        measurements: Map.from(json["measurements"]!).map((k, v) => MapEntry<String, List<Measurement>>(k, List<Measurement>.from(v.map((x) => Measurement.fromJson(x))))),
        measurementsUnit: json["measurements_unit"],
        model: json["model"] == null ? [] : List<dynamic>.from(json["model"]!.map((x) => x)),
        stores: json["stores"] != null ? json["stores"].toString() : null,
        sizes: Map.from(json["sizes"]!).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        isFfm: json["is_ffm"],
        colors: json["colors"] == null ? null : Colors.fromJson(json["colors"]),
        formatPrice: json["format_price"] == null ? [] : List<String>.from(json["format_price"]!.map((x) => x)),
        detailsName: json["details_name"] == null ? null : DetailsName.fromJson(json["details_name"]),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        soldout: json["soldout"],
        available: json["available"],
        url: json["url"],
        care: json["care"] == null ? [] : List<String>.from(json["care"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "template": template,
        "brand_name": brandName,
        "category_id": categoryId,
        "category_ids": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x)),
        "parent_category_ids": parentCategoryIds == null ? [] : List<dynamic>.from(parentCategoryIds!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "category_name": categoryName,
        "type": type,
        "article": article,
        "popular": popular,
        "size_details": sizeDetails == null ? [] : List<dynamic>.from(sizeDetails!.map((x) => x)),
        "price": price,
        "block": block,
        "original_price": originalPrice,
        "coming_soon": comingSoon,
        "date_create": dateCreate?.toIso8601String(),
        "saleaction": saleaction,
        "currency": currency?.toJson(),
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "video_cover": videoCover == null ? [] : List<dynamic>.from(videoCover!.map((x) => x)),
        "favorite": favorite,
        "count": count,
        "subscribe": subscribe,
        "season": season,
        "name_old": nameOld,
        "name": name,
        "descriptions": descriptions?.toJson(),
        "material_descriptions": materialDescriptions?.toJson(),
        "measurements": Map.from(measurements!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "measurements_unit": measurementsUnit,
        "model": model == null ? [] : List<dynamic>.from(model!.map((x) => x)),
        "stores": stores,
        "sizes": Map.from(sizes!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "is_ffm": isFfm,
        "colors": colors?.toJson(),
        "format_price": formatPrice == null ? [] : List<dynamic>.from(formatPrice!.map((x) => x)),
        "details_name": detailsName?.toJson(),
        "details": details?.toJson(),
        "soldout": soldout,
        "available": available,
        "url": url,
        "care": care == null ? [] : List<dynamic>.from(care!.map((x) => x)),
    };
}

class Colors {
    Current? current;
    List<Current>? other;

    Colors({
        this.current,
        this.other,
    });

    factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        current: json["current"] == null ? null : Current.fromJson(json["current"]),
        other: json["other"] == null ? [] : List<Current>.from(json["other"]!.map((x) => Current.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "current": current?.toJson(),
        "other": other == null ? [] : List<dynamic>.from(other!.map((x) => x.toJson())),
    };
}

class Current {
    int? id;
    String? name;
    int? amount;
    String? value;
    bool? show;
    String? price;
    String? colorSample;
    Photo? photo;

    Current({
        this.id,
        this.name,
        this.amount,
        this.value,
        this.show,
        this.price,
        this.colorSample,
        this.photo,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        value: json["value"],
        show: json["show"],
        price: json["price"],
        colorSample: json["color_sample"] == null ? null : json["color_sample"].toString(),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "value": value,
        "show": show,
        "price": price,
        "color_sample": colorSample,
        "photo": photo?.toJson(),
    };
}

class ColorSample {
    String? pcsArticle;
    int? pcsIndex;
    int? pcsX;
    int? pcsY;
    String? pcsPath;
    String? piPhoto;

    ColorSample({
        this.pcsArticle,
        this.pcsIndex,
        this.pcsX,
        this.pcsY,
        this.pcsPath,
        this.piPhoto,
    });

    factory ColorSample.fromJson(Map<String, dynamic> json) => ColorSample(
        pcsArticle: json["pcs_article"],
        pcsIndex: json["pcs_index"],
        pcsX: json["pcs_x"],
        pcsY: json["pcs_y"],
        pcsPath: json["pcs_path"],
        piPhoto: json["pi_photo"],
    );

    Map<String, dynamic> toJson() => {
        "pcs_article": pcsArticle,
        "pcs_index": pcsIndex,
        "pcs_x": pcsX,
        "pcs_y": pcsY,
        "pcs_path": pcsPath,
        "pi_photo": piPhoto,
    };
}

class Photo {
    Thumbs? thumbs;
    String? blurhash;
    BasicColor? basicColor;
    String? big;

    Photo({
        this.thumbs,
        this.blurhash,
        this.basicColor,
        this.big,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumbs: json["thumbs"] == null ? null : Thumbs.fromJson(json["thumbs"]),
        blurhash: json["blurhash"],
        basicColor: json["basicColor"] == null ? null : BasicColor.fromJson(json["basicColor"]),
        big: json["big"],
    );

    Map<String, dynamic> toJson() => {
        "thumbs": thumbs?.toJson(),
        "blurhash": blurhash,
        "basicColor": basicColor?.toJson(),
        "big": big,
    };
}

class BasicColor {
    List<String>? colors;
    double? luminance;

    BasicColor({
        this.colors,
        this.luminance,
    });

    factory BasicColor.fromJson(Map<String, dynamic> json) => BasicColor(
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        luminance: json["luminance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "luminance": luminance,
    };
}

class Thumbs {
    String? the7681024;
    String? the384512;

    Thumbs({
        this.the7681024,
        this.the384512,
    });

    factory Thumbs.fromJson(Map<String, dynamic> json) => Thumbs(
        the7681024: json["768_1024"],
        the384512: json["384_512"],
    );

    Map<String, dynamic> toJson() => {
        "768_1024": the7681024,
        "384_512": the384512,
    };
}

class Currency {
    int? id;
    String? prefix;
    String? prefixSymbol;
    String? postfix;
    String? postfixSymbol;

    Currency({
        this.id,
        this.prefix,
        this.prefixSymbol,
        this.postfix,
        this.postfixSymbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        prefix: json["prefix"],
        prefixSymbol: json["prefix_symbol"],
        postfix: json["postfix"],
        postfixSymbol: json["postfix_symbol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "prefix": prefix,
        "prefix_symbol": prefixSymbol,
        "postfix": postfix,
        "postfix_symbol": postfixSymbol,
    };
}

class Descriptions {
    String? markDown;
    String? html;
    String? text;

    Descriptions({
        this.markDown,
        this.html,
        this.text,
    });

    factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
        markDown: json["mark_down"],
        html: json["html"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "mark_down": markDown,
        "html": html,
        "text": text,
    };
}

class Details {
    Materials? materials;

    Details({
        this.materials,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        materials: json["materials"] == null ? null : Materials.fromJson(json["materials"]),
    );

    Map<String, dynamic> toJson() => {
        "materials": materials?.toJson(),
    };
}

class Materials {
    F5Eb8576C8F811Eb8258Fcde56Ff0106? f5Eb8576C8F811Eb8258Fcde56Ff0106;

    Materials({
        this.f5Eb8576C8F811Eb8258Fcde56Ff0106,
    });

    factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        f5Eb8576C8F811Eb8258Fcde56Ff0106: json["f5eb8576-c8f8-11eb-8258-fcde56ff0106"] == null ? null : F5Eb8576C8F811Eb8258Fcde56Ff0106.fromJson(json["f5eb8576-c8f8-11eb-8258-fcde56ff0106"]),
    );

    Map<String, dynamic> toJson() => {
        "f5eb8576-c8f8-11eb-8258-fcde56ff0106": f5Eb8576C8F811Eb8258Fcde56Ff0106?.toJson(),
    };
}

class F5Eb8576C8F811Eb8258Fcde56Ff0106 {
    String? name;
    int? percent;

    F5Eb8576C8F811Eb8258Fcde56Ff0106({
        this.name,
        this.percent,
    });

    factory F5Eb8576C8F811Eb8258Fcde56Ff0106.fromJson(Map<String, dynamic> json) => F5Eb8576C8F811Eb8258Fcde56Ff0106(
        name: json["name"],
        percent: json["percent"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "percent": percent,
    };
}

class DetailsName {
    String? materials;

    DetailsName({
        this.materials,
    });

    factory DetailsName.fromJson(Map<String, dynamic> json) => DetailsName(
        materials: json["materials"],
    );

    Map<String, dynamic> toJson() => {
        "materials": materials,
    };
}

class Measurement {
    String? name;
    double? value;

    Measurement({
        this.name,
        this.value,
    });

    factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        name: json["name"],
        value: json["value"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class ParentCategoryId {
    String? id;
    String? url;
    String? name;

    ParentCategoryId({
        this.id,
        this.url,
        this.name,
    });

    factory ParentCategoryId.fromJson(Map<String, dynamic> json) => ParentCategoryId(
        id: json["id"],
        url: json["url"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
    };
}

class Size {
    int? id;
    String? name;
    int? amount;
    bool? show;
    String? barcode;
    bool? subscribe;

    Size({
        this.id,
        this.name,
        this.amount,
        this.show,
        this.barcode,
        this.subscribe,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        show: json["show"],
        barcode: json["barcode"],
        subscribe: json["subscribe"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "show": show,
        "barcode": barcode,
        "subscribe": subscribe,
    };
}

class Empty {
    String? name;
    String? address;
    String? workTime;
    String? location;
    int? isPartner;
    int? shopId;
    Map<String, int>? sizes;

    Empty({
        this.name,
        this.address,
        this.workTime,
        this.location,
        this.isPartner,
        this.shopId,
        this.sizes,
    });

    factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        name: json["name"],
        address: json["address"],
        workTime: json["work_time"],
        location: json["location"],
        isPartner: json["is_partner"],
        shopId: json["shop_id"],
        sizes: Map.from(json["sizes"]!).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "work_time": workTime,
        "location": location,
        "is_partner": isPartner,
        "shop_id": shopId,
        "sizes": Map.from(sizes!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
