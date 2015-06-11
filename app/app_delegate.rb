class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    error_pointer = Pointer.new(:object)
    result = "this is some test text".dataUsingEncoding(NSUTF8StringEncoding).writeToFile("/Users/#{NSUserName()}/test.txt", options: NSDataWritingWithoutOverwriting, error: error_pointer)
    
    if result
      NSLog "File saved successfully."
    else
      error = error_pointer[0]
      NSLog "Unable to save file - #{error.localizedDescription}"
    end
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end
end
