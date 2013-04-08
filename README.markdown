#CHCGI

CGIKit is an Objective-C class to aid in the writing of Cocoa CGI scripts for the [cocoahub](https://github.com/iwascoding/cocoahub) server software.

# How do I use this

To create your own CGI handler for the cocoahub, duplicate the [cocahub sample CGI repository](https://github.com/iwascoding/cocoahubSampleCGI) or follow these steps:

* Create a new command-line tool project in Xcode of type 'Foundation'
* Create a Podfile, like this

```
platform :osx, '10.7'
pod 'CHCGI', :podspec => 'https://raw.github.com/iwascoding/CHCGI/master/CHCGI.podspec'
```
* In your project's root directory, run the "pod install" command. (Did I mention that you need a working CocoaPods installation?)
* Create a subclass of CHCGI and overwrite the method 'responseForRequest:' like this: 

```
- (NSHTTPURLResponse*) responseForRequest:(NSURLRequest*)inRequest
{
	NSString			*responseString;
	NSHTTPURLResponse	*response = [[NSHTTPURLResponse alloc] initWithURL:nil
															  statusCode:200
															 HTTPVersion:@"1.1"
															headerFields:@{@"Customer Header" : @"Value"}];
	
	responseString = [NSString stringWithFormat:@"<html><head></head><body>Hello World, this is cocoahub!<br/><br/> \
					  I received a %@ request for URI %@</body></html>",
					  inRequest.HTTPMethod,
					  [inRequest.URL absoluteString]];
	
	self.responseHTTPBody = [responseString dataUsingEncoding:NSUTF8StringEncoding];
	self.contentType = @"text/html";
	
	return response;
}
```
* Your main method you look like this:

```
int main(int argc, const char * argv[])
{
	@autoreleasepool 
	{
	    // insert code here...
	    [[[MYCustomCGIClass alloc] init] generateResponse];
	}
    return 0;
}
```


##License

CHCGI is licensed under the MIT license, which is reproduced in its entirety here:

>Copyright (c) 2013 iwascoding GmbH
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in
>all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>THE SOFTWARE., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.