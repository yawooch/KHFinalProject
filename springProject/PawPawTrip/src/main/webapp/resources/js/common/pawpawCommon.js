function footerSink()
{
	let windowHeight    = $(window).height();
	let htmlHeight      = $('html').outerHeight().toFixed(0);
	let bodyHeight      = $('body').outerHeight().toFixed(0);
	let navHeight       = $('nav.navbar').outerHeight().toFixed(0);
	let footerHeight    = $('footer').outerHeight();
	let containerHeight = (bodyHeight - navHeight - footerHeight).toFixed(0);
	let contentHeight   = 0;
	
	$('body>.content').each((idx, ele)=>{
		console.log($(ele).outerHeight());
		contentHeight   += $(ele).outerHeight();
	});
	contentHeight = Math.floor(contentHeight);
	
	console.log(`windowHeight    : ${windowHeight}
htmlHeight      : ${htmlHeight}
bodyHeight      : ${bodyHeight}
navHeight       : ${navHeight}
footerHeight    : ${footerHeight}
containerHeight : ${containerHeight}
contentHeight   : ${contentHeight}`);
	
//	if(containerHeight > contentHeight)
//	{
//		$('#tempaltemo_footer').css('position', 'absolute');
//		console.log('absolute');
//	}
//	else
//	{
//		$('#tempaltemo_footer').css('position', 'relative');
//		console.log('relative');
//		
//	}
}
$(document).ready(()=>{
	const move = function() {
		const boardText = document.querySelector('#test1');
		
		boardText.style.color = "#B29254";
		
	}
	footerSink();
})