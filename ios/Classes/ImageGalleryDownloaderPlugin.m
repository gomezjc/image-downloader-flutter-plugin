#import "ImageGalleryDownloaderPlugin.h"
#if __has_include(<image_gallery_downloader/image_gallery_downloader-Swift.h>)
#import <image_gallery_downloader/image_gallery_downloader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "image_gallery_downloader-Swift.h"
#endif

@implementation ImageGalleryDownloaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImageGalleryDownloaderPlugin registerWithRegistrar:registrar];
}
@end
