window.onload = function(){
	// 도메인 직접 입력 or domain option 선택
	let domainList = document.getElementById('domain-list');
	let domainTxt = document.getElementById('domain-txt');
	
	// select 옵션 변경시
	domainList.addEventListener('change', (event) => {
		// option에 있는 도메인 선택 시
		if(event.target.value !== "type") {
			// 선택한 도메인을 input에 입력하고 disabled
			domainTxt.value = event.target.value;
			domainTxt.disabled = true;
			// 직접 입력 시
		} else {
			// input 내용 초기화 & 입력 가능하도록 변경
			domainTxt.value = "";
			domainTxt.disabled = false;
		}
	 });
	 
	 // 이메일 합치기
	 $('#enroll-form').on('submit', () => {
		 let emailId     = $('#email-id').val();
		 let domainId    = $('#domain-txt').val();
		 let memberEmail = "";
		 
	 	 memberEmail     = emailId + "@" + domainId;
	 	
	 	$('#memberEmail').val(memberEmail);
	 });
	 
	 	 
	 
	// '출생 연도' 셀렉트 박스 option 목록 동적 생성
	let birthYearEl = document.querySelector('#birth-year')
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isYearOptionExisted) {
	    isYearOptionExisted = true
	    for(var i = 1940; i <= 2024; i++) {
	      // option element 생성
	      let YearOption = document.createElement('option')
	      YearOption.setAttribute('value', i)
	      YearOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(YearOption);
	    }
	  }
	});
	
	// '출생 연도' 셀렉트 박스 option 목록 동적 생성
	let birthMonthEl = document.querySelector('#birth-month')
	// option 목록 생성 여부 확인
	isMonthOptionExisted = false;
	birthMonthEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isMonthOptionExisted) {
	    isMonthOptionExisted = true
	    for(var i = 1; i <= 12; i++) {
	      // option element 생성
	      let MonthOption = document.createElement('option')
	      MonthOption.setAttribute('value', i)
	      MonthOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(MonthOption);
	    }
	  }
	});
	
	// '출생 연도' 셀렉트 박스 option 목록 동적 생성
	let birthDayEl = document.querySelector('#birth-day')
	// option 목록 생성 여부 확인
	isDayOptionExisted = false;
	birthDayEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isDayOptionExisted) {
	    isDayOptionExisted = true
	    for(var i = 1; i <= 31; i++) {
	      // option element 생성
	      let DayOption = document.createElement('option')
	      DayOption.setAttribute('value', i)
	      DayOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(DayOption);
	    }
	  }
	});
	
	// 생년월일 합치기
	$('#enroll-form').on('submit', () => {
		let year = $('#birth-year').val();
		let month = $('#birth-month').val();
		let day = $('#birth-day').val();
		let memberBirth = "";
		
		month = month < 10 ? '0' + month : month;
		day = day < 10 ? '0' + day : day; 
		
		memberBirth = year + month + day;
		
		$('#memberBrith').val(memberBirth);
	});


	// 1. 비밀번호 입력창 정보 가져오기
    let elInputPassword = document.querySelector('#password');
    // 2. 비밀번호 확인 입력창 정보 가져오기
    let elInputPasswordRetype = document.querySelector('#password-retype');
    // 3. 실패 메시지 정보 가져오기 (비밀번호 불일치)
    let elMismatchMessage = document.querySelector('.mismatch-message ');
    // 4. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자 미사용)
    let elStrongPasswordMessage = document.querySelector('.strongPassword-message');

	// 비번 정규식 체크
    function strongPassword(str) {
        return /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,15}$/.test(str);
    }
    // 비번 일치 확인
    function isMatch(password1, password2) {
	return password1 === password2;
    }
    
    // 비번 조건에 맞게 입력했는지 체크
	elInputPassword.onkeyup = function() {
		if (elInputPassword.value.length !== 0) {
			if (strongPassword(elInputPassword.value)) {
				elStrongPasswordMessage.classList.add("hide"); // 실패 메시지가 가려져야 함
			} else {
				elStrongPasswordMessage.classList.remove("hide"); // 실패 메시지가 보여야 함
			}
		}
		else {
			elStrongPasswordMessage.classList.add("hide");
		}
	};
	
	// 비번, 비번확인 일치여부 체크
	elInputPasswordRetype.onkeyup = function() {
		if (elInputPasswordRetype.value.length !== 0) {
			if (isMatch(elInputPassword.value, elInputPasswordRetype.value)) {
				elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
			}
			else {
				elMismatchMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
			}
		}
		else {
			elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
		}
	};
	
	// 전체 동의하기
	$("#all_Agree").on("click", (event) => {
	if (event.target.checked == true) {
		$(".options").prop("checked", true);
	} else {
		$(".options").prop("checked", false);
	}
	});
	
	
	
	
    
    
    
    
}




	



