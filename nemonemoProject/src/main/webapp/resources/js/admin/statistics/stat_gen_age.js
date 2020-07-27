var homeBar = Morris.Donut({
    element: 'donut_chart',
    data: [
        {
            value: 40,
            label: '여자'
        }, {
            value: 40,
            label: '남자'
        }, {
            value: 20,
            label: '그 외'
        }
    ],
    colors: [
        'rgb(255, 152, 0)', 'rgb(233, 30, 99)', 'rgb(0, 188, 212)', 
    ],
    formatter: function (x) {
        return x + "%"
    },
    resize: true
});

var profileBar = Morris.Line({
    element: 'line_chart',
    data: [
        { y: '2016', '10대': 100, '20대': 90, '30대':50, '40대' : 60, '50대':30, '60대':20 },
        { y: '2017', '10대': 10, '20대': 60, '30대':40, '40대' : 60, '50대':10, '60대':60 },
        { y: '2018', '10대': 40, '20대': 40, '30대':50, '40대' : 10, '50대':20, '60대':70 },
        { y: '2019', '10대': 50, '20대': 30, '30대':70, '40대' : 50, '50대':0, '60대':30 },
        { y: '2020', '10대': 70, '20대': 70, '30대':20, '40대' : 30, '50대':20, '60대':50 },
    ],
    xkey: 'y',
    ykeys: ['10대', '20대','30대','40대','50대','60대'],
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