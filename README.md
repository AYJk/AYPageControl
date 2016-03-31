# AYPageControl
[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/AYJk/AYPageControl/blob/master/License)&nbsp;
![CocoaPods Version](https://img.shields.io/badge/pod-v0.0.2-brightgreen.svg)
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-ayjkdev.top-orange.svg)](http://ayjkdev.top/)&nbsp;


一个有动效的PageControl，效果图如下：

![效果图](http://7xrofo.com1.z0.glb.clouddn.com/version002.gif)
##如何使用
###1.导入头文件
```objc
#import "AYPageControl.h"
```
###2.为pageControl设置总页数并绑定scrollview
```objc
//	设置总页数
self.pageControlView.numberOfPages = totalPages;
//	绑定对应的scrollview
self.pageControlView.bindingScrollView = self.bannerScrollView;
```
###3.在代理方法中设置pageControl的属性
```
//	将scrollview的contentOffset.x赋值给pageControl进行计算
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControlView.contentOffset_x = scrollView.contentOffset.x;
}
```
##更新内容
###v0.0.2
  
  * 优化了滑动视图时，小球的形变动画。

###v0.0.1
  
  * 首次提交：实现动画

##License
This project is under MIT License. See LICENSE file for more information.
