/**
 * 
 */

$(function () {
    
    Morris.Bar({
        element: 'bar_chart',
        data: [{
            x: '~\\25000원',
            y: '587326',
        }, {
                x: '최대 \\25000~ \\50000원',
                y: '434720',
            }, {
                x: '최대 \\50000원~ \\100000원',
                y: '653219',
            }, {
                x: '100000원이상',
                y: '154340',
            }],
        xkey: 'x',
        ykeys: ['y'],
        labels: ['금액대별 거래량'],
        barColors: ['rgb(0, 150, 136)'],
    });
    $('#statics-image__btn').click(function() {
        pdfPrint().then();
    })

    

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