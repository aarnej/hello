using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian as Date;
using Toybox.Time as Time;
using Toybox.ActivityMonitor as Activ;

var days = ["--", "SU", "MA", "TI", "KE", "TO", "PE", "LA"];

class helloView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    
        
        
        // Get and show the current time
        var clockTime = Sys.getClockTime();
        //var timeHString = Lang.format("$1$", [clockTime.hour]);
        //var timeMString = Lang.format("$1$", [clockTime.min.format("%02d")]);
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        //var view = View.findDrawableById("TimeHLabel");
        //view.setText(timeHString);
        //view = View.findDrawableById("TimeMLabel");
        //view.setText(timeMString);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString);
        
        view = View.findDrawableById("BatteryLabel");
        var stats = Sys.getSystemStats();
        var batteryString = Lang.format("$1$%", [stats.battery.toNumber()]);
        view.setText(batteryString);
        
        var time = Time.now();
        var info = Date.info(time, Date.FORMAT_SHORT);
        var dowString = days[info.day_of_week];
        view = View.findDrawableById("DowLabel");
        view.setText(dowString);
        var day = info.day;
        var month = info.month;
        var dateString = Lang.format("$1$.$2$.", [day, month]);
        view = View.findDrawableById("DateLabel");
        view.setText(dateString);
        
        /*
        var iter = Activ.getHeartRateHistory(5, true);
        var sum = 0;
        var count = 0;
        var sample = iter.next();
        	
        while(sample.heartRate != Activ.INVALID_HR_SAMPLE) {
        	Sys.println(sample.heartRate);
        	sum += sample.heartRate;
        	count++;
        	sample = iter.next();
        }
        
        var aver = sum/count;
        
        view = View.findDrawableById("HRLabel");
        view.setText(Lang.format("$1$", [aver]));
        */
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
