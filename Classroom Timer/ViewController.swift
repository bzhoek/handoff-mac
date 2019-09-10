import Cocoa

let ActivityType = "com.zilverline.classroom.timer-running"

class ViewController: NSViewController {

  var keyStore: NSUbiquitousKeyValueStore?

  override func viewDidLoad() {
    super.viewDidLoad()

    keyStore = NSUbiquitousKeyValueStore()

    NotificationCenter.default.addObserver(self, selector: #selector(onUbiquitousKeyValueStoreDidChangeExternally(notification:)), name: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: keyStore)
  }

  @objc func onUbiquitousKeyValueStoreDidChangeExternally(notification: Notification) {
    print("changed \(keyStore?.object(forKey: "timer"))")
    self.view.window?.orderFrontRegardless()
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }

  @IBAction func activity(_ sender: Any) {
    startActivity()
  }

  func startActivity() {
    print("startActivity")
    let activity = NSUserActivity(activityType: ActivityType)
    activity.title = "Running Timer"
    self.userActivity = activity;
    self.userActivity?.becomeCurrent()

    keyStore?.set(Date(), forKey: "timer")
    keyStore?.synchronize()
    print(keyStore?.object(forKey: "timer"))
  }

  override func updateUserActivityState(_ userActivity: NSUserActivity) {
    print("updateUserActivityState")
    super.updateUserActivityState(userActivity)

    userActivity.addUserInfoEntries(from: ["Time": NSDate()])

    // kan ook iCloud file URL
  }

}

