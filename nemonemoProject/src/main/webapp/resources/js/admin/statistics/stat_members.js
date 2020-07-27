var homeBar = Morris.Line({
    element: 'line_chart',
    data: [

        { year: '2016', value: 30 },
        { year: '2017', value: 10 },
        { year: '2018', value: 5 },
        { year: '2019', value: 5 },
        { year: '2020', value: 20 }
    ],
    xkey: 'year',
    ykeys: ['value'],
    labels: ['value'],
    resize: true
});

var profileBar = Morris.Line({
    element: 'line_chart2',
    data: [
        { y: '2016', a: 100, b: 90 },
        { y: '2017', a: 75, b: 65 },
        { y: '2018', a: 50, b: 40 },
        { y: '2019', a: 75, b: 65 },
        { y: '2020', a: 50, b: 40 },
    ],
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Series A', 'Series B'],
    hideHover: 'always',
    resize: true
});

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var target = $(e.target).attr("href") // activated tab

    switch (target) {
        case "#home":
            homeBar.redraw();
            $(window).trigger('resize');
            break;
        case "#profile":
            profileBar.redraw();
            $(window).trigger('resize');
            break;
    }
});






