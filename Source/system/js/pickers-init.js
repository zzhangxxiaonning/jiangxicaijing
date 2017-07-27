if (top.location != location) {
    // top.location.href = document.location.href ;
}
$(function(){
    // window.prettyPrint && prettyPrint();

    // disabling dates
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    var checkin = $('.dpd1').datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        language: 'zh',
        onRender: function(date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function(ev) {
            if (ev.date.valueOf() > checkout.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                checkout.setValue(newDate);
            }
            checkin.hide();
            $('.dpd2')[0].focus();
        }).data('datetimepicker');
    var checkout = $('.dpd2').datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        language: 'zh',
        onRender: function(date) {
            return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function(ev) {
            checkout.hide();
        }).data('datetimepicker');
});