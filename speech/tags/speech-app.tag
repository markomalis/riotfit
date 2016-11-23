<jumptest-app>
  <div class='col-xs-12'>
    <div class="btn-group btn-group-justified btn-group-lg mt10">
      <a href="#" class={btn: true, btn-success: true, disabled: !this.testIsInactive()} onclick={start}>Start!</a>
      <a href="#" class={btn: true, btn-danger: true, disabled: this.testIsInactive()} onclick={stop}>Stop</a>
    </div>
    <div class="panel mt10">
      <div class="panel-content">
        
      </div>
    </div>
  </div>

  <script>
  var actions = require('../actions/speech.js')
  //Variables holding the current max accelerations in all 3 directions
  var tag = this
  var store = this.opts.store
  this.state = store.getState()

  console.log(this.state)
  var unsubscribe = store.subscribe(function(){
    this.state = store.getState()
    console.log('new state: ', this.state)
    this.update()
  }.bind(this))

  start() {
    console.log('start');
  }

  stop(event) {
    console.log('stop');
  }
  </script>
</jumptest-app>
