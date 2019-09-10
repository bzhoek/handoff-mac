import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  func applicationDidFinishLaunching(_ aNotification: Notification) {
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func application(_ application: NSApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
    print(userActivityType)
    return false
  }

  func application(_ application: NSApplication, didUpdate userActivity: NSUserActivity) {
    print("mac didUpdate \(userActivity)")
  }

  func application(_ application: NSApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void) -> Bool {
    print("mac continue \(userActivity.userInfo)")
    return true
  }

}
