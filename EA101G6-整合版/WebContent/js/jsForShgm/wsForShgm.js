var mbrno = document.getElementById("mbrno").value;
var MyPoint = "/mainPage/" + mbrno;
var host = window.location.host;
var path = window.location.pathname;
var webCtx = path.substring(0, path.indexOf('/', 1));
var endPointURL = "ws://" + host + webCtx + MyPoint;// 使用者位址

var webSocket;

//在mainPage.jsp
var $sellsuccess = $("#sellsuccess").text();

//在listAllShgm.jsp
var $shgmno = $("#wsShgmno").val();

//在infoPage.jsp
var $buysuccess = $("#buysuccess").val();

var jsondata;

if (mbrno !== '') {
	console.log(endPointURL);

	webSocket = new WebSocket(endPointURL);// 建立連線到伺服器端→

	webSocket.onopen = function(event) {// 成功連線，伺服器端回應←
		console.log('success');
		//後台向伺服器送出資料
		if($shgmno !== '' && $shgmno !== undefined){
			//只送pk，從pk取值
			webSocket.send($shgmno);
		}
		
		//送出上架需要審核的市集商品
		if($sellsuccess !== '' && $sellsuccess !== undefined){
			sendSellSuccess();
		}
		
		if($buysuccess !== '' && $buysuccess !== undefined){
			sendBuySuccess();
		}
		
	};

	webSocket.onmessage = function(event) {// 接收伺服器端回應的json字串←
		let timerInterval
		Swal.fire({
		  title: event.data,
		  html: '<b></b>秒內自動關閉',
		  timer: 5000,
		  timerProgressBar: true,
		  onBeforeOpen: () => {
		    Swal.showLoading()
		    timerInterval = setInterval(() => {
		      const content = Swal.getContent()
		      if (content) {
		        const b = content.querySelector('b')
		        if (b) {
		          b.textContent = Swal.getTimerLeft()
		        }
		      }
		    }, 100)
		  },
		  onClose: () => {
		    clearInterval(timerInterval)
		  }
		}).then((result) => {
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log('I was closed by the timer')
		  }
		})
	};

	webSocket.onclose = function(event) {// 成功關閉，伺服器端回應←
		console.log('closed');
	};
	
	function sendSellSuccess(){
		webSocket.send($sellsuccess);
		if($sellsuccess !== ''){
			Swal.fire({
			  icon: 'success',
			  title: '您已成功新增市集商品',
			  text: '請等待後台審核',
			  showConfirmButton: false,
			  timer: 1500
			})
		}
	}
	
	function sendBuySuccess(){
		var $shgmno = $("#shgmno").val();
		if($buysuccess === "success"){
			Swal.fire({
				  icon: 'success',
				  title: '您已購買成功！',
				  showConfirmButton: false,
				  timer: 1500
				})
			var successObj = {
				"shgmno":$shgmno,
				"paystatus":1
			}
			var successJson = JSON.stringify(successObj);
			webSocket.send(successJson);
		}
	}
	
	
	

}