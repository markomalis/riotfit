<pagecontent>
    <div class='row'>
      <div class='col-xs-12'>
        <div id="pc_content" class="panel panel-default">
          <div class="panel-body">
            <div class="row">
              <div class="col-xs-12 col-sm-6">
                <img class="full-width" src="/images/timeline.png">
              </div>
              <div class="col-xs-12 col-sm-6">
                <img class="full-width" src="/images/timeline.png">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
        getExercise(e) {
            this.opts.selectexercise(e.item.index)
            window.scrollTo(0, 0);
        }
    </script>

    <style>
      @keyframes close {
        0%{
          width: 100%;
        }
        50%{
          width: 50%;
        }
        100%{
          width: 0%;
        }
      }

      #pc_content.closed {
        animation-name: close;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-fill-mode: forwards;
      }

      #pc_content.open {
        animation-name: close;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-fill-mode: forwards;
        animation-direction: reverse;
      }
    </style>
</pagecontent>
