#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^BeginRefreshingBlock)(void);



@interface YiRefreshHeader : NSObject
@property UIScrollView *scrollView;
@property (nonatomic, copy) BeginRefreshingBlock beginRefreshingBlock;

-(void)header;


-(void)endRefreshing;
-(void)beginRefreshing;

@end
