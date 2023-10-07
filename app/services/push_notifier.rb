# frozen_string_literal: true

class PushNotifier
  def self.notify_item_quantity_change(title, item)
    fcm_client = FCM.new(Rails.application.credentials[:fcm][:secret_key])
    options = {
      notification: {
          title: title,
          body: "Item #{item.id} quantity has been updated",
          "icon": "",
      },
      priority: 'high'
    }
    fcm_client.send_notification(UserDevice.pluck(:device_token), options)
  end
end