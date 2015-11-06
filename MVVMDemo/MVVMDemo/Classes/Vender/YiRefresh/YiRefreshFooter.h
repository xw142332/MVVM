
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^BeginRefreshingBlock)(void);
@interface YiRefreshFooter : NSObject
@property UIScrollView *scrollView;
@property (nonatomic, copy) BeginRefreshingBlock beginRefreshingBlock;


-(void)footer;

-(void)endRefreshing;
-(void)beginRefreshing;
@end
