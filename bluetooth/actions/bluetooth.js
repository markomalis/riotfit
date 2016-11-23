export const CONNECT_DEVICE = "CONNECT_DEVICE"
export const SEARCH_DEVICES = "SEARCH_DEVICES"

export const connectDevice = function(device) {
  return {
    type: CONNECT_DEVICE,
    device: device
  }
}

export const searchDevices = function() {
  return {
    type: SEARCH_DEVICES,
  }
}
