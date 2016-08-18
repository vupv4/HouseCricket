// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
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
@import ObjectiveC;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSCoder;
@class NSDictionary;


/// Object that will support NSCoding, Printable, Hashable and Equeatable for all properties. Use this object as your base class instead of NSObject and you wil automatically have support for all these protocols.
SWIFT_CLASS("_TtC12EVReflection8EVObject")
@interface EVObject : NSObject <NSCoding>

/// This basic init override is needed so we can use EVObject as a base class.
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Decode any object
///
/// This method is in EVObject and not in NSObject because you would get the error: Initializer requirement 'init(coder:)' can
/// only be satisfied by a <code>required
/// </code> initializer in the definition of non-final class 'NSObject'
///
/// -parameter coder: The NSCoder that will be used for decoding the object.
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder;

/// Convenience init for creating an object whith the property values of a dictionary.
///
/// -parameter dictionary: The dictionary that will be used to create this object
- (nonnull instancetype)initWithDictionary:(NSDictionary * _Nonnull)dictionary;

/// Convenience init for creating an object whith the contents of a json string.
///
/// :json: The json string that will be used to create this object
- (nonnull instancetype)initWithJson:(NSString * _Nullable)json;

/// Encode this object using a NSCoder
///
/// \param aCoder The NSCoder that will be used for encoding the object
- (void)encodeWithCoder:(NSCoder * _Nonnull)aCoder;

/// Initialize this object from an archived file from the temp directory
///
/// \param fileNameInTemp The filename
- (nonnull instancetype)initWithFileNameInTemp:(NSString * _Nonnull)fileNameInTemp;

/// Initialize this object from an archived file from the documents directory
///
/// \param fileNameInDocuments The filename
- (nonnull instancetype)initWithFileNameInDocuments:(NSString * _Nonnull)fileNameInDocuments;

/// Returns the pritty description of this object
///
/// \returns  The pritty description
@property (nonatomic, readonly, copy) NSString * _Nonnull description;

/// Returns the pritty description of this object
///
/// \returns  The pritty description
@property (nonatomic, readonly, copy) NSString * _Nonnull debugDescription;

/// Returns the hashvalue of this object
///
/// \returns  The hashvalue of this object
@property (nonatomic, readonly) NSInteger hashValue;

/// Function for returning the hash for the NSObject based functionality
///
/// \returns  The hashvalue of this object
@property (nonatomic, readonly) NSUInteger hash;

/// Save this object to a file in the temp directory
///
/// \param fileName The filename
///
/// \returns  Nothing
- (BOOL)saveToTemp:(NSString * _Nonnull)fileName;

/// Save this object to a file in the documents directory
///
/// \param fileName The filename
///
/// \returns  true if successfull
- (BOOL)saveToDocuments:(NSString * _Nonnull)fileName;

/// Implementation of the NSObject isEqual comparisson method
///
/// This method is in EVObject and not in NSObject extension because you would get the error: method conflicts with previous declaration with the same Objective-C selector
///
/// \param object The object where you want to compare with
///
/// \returns  Returns true if the object is the same otherwise false
- (BOOL)isEqual:(id _Nullable)object;

/// Implementation of the setValue forUndefinedKey so that we can catch exceptions for when we use an optional Type like Int? in our object. Instead of using Int? you should use NSNumber?
///
/// This method is in EVObject and not in NSObject extension because you would get the error: method conflicts with previous declaration with the same Objective-C selector
///
/// \param value The value that you wanted to set
///
/// \param key The name of the property that you wanted to set
- (void)setValue:(id _Null_unspecified)value forUndefinedKey:(NSString * _Nonnull)key;

/// When a property is declared as a base type for multiple enherited classes, then this function will let you pick the right specific type based on the suplied dictionary.
///
/// \param dict The dictionary for the specific type
///
/// \returns  The specific type
- (EVObject * _Nonnull)getSpecificType:(NSDictionary * _Nonnull)dict;

/// Returns the dictionary representation of this object.
///
/// \param performKeyCleanup set to true if you want to cleanup the keys
///
/// \returns  The dictionary
- (NSDictionary * _Nonnull)toDictionary:(BOOL)performKeyCleanup;

/// Convert this object to a json string
///
/// \param performKeyCleanup set to true if you want to cleanup the keys
///
/// \returns  The json string
- (NSString * _Nonnull)toJsonString:(BOOL)performKeyCleanup;
@end

#pragma clang diagnostic pop
