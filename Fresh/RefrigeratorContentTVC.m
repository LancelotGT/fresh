//
//  RefrigeratorContentTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "RefrigeratorContentTVC.h"
#import "FlickrFetcher.h"
#import "FoodContentViewController.h"

@interface RefrigeratorContentTVC ()

@end

@implementation RefrigeratorContentTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchContents];
}

- (void) fetchContents {
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Block Main Thread
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization  JSONObjectWithData:jsonResults options:0 error:NULL];
    //NSLog(@"Content results = %@", propertyListResults);
    NSArray *contents = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.contents = contents;
}


#pragma mark - Navigation


- (void)prepareFoodContentViewController:(FoodContentViewController *)fcvc toDisplayPhoto:(NSDictionary *)photo {
    fcvc.foodImageURL = [FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatOriginal];
    fcvc.foodTitle = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            [self prepareFoodContentViewController:segue.destinationViewController toDisplayPhoto:self.contents[indexPath.row]];
        }
    }
}


@end
