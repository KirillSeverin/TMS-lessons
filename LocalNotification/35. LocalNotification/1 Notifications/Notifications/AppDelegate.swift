//
//  AppDelegate.swift
//  Notifications
//
//  Created by Martynov Evgeny on 5.05.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // для отправки уведомлений нам нужен notificationCenter
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        requestAutorization()
        notificationCenter.delegate = self
        return true
    }

    // настройка доступа
    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in

            print("Permission granted: \(granted)")

            if granted {
                self.getNotificationSettings()
            } else {
                //open setings app
                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                    DispatchQueue.main.async {
                        UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }

    // тк пользователь может поменять настройки в любой момент, то используем getNotificationSettings
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
        }
    }

    // расписание уведомлений
    func scheduleNotification(notificationType: String) {

        let content = UNMutableNotificationContent()
        let userAction = "User Action"

        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction // кастомные экшены

        // уведомление по времени
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // каждому запросу нужен identifire
        let identifire = "Local Notification"
        // запрос
        let request = UNNotificationRequest(identifier: identifire,
                                            content: content,
                                            trigger: trigger)

        // если нужно несколько - используйте уникальный identifire
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }

        // УНИКАЛЬНЫЕ ДЕЙСТВИЯ С Notification (до 4-х действий)
        // snoozeAction - позволит отложить уведомление на небольшой период времени
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        // удаление
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        // UNNotificationCategory - Тип уведомления, поддерживаемого вашим приложением, и пользовательские действия, отображаемые вместе с ним.
        let category = UNNotificationCategory(
            identifier: userAction,
            actions: [snoozeAction, deleteAction],
            intentIdentifiers: [],
            options: [])

        notificationCenter.setNotificationCategories([category])
    }
}

// сделаем extension что бы показать уведомление внутри приложения
extension AppDelegate: UNUserNotificationCenterDelegate {

    // если мы хотим не просто открывать приложение а и еще обрабатывать событие
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {

        if response.notification.request.identifier == "Local Notification" {
            print("Handling notification with the Local Notification Identifire")
        }

        switch response.actionIdentifier {
            // явно отклоняет уведомление
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
            // просто тапнет по нему
        case UNNotificationDefaultActionIdentifier:
            print("Default")
            // Snooze
        case "Snooze":
            print("Snooze")
            scheduleNotification(notificationType: "Reminder")
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }

        completionHandler()
    }
    
    // сработает когда мы получем уведомление при открытом приложении
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        completionHandler([.banner, .sound])
    }
}
