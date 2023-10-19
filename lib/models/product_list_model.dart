import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

class ProductList {
    List<AProduct>? aProduct;
    AFilters? aFilters;
    int? iCount;
    int? iPages;
    int? iLimit;
    int? iCurrentPage;
    bool? isFilter;
    ASort? aSort;
    String? sGrid;

    ProductList({
        this.aProduct,
        this.aFilters,
        this.iCount,
        this.iPages,
        this.iLimit,
        this.iCurrentPage,
        this.isFilter,
        this.aSort,
        this.sGrid,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        aProduct: json["aProduct"] == null ? [] : List<AProduct>.from(json["aProduct"]!.map((x) => AProduct.fromJson(x))),
        aFilters: json["aFilters"] == null ? null : AFilters.fromJson(json["aFilters"]),
        iCount: json["iCount"],
        iPages: json["iPages"],
        iLimit: json["iLimit"],
        iCurrentPage: json["iCurrentPage"],
        isFilter: json["is_filter"],
        aSort: json["aSort"] == null ? null : ASort.fromJson(json["aSort"]),
        sGrid: json["sGrid"],
    );
}

class AFilters {
    PriceClass? colors;
    PriceClass? sizes;
    Filling? materials;
    Filling? filling;
    Filling? lining;
    PriceClass? price;

    AFilters({
        this.colors,
        this.sizes,
        this.materials,
        this.filling,
        this.lining,
        this.price,
    });

    factory AFilters.fromJson(Map<String, dynamic> json) => AFilters(
        colors: json["colors"] == null ? null : PriceClass.fromJson(json["colors"]),
        sizes: json["sizes"] == null ? null : PriceClass.fromJson(json["sizes"]),
        materials: json["materials"] == null ? null : Filling.fromJson(json["materials"]),
        filling: json["filling"] == null ? null : Filling.fromJson(json["filling"]),
        lining: json["lining"] == null ? null : Filling.fromJson(json["lining"]),
        price: json["price"] == null ? null : PriceClass.fromJson(json["price"]),
    );
}

class PriceClass {
    String? name;
    List<dynamic>? selected;
    bool? hidden;
    Map<String, Item>? items;

    PriceClass({
        this.name,
        this.selected,
        this.hidden,
        this.items,
    });

    factory PriceClass.fromJson(Map<String, dynamic> json) => PriceClass(
        name: json["name"],
        selected: json["selected"] == null ? [] : List<dynamic>.from(json["selected"]!.map((x) => x)),
        hidden: json["hidden"],
        items: Map.from(json["items"]!).map((k, v) => MapEntry<String, Item>(k, Item.fromJson(v))),
    );
}

class Item {
    String? name;
    String? value;
    bool? exist;
    bool? active;
    List<int>? productIds;
    int? id;

    Item({
        this.name,
        this.value,
        this.exist,
        this.active,
        this.productIds,
        this.id,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        value: json["value"],
        exist: json["exist"],
        active: json["active"],
        productIds: json["product_ids"] == null ? [] : List<int>.from(json["product_ids"]!.map((x) => x)),
        id: json["id"],
    );
}

class Filling {
    String? name;
    List<dynamic>? selected;
    bool? hidden;
    List<dynamic>? items;

    Filling({
        this.name,
        this.selected,
        this.hidden,
        this.items,
    });

    factory Filling.fromJson(Map<String, dynamic> json) => Filling(
        name: json["name"],
        selected: json["selected"] == null ? [] : List<dynamic>.from(json["selected"]!.map((x) => x)),
        hidden: json["hidden"],
        items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
    );
}

class AProduct {
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
    List<Video>? videos;
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
    dynamic stores;
    Map<String, Size>? sizes;
    bool? isFfm;
    AProductColors? colors;
    List<String>? formatPrice;
    DetailsName? detailsName;
    Details? details;
    bool? soldout;
    bool? available;

    AProduct({
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
    });

