<calendar-app>
    
    <div class='col-xs-12 col-sm-5 mb15' ondrag={ keypresss }>
        <div class='full-width inline-item color1 white text-center mb5 br1'>
            <span class='glyphicon glyphicon-chevron-left pull-left' onclick={ minMonth }></span>
            { this.date.toString('MMMM yyyy') }
            <span class='glyphicon glyphicon-chevron-right pull-right' onclick={ plusMonth }></span>
        </div>
        <div class='day-box'>
            <div class="day text-center">M</div>
            <div class="day text-center">T</div>
            <div class="day text-center">W</div>
            <div class="day text-center">T</div>
            <div class="day text-center">F</div>
            <div class="day text-center">S</div>
            <div class="day text-center">S</div>
        </div>
        <div class='day-box mb15'>
            <div class={day: true, text-center: true, current: parent.isToday(index), planned: parent.hasPlanned(index)} each={ d,index in this.days } onclick={ parent.getDay }>
                { index >= parent.offset ? index - parent.offset + 1 : '' }
            </div>
        </div>
    </div>
    
    <div class='col-xs-12 col-sm-7' show={ this.dateSelected }>
        <div class='inline-item red color3 text-center mb15'>
            {this.dateSelected.toString('MMMM d yyyy')}
        </div>
        <h3 hide={ this.planned[this.dateSelected.getDate()] }>no exs</h3>
        <planned-list show={ this.planned[this.dateSelected.getDate()] } workouts= { this.workouts }></planned-list>
    <div>
    
    <script>
        const tag = this
        tag.dateSelected = false
        tag.workouts = this.opts.workouts
        tag.planned = {16: true, 2: true, 28: true}
        tag.date = Date.today()
        tag.today = Date.today()
        
        getDay(e) {
            var detail = new Date(tag.date)
            var day = e.item.index-tag.offset+1
            detail.set({ day: day }) 
            tag.dateSelected = tag.planned[detail.getDate()] ? detail : detail
            console.log(detail.getDate())
            tag.update()
        }
        
        initDays() {
            tag.daysInMonth = parseInt(tag.date.moveToLastDayOfMonth().toString('dd'))
            tag.offset = tag.date.moveToFirstDayOfMonth().getDay()
            tag.offset = tag.offset ? tag.offset -1 : tag.offset + 6
            tag.numOfDays = tag.daysInMonth+tag.offset
            tag.days = new Array(tag.numOfDays)
        }
        tag.initDays()
        
        isToday(index) {
            var isSameDay = tag.today.getDate() + tag.offset - 1 == index
            var isSameMonth = tag.today.getMonth() == tag.date.getMonth()
            return isSameDay && isSameMonth;
        }
        
        
        keypresss(e) {
            console.log(e)
        }
        
        minMonth() {
            tag.date = tag.date.add(-1).months() 
            tag.initDays()
            tag.update()
        }
        
        hasPlanned(index) {
            return tag.planned[index-tag.offset+1]
        }
        
        plusMonth() {
            tag.date = tag.date.add(1).months()
            tag.initDays()
            tag.update()
        }
    </script>
    
</calendar-app>
