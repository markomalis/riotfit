<pagecontrol>
  <div class='row mb15'>
    <div class='col-xs-12'>
      <div class="btn-group full-width">
        <button type="button" class="btn btn-lg btn-default">
          <span class='hidden-xs'>Personal Records <span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
          <span class='visible-xs'>PRs <span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          <span class='hidden-xs'>Statistics <span class="glyphicon glyphicon-signal" aria-hidden="true"></span></span>
          <span class='visible-xs'>Stats <span class="glyphicon glyphicon-signal" aria-hidden="true"></span></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          <span class='hidden-xs'>Add <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
          <span class='visible-xs'><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
        </button>
      </div>
    </div>
  </div>

    <script>
        getExercise(e) {
            this.opts.selectexercise(e.item.index)
            window.scrollTo(0, 0);
        }
    </script>
</pagecontrol>
