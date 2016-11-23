<bluetooth-app>
  <button class='btn btn-default' onclick={search}>Search devices!</button>
  <button class='btn btn-default' onclick={read}>Read from devices!</button>
  <button class='btn btn-default' onclick={write}>Write to devices!</button>
  <script>
    var store = this.opts.store
    var characteristic_map = new Map()
    this.state = store.getState()
    console.log(this.state)
    var unsubscribe = store.subscribe(function(){
      this.state = store.getState()
      console.log('new state: ', this.state)
      this.update()
    }.bind(this))

    connect() {
      console.log('connect')
      chrome.bluetooth.getAdapterState(function(adapter) {
        console.log("Adapter " + adapter.address + ": " + adapter.name);
      });
    }
    anyDeviceFilter() {
      // This is the closest we can get for now to get all devices.
      // https://github.com/WebBluetoothCG/web-bluetooth/issues/234
      return Array.from('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
        .map(c => ({namePrefix: c}))
        .concat({name: ''});
    }

    read() {
      console.log("in read");

      for([uuid, characteristic] of characteristic_map){
        characteristic.readValue()
        .then(value => {
          console.log(value.getUint8(0))
        })
        .catch(error => {
          console.log(error)
        })
      }
    }

    search() {
      console.log('in search')
      navigator.bluetooth.requestDevice({
        filters: this.anyDeviceFilter(),
        optionalServices: ['battery_service']
      })
      .then(device => {
        console.log(device)
        return device.gatt.connect()
      })
      .then(server => {
        console.log('in server part')
        return server.getPrimaryService(0x180D)
      })
      .then(service => {
        console.log('in service part')
        return this.cacheCharacteristic(service, 0x2A19)
      })
      .catch(error => {
        console.log(error)
      })
    }

    write() {
      console.log("in write");

      for([uuid, characteristic] of characteristic_map){
        characteristic.writeValue(new Uint8Array([23]))
        .then(value => {
          console.log('succes')
        })
        .catch(error => {
          console.log(error)
        })
      }
    }

    cacheCharacteristic(service, characteristicUuid){
      console.log("caching characteristic");
      return service.getCharacteristic(characteristicUuid)
      .then( characteristic => {
        characteristic_map.set(characteristicUuid, characteristic)
      })
    }

  </script>

</bluetooth-app>
