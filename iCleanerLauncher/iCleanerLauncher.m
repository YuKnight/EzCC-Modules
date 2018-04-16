#import "iCleanerLauncher.h"
#import "spawn.h"

@interface UIApplication (PrivateMethods)
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspend;
@end

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation iCleanerLauncher
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return nil;// not much point having this as it can confuse people
}

- (BOOL)isSelected {
	return self.iCleanerLauncher;
}

- (void)setSelected:(BOOL)selected {
  self.iCleanerLauncher = selected;
	[super refreshState];
    [self icleaner];
}

- (void)icleaner {
  NSString *bundleID = @"com.exile90.icleanerpro";
  [[UIApplication sharedApplication] launchApplicationWithIdentifier:bundleID suspended:FALSE];
		self.iCleanerLauncher = NO;
		
}
@end
