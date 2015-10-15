# UIImage-ASWhiteColorToAlpha

##When do I need it?

This is our original image:

![original](original.png)

This is our background:

![chessboard](Resources/chessboard_bg.png)

We want this result:

![white_color_to_alpha_on_chessboard](Resources/white_color_to_alpha_on_chessboard.png)

... which looks like this on white backgroud:

![white_color_to_alpha_on_white](Resources/white_color_to_alpha_on_white.png)

##How it works?

Copy `UIImage+ASWhiteColorToAlpha.h` and `UIImage+ASWhiteColorToAlpha.m` into your project.

Import UIImage+ASWhiteColorToAlpha.h

`#import UIImage+ASWhiteColorToAlpha.h`

Use -[UIImage imageWithWhiteColorToAlpha] method call to get your translucent image

`UIImage *myTranslicentImage = [myOriginalImage imageWithWhiteColorToAlpha];`


##Known issues

* Image rendering takes a long time and no option for async rendering
* Should be cached for reuse