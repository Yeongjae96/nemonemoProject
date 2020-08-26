
/* CUSTOMER 네비게이션 */
$(function () {
    	$('.customer-nav-not-selected').eq(3).attr('class', 'customer-nav-selected');
     
    });

/* QNA 리스트 열기 */
    $(function () {
        $('.qna_open_btn').click(function () {
            $(this).next().slideToggle();
            $(this).children('span').toggleClass('qna_article_rotate');            
            $(this).children('div').children('h1').toggleClass('bold_text');
            $(this).children('qna_reply_flag').children('h1').toggleClass('bold_text');
        });
    });
    

 
