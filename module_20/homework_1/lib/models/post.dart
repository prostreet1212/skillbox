class Post {
  String? date;
  Guid? guid;
  Guid? title;
  Content? excerpt;
  BetterFeaturedImage? betterFeaturedImage;

  Post({
    date,
    guid,
    betterFeaturedImage,
  });

  Post.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    excerpt =
        json['excerpt'] != null ? Content.fromJson(json['excerpt']) : null;
    betterFeaturedImage = json['better_featured_image'] != null
        ? BetterFeaturedImage.fromJson(json['better_featured_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (guid != null) {
      data['guid'] = guid!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (excerpt != null) {
      data['excerpt'] = excerpt!.toJson();
    }
    if (betterFeaturedImage != null) {
      data['better_featured_image'] = betterFeaturedImage!.toJson();
    }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({rendered, protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }
}

class Meta {
  int? nggPostThumbnail;

  Meta({nggPostThumbnail});

  Meta.fromJson(Map<String, dynamic> json) {
    nggPostThumbnail = json['ngg_post_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ngg_post_thumbnail'] = nggPostThumbnail;
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
      {id,
      altText,
      caption,
      description,
      mediaType,
      mediaDetails,
      post,
      sourceUrl});

  BetterFeaturedImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    altText = json['alt_text'];
    caption = json['caption'];
    description = json['description'];
    mediaType = json['media_type'];
    mediaDetails = json['media_details'] != null
        ? MediaDetails.fromJson(json['media_details'])
        : null;
    post = json['post'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alt_text'] = altText;
    data['caption'] = caption;
    data['description'] = description;
    data['media_type'] = mediaType;
    if (mediaDetails != null) {
      data['media_details'] = mediaDetails!.toJson();
    }
    data['post'] = post;
    data['source_url'] = sourceUrl;
    return data;
  }
}

class MediaDetails {
  int? width;
  int? height;
  String? file;
  Sizes? sizes;
  ImageMeta? imageMeta;

  MediaDetails({width, height, file, sizes, imageMeta});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? ImageMeta.fromJson(json['image_meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['file'] = file;
    if (sizes != null) {
      data['sizes'] = sizes!.toJson();
    }
    if (imageMeta != null) {
      data['image_meta'] = imageMeta!.toJson();
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
      {mediumLarge,
      wptouchNewThumbnail,
      postThumbnail,
      sliderImage,
      mainSliderImage,
      postThumb,
      normalThumb,
      smallThumb,
      videoThumb});

  Sizes.fromJson(Map<String, dynamic> json) {
    mediumLarge = json['medium_large'] != null
        ? MediumLarge.fromJson(json['medium_large'])
        : null;
    wptouchNewThumbnail = json['wptouch-new-thumbnail'] != null
        ? MediumLarge.fromJson(json['wptouch-new-thumbnail'])
        : null;
    postThumbnail = json['post-thumbnail'] != null
        ? MediumLarge.fromJson(json['post-thumbnail'])
        : null;
    sliderImage = json['slider-image'] != null
        ? MediumLarge.fromJson(json['slider-image'])
        : null;
    mainSliderImage = json['main-slider-image'] != null
        ? MediumLarge.fromJson(json['main-slider-image'])
        : null;
    postThumb = json['post-thumb'] != null
        ? MediumLarge.fromJson(json['post-thumb'])
        : null;
    normalThumb = json['normal-thumb'] != null
        ? MediumLarge.fromJson(json['normal-thumb'])
        : null;
    smallThumb = json['small-thumb'] != null
        ? MediumLarge.fromJson(json['small-thumb'])
        : null;
    videoThumb = json['video-thumb'] != null
        ? MediumLarge.fromJson(json['video-thumb'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mediumLarge != null) {
      data['medium_large'] = mediumLarge!.toJson();
    }
    if (wptouchNewThumbnail != null) {
      data['wptouch-new-thumbnail'] = wptouchNewThumbnail!.toJson();
    }
    if (postThumbnail != null) {
      data['post-thumbnail'] = postThumbnail!.toJson();
    }
    if (sliderImage != null) {
      data['slider-image'] = sliderImage!.toJson();
    }
    if (mainSliderImage != null) {
      data['main-slider-image'] = mainSliderImage!.toJson();
    }
    if (postThumb != null) {
      data['post-thumb'] = postThumb!.toJson();
    }
    if (normalThumb != null) {
      data['normal-thumb'] = normalThumb!.toJson();
    }
    if (smallThumb != null) {
      data['small-thumb'] = smallThumb!.toJson();
    }
    if (videoThumb != null) {
      data['video-thumb'] = videoThumb!.toJson();
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

  MediumLarge({file, width, height, mimeType, sourceUrl});

  MediumLarge.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime-type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['width'] = width;
    data['height'] = height;
    data['mime-type'] = mimeType;
    data['source_url'] = sourceUrl;
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
  List<dynamic>? keywords;

  ImageMeta(
      {aperture,
      credit,
      camera,
      caption,
      createdTimestamp,
      copyright,
      focalLength,
      iso,
      shutterSpeed,
      title,
      orientation,
      keywords});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aperture'] = aperture;
    data['credit'] = credit;
    data['camera'] = camera;
    data['caption'] = caption;
    data['created_timestamp'] = createdTimestamp;
    data['copyright'] = copyright;
    data['focal_length'] = focalLength;
    data['iso'] = iso;
    data['shutter_speed'] = shutterSpeed;
    data['title'] = title;
    data['orientation'] = orientation;
    /*if ( keywords != null) {
      data['keywords'] =  keywords!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Author>? author;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links({self, author, versionHistory, predecessorVersion, wpTerm, curies});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(Self.fromJson(v));
      });
    }
    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(Author.fromJson(v));
      });
    }
    if (json['version-history'] != null) {
      versionHistory = <VersionHistory>[];
      json['version-history'].forEach((v) {
        versionHistory!.add(VersionHistory.fromJson(v));
      });
    }
    if (json['predecessor-version'] != null) {
      predecessorVersion = <PredecessorVersion>[];
      json['predecessor-version'].forEach((v) {
        predecessorVersion!.add(PredecessorVersion.fromJson(v));
      });
    }
    if (json['wp:term'] != null) {
      wpTerm = <WpTerm>[];
      json['wp:term'].forEach((v) {
        wpTerm!.add(WpTerm.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = <Curies>[];
      json['curies'].forEach((v) {
        curies!.add(Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (versionHistory != null) {
      data['version-history'] = versionHistory!.map((v) => v.toJson()).toList();
    }
    if (predecessorVersion != null) {
      data['predecessor-version'] =
          predecessorVersion!.map((v) => v.toJson()).toList();
    }
    if (wpTerm != null) {
      data['wp:term'] = wpTerm!.map((v) => v.toJson()).toList();
    }
    if (curies != null) {
      data['curies'] = curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Author {
  bool? embeddable;
  String? href;

  Author({embeddable, href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({count, href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['href'] = href;
    return data;
  }
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({id, href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['href'] = href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({taxonomy, embeddable, href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxonomy'] = taxonomy;
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({name, href, templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['href'] = href;
    data['templated'] = templated;
    return data;
  }
}
