$(function(){
    function pageLoad(){
        
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        
        var $calendar = $('#calendar').fullCalendar({
            
        	header: {
                left: '',
                center: '',
                right: ''
            },

            selectable: true,
            selectHelper: true,
            select: function(start, end, allDay) {
                var $modal = $("#edit-modal"),
                    $btn = $('#create-event');
                $btn.off('click');
                $btn.click(function () {
                    var title = $("#event-name").val();
                    if (title) {
                        $calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay,
                                backgroundColor: '#64bd63',
                                textColor: '#fff'
                            },
                            true
                        );
                    }
                    $calendar.fullCalendar('unselect');
                });
                $modal.modal('show');
                $calendar.fullCalendar('unselect');
            },
            editable: true,
            droppable:true,

            

            // 받아온 정보로 이벤트 추가
            events: function(start, end, callback) {
    	        $.ajax({
    	            url: 'schedule',
    	            method : 'get',
    	            success: function(doc) {
    	                var events = [];
    	                for(var c = 0; c <doc.events.length; c++ ) {
    	                    events.push({
    	                    	id: "aaa",
    	                        title: doc.events[c].title,
    	                        allDay: true,
    	                        start: doc.events[c].start,
    	                        backgroundColor: '#e5603b',
    	                        textColor: '#fff'
    	                    });
    	                }
    	                callback(events);
    	            }/*
    		        , error : function(resp, statusCode) {
    		        	alert(resp + " "+ statusCode);
    		        }*/
    	        });
    	    }

        });

        
        
        $("#calendar-switcher").find("label").click(function(){
            $calendar.fullCalendar( 'changeView', $(this).find('input').val() )
        });

        var currentDate = $calendar.fullCalendar('getDate');

        $('#calender-current-date').html(
                $.fullCalendar.formatDate(currentDate, "MMM yyyy") +
                " - <span class='fw-semi-bold'>" +
                $.fullCalendar.formatDate(currentDate, "dddd") +
                "</span>"
        );


        $('#calender-prev').click(function(){
            $calendar.fullCalendar( 'prev' );
            currentDate = $calendar.fullCalendar('getDate');
            $('#calender-current-date').html(
                    $.fullCalendar.formatDate(currentDate, "MMM yyyy") +
                    " - <span class='fw-semi-bold'>" +
                    $.fullCalendar.formatDate(currentDate, "dddd") +
                    "</span>"
            );
        });
        $('#calender-next').click(function(){
            $calendar.fullCalendar( 'next' );
            currentDate = $calendar.fullCalendar('getDate');
            $('#calender-current-date').html(
                    $.fullCalendar.formatDate(currentDate, "MMM yyyy") +
                    " - <span class='fw-semi-bold'>" +
                    $.fullCalendar.formatDate(currentDate, "dddd") +
                    "</span>"
            );
        });
    }
    pageLoad();
    SingApp.onPageLoad(pageLoad);
});