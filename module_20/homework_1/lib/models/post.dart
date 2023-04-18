class Post {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<int>? categories;
  List<Null>? tags;
  BetterFeaturedImage? betterFeaturedImage;
  Links? lLinks;

  Post(
      {this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.categories,
        this.tags,
        this.betterFeaturedImage,
        this.lLinks});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    categories = json['categories'].cast<int>();
   /* if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(new Null.fromJson(v));
      });
    }*/
    betterFeaturedImage = json['better_featured_image'] != null
        ? new BetterFeaturedImage.fromJson(json['better_featured_image'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid!.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt!.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['categories'] = this.categories;
    /*if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }*/
    if (this.betterFeaturedImage != null) {
      data['better_featured_image'] = this.betterFeaturedImage!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class Meta {
  int? nggPostThumbnail;

  Meta({this.nggPostThumbnail});

  Meta.fromJson(Map<String, dynamic> json) {
    nggPostThumbnail = json['ngg_post_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngg_post_thumbnail'] = this.nggPostThumbnail;
    return data;
  }
}

class BetterFeaturedImage {
  int? id;
  String? altText;
  String? caption;
  String? description;
  String? mediaType;
  MediaDetails? mediaDetails;
  int? post;
  String? sourceUrl;

  BetterFeaturedImage(
      {this.id,
        this.altText,
        this.caption,
        this.description,
        this.mediaType,
        this.mediaDetails,
        this.post,
        this.sourceUrl});

  BetterFeaturedImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    altText = json['alt_text'];
    caption = json['caption'];
    description = json['description'];
    mediaType = json['media_type'];
    mediaDetails = json['media_details'] != null
        ? new MediaDetails.fromJson(json['media_details'])
        : null;
    post = json['post'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alt_text'] = this.altText;
    data['caption'] = this.caption;
    data['description'] = this.description;
    data['media_type'] = this.mediaType;
    if (this.mediaDetails != null) {
      data['media_details'] = this.mediaDetails!.toJson();
    }
    data['post'] = this.post;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class MediaDetails {
  int? width;
  int? height;
  String? file;
  Sizes? sizes;
  ImageMeta? imageMeta;

  MediaDetails(
      {this.width, this.height, this.file, this.sizes, this.imageMeta});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? new ImageMeta.fromJson(json['image_meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['file'] = this.file;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.toJson();
    }
    if (this.imageMeta != null) {
      data['image_meta'] = this.imageMeta!.toJson();
    }
    return data;
  }
}

class Sizes {
  MediumLarge? mediumLarge;
  MediumLarge? wptouchNewThumbnail;
  MediumLarge? postThumbnail;
  MediumLarge? sliderImage;
  MediumLarge? mainSliderImage;
  MediumLarge? postThumb;
  MediumLarge? normalThumb;
  MediumLarge? smallThumb;
  MediumLarge? videoThumb;

  Sizes(
      {this.mediumLarge,
        this.wptouchNewThumbnail,
        this.postThumbnail,
        this.sliderImage,
        this.mainSliderImage,
        this.postThumb,
        this.normalThumb,
        this.smallThumb,
        this.videoThumb});

  Sizes.fromJson(Map<String, dynamic> json) {
    mediumLarge = json['medium_large'] != null
        ? new MediumLarge.fromJson(json['medium_large'])
        : null;
    wptouchNewThumbnail = json['wptouch-new-thumbnail'] != null
        ? new MediumLarge.fromJson(json['wptouch-new-thumbnail'])
        : null;
    postThumbnail = json['post-thumbnail'] != null
        ? new MediumLarge.fromJson(json['post-thumbnail'])
        : null;
    sliderImage = json['slider-image'] != null
        ? new MediumLarge.fromJson(json['slider-image'])
        : null;
    mainSliderImage = json['main-slider-image'] != null
        ? new MediumLarge.fromJson(json['main-slider-image'])
        : null;
    postThumb = json['post-thumb'] != null
        ? new MediumLarge.fromJson(json['post-thumb'])
        : null;
    normalThumb = json['normal-thumb'] != null
        ? new MediumLarge.fromJson(json['normal-thumb'])
        : null;
    smallThumb = json['small-thumb'] != null
        ? new MediumLarge.fromJson(json['small-thumb'])
        : null;
    videoThumb = json['video-thumb'] != null
        ? new MediumLarge.fromJson(json['video-thumb'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediumLarge != null) {
      data['medium_large'] = this.mediumLarge!.toJson();
    }
    if (this.wptouchNewThumbnail != null) {
      data['wptouch-new-thumbnail'] = this.wptouchNewThumbnail!.toJson();
    }
    if (this.postThumbnail != null) {
      data['post-thumbnail'] = this.postThumbnail!.toJson();
    }
    if (this.sliderImage != null) {
      data['slider-image'] = this.sliderImage!.toJson();
    }
    if (this.mainSliderImage != null) {
      data['main-slider-image'] = this.mainSliderImage!.toJson();
    }
    if (this.postThumb != null) {
      data['post-thumb'] = this.postThumb!.toJson();
    }
    if (this.normalThumb != null) {
      data['normal-thumb'] = this.normalThumb!.toJson();
    }
    if (this.smallThumb != null) {
      data['small-thumb'] = this.smallThumb!.toJson();
    }
    if (this.videoThumb != null) {
      data['video-thumb'] = this.videoThumb!.toJson();
    }
    return data;
  }
}

class MediumLarge {
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;

  MediumLarge(
      {this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  MediumLarge.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime-type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime-type'] = this.mimeType;
    data['source_url'] = this.sourceUrl;
    return data;
  }
}

class ImageMeta {
  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<Null>? keywords;

  ImageMeta(
      {this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords});

  ImageMeta.fromJson(Map<String, dynamic> json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
  /*  if (json['keywords'] != null) {
      keywords = <Null>[];
      json['keywords'].forEach((v) {
        keywords!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aperture'] = this.aperture;
    data['credit'] = this.credit;
    data['camera'] = this.camera;
    data['caption'] = this.caption;
    data['created_timestamp'] = this.createdTimestamp;
    data['copyright'] = this.copyright;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    data['shutter_speed'] = this.shutterSpeed;
    data['title'] = this.title;
    data['orientation'] = this.orientation;
    /*if (this.keywords != null) {
      data['keywords'] = this.keywords!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Links {
  List<Self>? self;
  //List<Collection>? collection;
 // List<About>? about;
  List<Author>? author;
  //List<Replies>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
 // List<WpFeaturedmedia>? wpFeaturedmedia;
  //List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links(
      {this.self,
       // this.collection,
        //this.about,
        this.author,
        //this.replies,
        this.versionHistory,
        this.predecessorVersion,
        //this.wpFeaturedmedia,
        //this.wpAttachment,
        this.wpTerm,
        this.curies});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    /*if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }
    if (json['about'] != null) {
      about = <About>[];
      json['about'].forEach((v) {
        about!.add(new About.fromJson(v));
      });
    }*/
    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(new Author.fromJson(v));
      });
    }
    /*if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }*/
    if (json['version-history'] != null) {
      versionHistory = <VersionHistory>[];
      json['version-history'].forEach((v) {
        versionHistory!.add(new VersionHistory.fromJson(v));
      });
    }
    if (json['predecessor-version'] != null) {
      predecessorVersion = <PredecessorVersion>[];
      json['predecessor-version'].forEach((v) {
        predecessorVersion!.add(new PredecessorVersion.fromJson(v));
      });
    }
    /*if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = <WpFeaturedmedia>[];
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia!.add(new WpFeaturedmedia.fromJson(v));
      });
    }*/
    /*if (json['wp:attachment'] != null) {
      wpAttachment = <WpAttachment>[];
      json['wp:attachment'].forEach((v) {
        wpAttachment!.add(new WpAttachment.fromJson(v));
      });
    }*/
    if (json['wp:term'] != null) {
      wpTerm = <WpTerm>[];
      json['wp:term'].forEach((v) {
        wpTerm!.add(new WpTerm.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = <Curies>[];
      json['curies'].forEach((v) {
        curies!.add(new Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    /*if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    if (this.about != null) {
      data['about'] = this.about!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author!.map((v) => v.toJson()).toList();
    }
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }*/
    if (this.versionHistory != null) {
      data['version-history'] =
          this.versionHistory!.map((v) => v.toJson()).toList();
    }
    if (this.predecessorVersion != null) {
      data['predecessor-version'] =
          this.predecessorVersion!.map((v) => v.toJson()).toList();
    }
    /*if (this.wpFeaturedmedia != null) {
      data['wp:featuredmedia'] =
          this.wpFeaturedmedia!.map((v) => v.toJson()).toList();
    }
    if (this.wpAttachment != null) {
      data['wp:attachment'] =
          this.wpAttachment!.map((v) => v.toJson()).toList();
    }*/
    if (this.wpTerm != null) {
      data['wp:term'] = this.wpTerm!.map((v) => v.toJson()).toList();
    }
    if (this.curies != null) {
      data['curies'] = this.curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Author {
  bool? embeddable;
  String? href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['href'] = this.href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this.taxonomy;
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}
