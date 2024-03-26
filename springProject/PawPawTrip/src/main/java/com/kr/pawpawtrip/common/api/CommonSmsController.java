package com.kr.pawpawtrip.common.api;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@RestController // @Controller + @ResponseBody가 합쳐진 형태로 JSON 형태의 객체 데이터를 반환
public class CommonSmsController {

    final DefaultMessageService messageService;

    public CommonSmsController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSUTKR0D0IXAJYJ", "OGKHX84E3BV4VX5T11WQHSJNYWGBR09G", "https://api.coolsms.co.kr");
    }
    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/send-one")
    public SingleMessageSentResponse sendOne(@RequestParam String memberPhone, @RequestParam int generatedCode) 
    {
        Message message = new Message();
        
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01033954663");//From 발신번호는 SMS 신청시 대표번호를 입력한다.
        message.setTo(memberPhone);
        message.setText("[포포트립] 아래의 인증번호를 입력해주세요.\n" + generatedCode);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));

        return response;
    }
    /**
     * 관리자 화면 
     * 여러 메시지 발송 예제
     * 한 번 실행으로 최대 10,000건 까지의 메시지가 발송 가능합니다.
     */
    @PostMapping("/sendMessages")
    public MultipleDetailMessageSentResponse sendMessages(@RequestParam String memberPhone, @RequestParam String sendingMessages) {
        ArrayList<Message> messageList  = new ArrayList<>();
        String[]           memberPhones = new String[1];

        //;세미콜론으로 구분하여 핸드폰번호를 나눈다
        if(memberPhone.contains(";")) 
        {
            memberPhones = memberPhone.split(";").clone();
        }
        else 
        {
            memberPhones[0] = memberPhone;
        }
        
        log.info("memberPhones : {}", memberPhones);
        
        for (int i = 0; i < memberPhones.length; i++) {
            String phoneNumber = memberPhones[i];
            Message message = new Message();
            message.setFrom("01033954663");
            message.setTo(phoneNumber);
            message.setText(sendingMessages);
            
            messageList.add(message);
        }
        try {
            MultipleDetailMessageSentResponse response = this.messageService.send(messageList, false, true);
            return response;
        }
        catch (Exception exception)
        {
            System.out.println(exception.getMessage());
        }
        return null;
    }

    /** 잔액 조회 예제 */
    @GetMapping("/get-balance")
    public Balance getBalance()
    {
        Balance balance = this.messageService.getBalance();
        System.out.println(balance);

        return balance;
    }
}