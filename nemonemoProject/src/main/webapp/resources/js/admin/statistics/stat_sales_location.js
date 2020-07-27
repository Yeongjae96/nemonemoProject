/**
 * 
 */

$(function () {
    
    Morris.Donut({
        element: 'bar_chart',
        data: [{
            label: '서울',
            value: 21
        }, {
                label: '경기도',
                value: 17
            }, {
                label: '강원도',
                value: 7
            }, {
                label: '충청북도',
                value: 12
            }, {
                label: '충청남도',
                value: 11
            }, {
                label: '전라북도',
                value: 7
            }, {
                label: '전라남도',
                value: 8
            }, {
                label: '경상북도',
                value: 7
            }, {
                label: '경상남도',
                value: 11
            }, {
                label: '제주도',
                value: 1
            }],
        colors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)', 'rgb(255, 152, 0)', 'rgb(22, 150, 136)', 'rgb(121, 30, 99)', 'rgb(123, 222, 212)', 'rgb(131, 152, 0)', 'rgb(0, 54, 255)', 'rgb(255, 0, 42)', 'rgb(132, 255, 100)'],
        formatter: function (y) {
            return y + '%'
        }
    });

    

});


function pdfPrint() {
    html2canvas($('#bar_chart *')[0]).then(function(canvas) {
        var w = document.getElementById("bar_chart").offsetWidth;
        var h = document.getElementById("bar_chart").offsetHeight;
        
        var imgData = canvas.toDataURL('image/png', 1);
        var doc= new jsPDF('L', 'pt', [w, h]);
        doc.addImage(imgData, 'PNG', 10, 10, w, h);
        doc.save('sample-file.pdf');
    }).catch(function(e) {
        console.log(e.message);
    });
}









function getMorris(type, element) {
    if (type === 'line') {
        Morris.Line({
            element: element,
            data: [
                {
                'period': '2011 Q3',
                'licensed': 3407,
                'sorned': 660
                }, 
                {
                    'period': '2011 Q2',
                    'licensed': 3351,
                    'sorned': 629
                }, {
                    'period': '2011 Q1',
                    'licensed': 3269,
                    'sorned': 618
                }, {
                    'period': '2010 Q4',
                    'licensed': 3246,
                    'sorned': 661
                }, {
                    'period': '2009 Q4',
                    'licensed': 3171,
                    'sorned': 676
                }, {
                    'period': '2008 Q4',
                    'licensed': 3155,
                    'sorned': 681
                }, {
                    'period': '2007 Q4',
                    'licensed': 3226,
                    'sorned': 620
                }, {
                    'period': '2006 Q4',
                    'licensed': 3245,
                    'sorned': null
                }, {
                    'period': '2005 Q4',
                    'licensed': 3289,
                    'sorned': null
                }],
            xkey: 'period',
            ykeys: ['licensed', 'sorned'],
            labels: ['Licensed', 'Off the road'],
            lineColors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)'],
            lineWidth: 3
        });
    } else if (type === 'bar') {
        Morris.Bar({
            element: element,
            data: [{
                x: '2011 Q1',
                y: 3,
                z: 2,
                a: 3
            }, {
                    x: '2011 Q2',
                    y: 2,
                    z: null,
                    a: 1
                }, {
                    x: '2011 Q3',
                    y: 0,
                    z: 2,
                    a: 4
                }, {
                    x: '2011 Q4',
                    y: 2,
                    z: 4,
                    a: 3
                }],
            xkey: 'x',
            ykeys: ['y', 'z', 'a'],
            labels: ['Y', 'Z', 'A'],
            barColors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)', 'rgb(0, 150, 136)'],
        });
    } else if (type === 'area') {
        Morris.Area({
            element: element,
            data: [{
                period: '2010 Q1',
                iphone: 2666,
                ipad: null,
                itouch: 2647
            }, {
                    period: '2010 Q2',
                    iphone: 2778,
                    ipad: 2294,
                    itouch: 2441
                }, {
                    period: '2010 Q3',
                    iphone: 4912,
                    ipad: 1969,
                    itouch: 2501
                }, {
                    period: '2010 Q4',
                    iphone: 3767,
                    ipad: 3597,
                    itouch: 5689
                }, {
                    period: '2011 Q1',
                    iphone: 6810,
                    ipad: 1914,
                    itouch: 2293
                }, {
                    period: '2011 Q2',
                    iphone: 5670,
                    ipad: 4293,
                    itouch: 1881
                }, {
                    period: '2011 Q3',
                    iphone: 4820,
                    ipad: 3795,
                    itouch: 1588
                }, {
                    period: '2011 Q4',
                    iphone: 15073,
                    ipad: 5967,
                    itouch: 5175
                }, {
                    period: '2012 Q1',
                    iphone: 10687,
                    ipad: 4460,
                    itouch: 2028
                }, {
                    period: '2012 Q2',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }],
            xkey: 'period',
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['iPhone', 'iPad', 'iPod Touch'],
            pointSize: 2,
            hideHover: 'auto',
            lineColors: ['rgb(233, 30, 99)', 'rgb(0, 188, 212)', 'rgb(0, 150, 136)']
        });
    } else if (type === 'donut') {
       
    }
}