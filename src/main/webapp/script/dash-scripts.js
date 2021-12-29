$(document).ready(function() {
	const sidebarToggle = document.body.querySelector('#sidebarToggle');
	if (sidebarToggle) {
		sidebarToggle.addEventListener('click', event => {
			event.preventDefault();
			document.body.classList.toggle('sb-sidenav-toggled');
			localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
		});
	}

	//not allow special characters
	$('#title').on('keypress', function (event) {
    let regex = new RegExp("^[a-z A-Z0-9ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$");
    let key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
       event.preventDefault();
       return false;
    }
	});
	
	//not allow special characters and number
	$('.name').on('keypress', function (event) {
    let regex = new RegExp("^[a-z A-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$");
    let key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
       event.preventDefault();
       return false;
    }
	});
	
	//Delete button
	$('#delbutton').on('click', function () {
		$('#idnotice').html('');
		let c = $(":checkbox");
		
		if(c.is(':checked')){
			$('#confirm').modal('show');
			$(':checkbox:checked').each(function(){
				$('#idnotice').append($(this).val()+' ');
			})
		}else{
			$('#delnotice').modal('show');
		}
	});

	//format input
	$('.money').mask('000,000,000,000,000', {reverse: true});
	$('#phonenumber').mask('0000-000-000-0000-000-000');

	//open ckfinder
	$('#uploadimage').on('click', function () {
	        let finder = new CKFinder();
	        finder.selectActionFunction = function (url) {
	            $('#image').val(url);
	        }
	        finder.popup();
	});

	//reset form confirmation
	$('#reset').click(function(event) {
		if (!confirm('Bạn có chắc reset và nhập lại không?')) {
			event.preventDefault();
		}
	})
	
	//open alert function
	function alert(message, type) {
	  let html = document.createElement('div')
	  html.innerHTML = '<div class="alert alert-trim alert-' + type + ' alert-dismissible" role="alert">'
							+ message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
	  $('#lert').append(html)
	}

	//Camp validation
	$('#save').on('click', function() {
		$(".alert").hide();
		
		let title = $('#title').val();
		let discription = $('#discription').val();
		let startdate = $('#startdate').val();
		let enddate = $('#enddate').val();
		let targetmoney = $('#targetmoney').val();
		let image = $('#image').val();

		if (title == '') {
			alert('Bạn chưa nhập vào tiêu đề!', 'danger');
			return false;
		}
		if (discription == '') {
			alert('Bạn chưa nhập mô tả cho chiến dịch!', 'danger');
			return false;
		}
		if (image == '') {
			alert('Bạn chưa chọn ảnh đại diện cho chiến dịch!', 'danger');
			return false;
		}
		if (startdate == '') {
			alert('Bạn chưa nhập ngày bắt đầu!', 'danger');
			return false;
		}
		if (enddate == '') {
			alert('Bạn chưa nhập ngày kết thúc!', 'danger');
			return false;
		}
		if (targetmoney == '') {
			alert('Bạn chưa nhập số tiền cần quyên góp cho chiến dịch!', 'danger');
			return false;
		}

		if (startdate > enddate) {
			alert('Ngày đã nhập không hợp lệ!', 'danger');
			$('#startdate').focus();
			return false;
		}
		
		$('#confirm').modal('show');
	})
	
	//User validation
	$('#adduser').on('click', function() {
		$(".alert").hide();
		let email = $('#email').val();
		let password = $('#password').val();
		let firstname = $('#firstname').val();
		let lastname = $('#lastname').val();

		if (email == '') {
			alert('Bạn chưa nhập email!', 'danger');
			$('#notice').show();
			return false;
		}else if(!IsEmail(email)){
			alert('Email đã nhập không hợp lệ!', 'danger');
			return false;
		}
		if (password == '') {
			alert('Bạn chưa nhập mật khẩu!', 'danger');
			return false;
		}else if(password.length<8){
			alert('Mật khẩu ít nhất 8 ký tự!', 'danger');
			return false;
		}
		if(!$('#avatar').val()){
			alert('Bạn chưa chọn ảnh đại diện!', 'danger');
			return false;
		}
		if (firstname == ''||lastname == '') {
			alert('Bạn chưa nhập họ tên!', 'danger');
			return false;
		}
		
		function IsEmail(email) {
        let regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email)) {
           return false;
        }else{
           return true;
        }
      }
		$('#confirm').modal('show'); 
	})
	
	//admin profile validation
	$('#saveadminprofile').on('click', function() {
		$(".alert").hide();
		let firstname = $('#firstname').val();
		let lastname = $('#lastname').val();

		if (firstname == ''||lastname == '') {
			alert('Họ tên không thể để trống!', 'danger');
			return false;
		}
		$('#changeadminprofile').modal('show'); 
	})
	
	//upload image validation
	$('#submitavatar').on('click',function(){
		if(!$('#avatar').val()){
			$('#avatarerror').text('Bạn chưa chọn ảnh!');
			return false;
		}
	})

})