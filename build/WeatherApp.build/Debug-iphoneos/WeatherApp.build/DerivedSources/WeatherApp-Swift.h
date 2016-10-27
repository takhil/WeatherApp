// Generated by Apple Swift version 2.3 (swiftlang-800.10.12 clang-800.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreLocation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC10WeatherApp11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
@property (nonatomic, strong) NSURL * _Nonnull applicationDocumentsDirectory;
@property (nonatomic, strong) NSManagedObjectModel * _Nonnull managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator * _Nonnull persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext * _Nonnull managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10WeatherApp18CurrentTemperature")
@interface CurrentTemperature : NSObject
@property (nonatomic, copy) NSString * _Null_unspecified currentLocation;
@property (nonatomic, copy) NSString * _Null_unspecified currentDay;
@property (nonatomic, copy) NSString * _Null_unspecified currentIcon;
@property (nonatomic, copy) NSString * _Null_unspecified currentIconType;
- (nonnull instancetype)initWithCurrentLocation:(NSString * _Nonnull)currentLocation currentTemperatureInF:(NSInteger)currentTemperatureInF currentDay:(NSString * _Nonnull)currentDay currentDayHighTemp:(NSInteger)currentDayHighTemp currentDayLowTemp:(NSInteger)currentDayLowTemp currentIcon:(NSString * _Nonnull)currentIcon currentIconType:(NSString * _Nonnull)currentIconType OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10WeatherApp20ForeCastTemperatures")
@interface ForeCastTemperatures : NSObject
@property (nonatomic, copy) NSString * _Null_unspecified foreCastDay;
@property (nonatomic, copy) NSString * _Null_unspecified foreCastIcon;
- (nonnull instancetype)initWithForeCastDay:(NSString * _Nonnull)foreCastDay foreCastHighTempInF:(NSInteger)foreCastHighTempInF foreCastLowTempInF:(NSInteger)foreCastLowTempInF foreCastIcon:(NSString * _Nonnull)foreCastIcon OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionView;
@class NSIndexPath;
@class UICollectionViewCell;
@class UICollectionViewLayout;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10WeatherApp21HourlyTemperatureView")
@interface HourlyTemperatureView : UICollectionViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithCollectionViewLayout:(UICollectionViewLayout * _Nonnull)layout OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10WeatherApp18HourlyTemperatures")
@interface HourlyTemperatures : NSObject
@property (nonatomic, copy) NSString * _Null_unspecified hourlyTime;
@property (nonatomic, copy) NSString * _Null_unspecified hourlyIcon;
@property (nonatomic, copy) NSString * _Null_unspecified hourlyAmPm;
@property (nonatomic, copy) NSString * _Null_unspecified displayHour;
- (nonnull instancetype)initWithHourlyTemperatureInF:(NSInteger)hourlyTemperatureInF hourlyTime:(NSString * _Nonnull)hourlyTime hourlyIcon:(NSString * _Nonnull)hourlyIcon hourlyAmPm:(NSString * _Nonnull)hourlyAmPm OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10WeatherApp21TemperatureScalesView")
@interface TemperatureScalesView : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class UITableViewCell;

SWIFT_CLASS("_TtC10WeatherApp18TenDayForeCastView")
@interface TenDayForeCastView : UITableViewController
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull array;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10WeatherApp17WeatherConnection")
@interface WeatherConnection : NSObject
+ (void)getTemperatures:(NSString * _Nonnull)zipCode state:(NSString * _Nonnull)state country:(NSString * _Nonnull)country locality:(NSString * _Nonnull)locality;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class CLLocationManager;
@class CLLocation;
@class CLPlacemark;
@class NSError;
@class UIStoryboardSegue;
@class UIPresentationController;
@class UIScrollView;
@class UILabel;
@class UIImageView;

SWIFT_CLASS("_TtC10WeatherApp11WeatherView")
@interface WeatherView : UIViewController <UIAdaptivePresentationControllerDelegate, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate>
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified scrollView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleText;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified currentTemperature;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified currentTemperatureImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified currentTemperatureCondition;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified currentDay;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified currentHighTemperature;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified currentLowTemperature;
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified hourlyScrollView;
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified tenDayScrollView;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)getLocation;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateToLocation:(CLLocation * _Nonnull)newLocation fromLocation:(CLLocation * _Nonnull)oldLocation;
- (void)displayLocationInfo:(CLPlacemark * _Nullable)placemark;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)settingsButton:(id _Nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController * _Nonnull)controller;
- (IBAction)editButton:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop