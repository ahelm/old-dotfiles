-- Change keyboard layout to match the layout of
-- "Corsair STRAFE Gaming Keyboard"
usbKeyboardLayout = nil

function corsairKeyboard(data)
  if(data["productName"] == "Corsair STRAFE Gaming Keyboard") then
    if (data["eventType"] == "added") then
      hs.keycodes.setLayout("U.S. International - PC")
    elseif (data["eventType"] == "removed") then
      hs.keycodes.setLayout("Portuguese")
    end
  end
end

usbKeyboardLayout = hs.usb.watcher.new(corsairKeyboard)
usbKeyboardLayout:start()

-- Turn off Wifi Apples Ethernet Adapter is connected
usbEthernetAdapter = nil

function appleEthernetAdapter(data)
  if(data["productName"] == "Apple USB Ethernet Adapter") then
    if (data["eventType"] == "added") then
      hs.wifi.setPower(false)
    elseif (data["eventType"] == "removed") then
      hs.wifi.setPower(true)
    end
  end
end

usbEthernetAdapter = hs.usb.watcher.new(appleEthernetAdapter)
usbEthernetAdapter:start()
