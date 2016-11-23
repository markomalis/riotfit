<pagecontrol>
  <div class='row'>
    <div class='col-xs-6 col-xs-offset-3'>
      <div class="btn-group full-width">
        <button type="button" class="btn btn-lg btn-default">
          Personal Records
          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          Statisticals
          <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          add
          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-lg btn-default">
          <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
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
