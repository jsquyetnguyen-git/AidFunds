$(document).ready(function() {
	//open ckfinder
	$('#uploadimage').on('click', function () {
	        var finder = new CKFinder();
	        finder.selectActionFunction = function (url) {
	            $('#image').val(url);
	        }
	        finder.popup();
	});
	//name validation (not allow special characters and number)
	$('.name').on('keypress', function(event) {
		let regex = new RegExp("^[a-z A-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$");
		let key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
		if (!regex.test(key)) {
			event.preventDefault();
			return false;
		}
	});
	
	//phonenumber
	$('#phonenumber').mask('0000-000-000-0000-000-000');
	$('.money').mask('000,000,000,000,000', {reverse: true});

	//email validation
	function IsEmail(email) {
		let regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!regex.test(email)) {
			return false;
		} else {
			return true;
		}
	}

	//open alert function
	function alert(message, type) {
		var wrapper = document.createElement('div')
		wrapper.innerHTML = '<div class="alert alert-trim alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
		$('#lert').append(wrapper)
	}
	
	//load more and load less function
	items = $(".test").length;
    x=6;
    $('#camplist .test:lt('+x+')').show();
    
    $('#loadMore').click(function () {
        x= (x+3 <= items) ? x+3 : items;
        $('#camplist .test:lt('+x+')').show('fade');
    });
    $('#showLess').click(function () {
		y = (x%3==0)?3:x-(x%3)
        x=(x-3<0) ? 3 : y;
        $('#camplist .test').not(':lt('+x+')').hide('fade');
    });

	//change password validation
	$('#change-pass-confirm').on('click', function() {
		$(".alert").hide();
		let oldpassword = $('#oldpassword').val();
		let newpassword = $('#newpassword').val();
		let newrepassword = $('#newrepassword').val();

		if (oldpassword == '' || newpassword == '' || newrepassword == '') {
			alert('Mời nhập vào tất cả các thông tin!', 'danger');
			return false;
		}
		if (oldpassword == newpassword) {
			alert('Mật khẩu mới không thể trùng với mật khẩu cũ!', 'danger');
			return false;
		}
		if (newpassword.length < 8) {
			alert('Mật khẩu phải có ít nhất 8 ký tự!', 'danger');
			return false;
		}
		if (newpassword != newrepassword) {
			alert('Mật khẩu mới không khớp nhau!', 'danger');
			return false;
		}
	})

	//login validation
	$('#loginsubmit').on('click', function() {
		$('#emailnotice').text('');
		$('#passnotice').text('');
		let email = $('#email').val();
		let password = $('#password').val();

		if (email == '') {
			$('#emailnotice').text('Bạn chưa nhập email.');
			return false;
		} else if (!IsEmail(email)) {
			$('#emailnotice').text('Email không hợp lệ.');
			return false;
		}

		if (password == '') {
			$('#passnotice').text('Bạn chưa nhập mật khẩu.');
			return false;
		}
	})

	//register validation
	$('#registersubmit').on('click', function() {
		$('#namenotice').text('');
		$('#emailnotice').text('');
		let email = $('#email').val();
		let lastname = $('#lastname').val();
		let firstname = $('#firstname').val();

		if (lastname == '' || firstname == '') {
			$('#namenotice').text('Nhập đầy đủ họ tên.');
			return false;
		}

		if (email == '') {
			$('#emailnotice').text('Bạn chưa nhập email.');
			return false;
		} else if (!IsEmail(email)) {
			$('#emailnotice').text('Email không hợp lệ.');
			return false;
		}
	})

	//reset password validation
	$('#resetsubmit').on('click', function() {
		let email = $('#email').val();
		if (email == '') {
			$('#emailnotice').text('Nhập vào email của bạn.');
			return false;
		} else if (!IsEmail(email)) {
			$('#emailnotice').text('Email không hợp lệ.');
			return false;
		}
	})
	
	//user validation
	$('#saveprofile').on('click', function() {
		$(".alert").hide();
		let firstname = $('#firstname').val();
		let lastname = $('#lastname').val();

		if (firstname == ''||lastname == '') {
			alert('Họ tên không thể để trống!', 'danger');
			return false;
		}
		
		$('#changeprofile').modal('show'); 
	})
	
	//upload image validation
	$('#submitavatar').on('click',function(){
		if(!$('#avatar').val()){
			$('#avatarerror').text('Bạn chưa chọn ảnh!');
			return false;
		}
	})
	
	$(document).ready(function() {
        var height = Math.max($(".left").height(), $(".right").height());
        $(".left").height(height);
        $(".right").height(height);
    });

	//cancel radio button
	$('.other').on('click',function(){
		$('.btn-check').prop('checked', false);
	})
	
	//checkout validation
	$('#checkout').on('click', function() {
		$('#moneyerror').text('');
		$('#methoderror').text('');
		
		let money = $("input[name='money']:checked").length;
		let method = $("input[name='donationmethod']:checked").length;
		let othermoney = $('#othermoney').val();
		
		if (money == 0&&othermoney=='') {
			$('#moneyerror').text('Chọn số tiền muốn quyên góp hoặc điền vào số tiền.');
			return false;
		}

		if (method == 0) {
			$('#methoderror').text('Chọn phương thức quyên góp.');
			return false;
		}	
	})
	
	//lazy load image
    function load(img) {
        const url = img.getAttribute('lazyload-src')
        img.setAttribute('src', url)
    }

    if ('IntersectionObserver' in window) {    
        let observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    load(entry.target)
                }
            })
        });

        $("img[lazyload-src]").each(function(index, img) {
            observer.observe(img)
        });
    }

	
	
})