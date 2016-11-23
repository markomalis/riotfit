<jumptest-app>
  <div class='col-xs-12'>
    <div class="btn-group btn-group-justified btn-group-lg mt10">
      <a href="#" class="btn btn-success {disabled: !this.testIsInactive()}" onclick={track}>Jump!</a>
      <a href="#" class="btn btn-danger {disabled: this.testIsInactive()}" onclick={stop}>Stop</a>
    </div>
    <div class='panel mt10'>
      <div class="panel-content">
        <img style="width: 30%" src='/images/jump.svg' class="jumpman {jumping: !this.testIsInactive()}"></img>
        <p class={hidden: testIsInactive()}>X: {state.maxValues.x_a}</p>
        <p class={hidden: testIsInactive()}>Y: {state.maxValues.y_a}</p>
        <p class={hidden: testIsInactive()}>Z: {state.maxValues.z_a}</p>
        <p class={hidden: testIsInactive()}>Height:{this.calculateHeight()}</p>
        <div class={hidden: testIsInactive()}>
          <h3>Orientation:</h3>
          <p>alpha:{state.orientation.a} deg</p>
          <p>beta:{state.orientation.b} deg</p>
          <p>gamma:{state.orientation.g} deg</p>
        </div>
        <span class={hidden: !testIsInactive()}>JUMP JUMP JUMP!!!</span>
      </div>
      <div class='circle bounce'></div>
    </div>
  </div>

  <script>
  var actions = require('../actions/jumptest.js')
  //Variables holding the current max accelerations in all 3 directions
  this.orientation = -1
  var tag = this
  var store = this.opts.store
  this.state = store.getState()

  console.log(this.state)
  var unsubscribe = store.subscribe(function(){
    this.state = store.getState()
    console.log('new state: ', this.state)
    this.update()
  }.bind(this))

  calculateHeight() {
    var flight_time = 0.05
    var max = Math.max(this.state.maxValues.x_a, this.state.maxValues.y_a, this.state.maxValues.z_a)
    var height = ((max*flight_time)*(max*flight_time))/(2*9.81)
    return height
  }

  consoleLogger(message) {
    console.log(message);
  }

  recordCheck() {
    var h = this.calculateHeight()
    if(h > 1.5){
      alert("New Record!");
      // request to /notify/new_record
      var xmlHttp = new XMLHttpRequest();
      xmlHttp.open( "GET", '/notify/new_record', false ); // false for synchronous request
      xmlHttp.send( null );
      return xmlHttp.responseText;
    }
  }

  setOrientationDuringMax() {

  }

  stop(event) {
    window.removeEventListener('devicemotion', this.consoleLogger('Stopped devicemotion'))
    store.dispatch(actions.setTestState(actions.STOPPED))
  }

  testIsInactive() {
    return (this.state.testState == actions.INITIAL || this.state.testState == actions.STOPPED)
  }

  track(click){
    //Initialize the acceleration variables
    tag.x_a = 0
    tag.y_a = 0
    tag.z_a = 0
    //Update our state so we know the test is now running
    store.dispatch(actions.setTestState(actions.RUNNING))
    //Add the devicemotion listener
    window.addEventListener('devicemotion', (event) => this.updateCheck(event))
    window.addEventListener('deviceorientation', (event) => this.updateOrientation(event))
  }

  updateCheck(event) {
    console.log('in updateCheck')
    console.log(event)
    var updated = false
    if(event.acceleration.x > tag.x_a){
      tag.x_a = Math.round(event.acceleration.x)
      updated = true
    }
    if(event.acceleration.y > tag.y_a){
      tag.y_a = Math.round(event.acceleration.y)
      updated = true
    }
    if(event.acceleration.z > tag.z_a){
      tag.z_a = Math.round(event.acceleration.z)
      updated = true
    }

    if(updated) {
      this.setOrientationDuringMax()
      this.updateMax({
        x_a : tag.x_a,
        y_a : tag.y_a,
        z_a : tag.z_a
      })
    }
  }

  updateMax(values) {
    this.recordCheck()
    store.dispatch(actions.updateMaxValues(values))
  }

  updateOrientation(event) {
    console.log("in updateOrientation")
    console.log(event)
    store.dispatch(actions.updateOrientation({
      a: Math.round(event.alpha),
      b: Math.round(event.beta),
      g: Math.round(event.gamma)
    }))
  }
  </script>

  <style>
    @keyframes bounce {
      50% {
        width: 100px;
        height: 100px;
        background-color: #7ac9ed;
      }
      100% {
        width: 120px;
        height: 120px;
        background-color: #69c773;
      }
    }

    @keyframes jump {
      0%{
        margin-top: 0px;
      }
      50%{
        margin-top: 25px;
      }
      100%{
        margin-top: 0px;
      }
    }

    .circle.bounce {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background-color: #d2003f;
      animation-name: bounce;
      animation-duration: .5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    .jumpman.jumping {
      animation-name: jump;
      animation-duration: 1s;
      animation-timing-function: linear;;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }


  </style>

</jumptest-app>