    factory AProduct.fromJson(Map<String, dynamic> json) => AProduct(
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
        videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
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
        stores: json["stores"],
        sizes: Map.from(json["sizes"]!).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        isFfm: json["is_ffm"],
        colors: json["colors"] == null ? null : AProductColors.fromJson(json["colors"]),
        formatPrice: json["format_price"] == null ? [] : List<String>.from(json["format_price"]!.map((x) => x)),
        detailsName: json["details_name"] == null ? null : DetailsName.fromJson(json["details_name"]),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        soldout: json["soldout"],
        available: json["available"],
    );
}

class AProductColors {
    Current? current;
    List<Current>? other;

    AProductColors({
        this.current,
        this.other,
    });

    factory AProductColors.fromJson(Map<String, dynamic> json) => AProductColors(
        current: json["current"] == null ? null : Current.fromJson(json["current"]),
        other: json["other"] == null ? [] : List<Current>.from(json["other"]!.map((x) => Current.fromJson(x))),
    );
}

class Current {
    int? id;
    String? name;
    int? amount;
    String? value;
    bool? show;
    String? price;
    dynamic colorSample;
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
        colorSample: json["color_sample"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    );
}

class ColorSampleClass {
    String? pcsArticle;
    int? pcsIndex;
    int? pcsX;
    int? pcsY;
    String? pcsPath;
    String? piPhoto;

    ColorSampleClass({
        this.pcsArticle,
        this.pcsIndex,
        this.pcsX,
        this.pcsY,
        this.pcsPath,
        this.piPhoto,
    });

    factory ColorSampleClass.fromJson(Map<String, dynamic> json) => ColorSampleClass(
        pcsArticle: json["pcs_article"],
        pcsIndex: json["pcs_index"],
        pcsX: json["pcs_x"],
        pcsY: json["pcs_y"],
        pcsPath: json["pcs_path"],
        piPhoto: json["pi_photo"],
    );
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
}

class Details {
    Materials? materials;

    Details({
        this.materials,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        materials: json["materials"] == null ? null : Materials.fromJson(json["materials"]),
    );
}

class Materials {
    F5Eb8576C8F811Eb8258Fcde56Ff0106? f5Eb8576C8F811Eb8258Fcde56Ff0106;

    Materials({
        this.f5Eb8576C8F811Eb8258Fcde56Ff0106,
    });

    factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        f5Eb8576C8F811Eb8258Fcde56Ff0106: json["f5eb8576-c8f8-11eb-8258-fcde56ff0106"] == null ? null : F5Eb8576C8F811Eb8258Fcde56Ff0106.fromJson(json["f5eb8576-c8f8-11eb-8258-fcde56ff0106"]),
    );
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
}

class DetailsName {
    String? materials;

    DetailsName({
        this.materials,
    });

    factory DetailsName.fromJson(Map<String, dynamic> json) => DetailsName(
        materials: json["materials"],
    );
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
}

class Store {
    String? name;
    String? address;
    String? workTime;
    String? location;
    int? isPartner;
    int? shopId;
    Map<String, int>? sizes;

    Store({
        this.name,
        this.address,
        this.workTime,
        this.location,
        this.isPartner,
        this.shopId,
        this.sizes,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        name: json["name"],
        address: json["address"],
        workTime: json["work_time"],
        location: json["location"],
        isPartner: json["is_partner"],
        shopId: json["shop_id"],
        sizes: Map.from(json["sizes"]!).map((k, v) => MapEntry<String, int>(k, v)),
    );
}

class Video {
    String? path;
    String? poster;

    Video({
        this.path,
        this.poster,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        path: json["path"],
        poster: json["poster"],
    );
}

class ASort {
    Asc? newest;
    Asc? popular;
    Asc? asc;
    Asc? desc;

    ASort({
        this.newest,
        this.popular,
        this.asc,
        this.desc,
    });

    factory ASort.fromJson(Map<String, dynamic> json) => ASort(
        newest: json["newest"] == null ? null : Asc.fromJson(json["newest"]),
        popular: json["popular"] == null ? null : Asc.fromJson(json["popular"]),
        asc: json["asc"] == null ? null : Asc.fromJson(json["asc"]),
        desc: json["desc"] == null ? null : Asc.fromJson(json["desc"]),
    );
}

class Asc {
    bool? active;

    Asc({
        this.active,
    });

    factory Asc.fromJson(Map<String, dynamic> json) => Asc(
        active: json["active"],
    );
}
